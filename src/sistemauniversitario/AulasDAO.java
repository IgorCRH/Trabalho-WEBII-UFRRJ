package sistemauniversitario;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AulasDAO {
    private static final String DB_URL = "jdbc:mysql://127.0.0.1:3306/sistemauniversitario";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    public static void cadastrarAula(String dataAula, String disciplina, String turma) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String sql = "INSERT INTO Aulas (Data, CodigoDisciplina, IDTurmaAluno) VALUES (STR_TO_DATE(?, '%Y-%m-%d'), ?, ?)";
                try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
                    // Supondo que o código da disciplina seja obtido de alguma forma
                    String codigoDisciplina = InscricaoAlunoDisciplinaDAO.getCodigoDisciplina(disciplina, connection);

                    // Verifique se codigoDisciplina não é nulo ou vazio antes de converter
                    if (codigoDisciplina != null && !codigoDisciplina.isEmpty()) {
                        pstmt.setString(1, dataAula);
                        pstmt.setInt(2, Integer.parseInt(codigoDisciplina));

                        // Verifique se turma não é nulo ou vazio antes de converter
                        if (turma != null && !turma.isEmpty()) {
                            pstmt.setInt(3, Integer.parseInt(turma));
                            pstmt.executeUpdate();
                        } else {
                            System.err.println("Turma é nula ou vazia. Não foi possível cadastrar aula.");
                        }
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
    
    public static List<String> obterAulasDaTurma(String idTurma) {
        List<String> aulas = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String sql = "SELECT ID, Data, CodigoDisciplina FROM Aulas WHERE IDTurmaAluno = ?";
                try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
                    pstmt.setString(1, idTurma);

                    try (ResultSet rs = pstmt.executeQuery()) {
                        while (rs.next()) {
                            String data = rs.getString("Data");

                            aulas.add(data);
                        }
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return aulas;
    }
    public static int obterIDAulaSelecionada(String aulaSelecionada) {
        int idAula = -1;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String sql = "SELECT ID FROM Aulas WHERE Data = ?";
                try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
                    pstmt.setString(1, aulaSelecionada);

                    try (ResultSet rs = pstmt.executeQuery()) {
                        if (rs.next()) {
                            idAula = rs.getInt("ID");
                        }
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return idAula;
    }

}

