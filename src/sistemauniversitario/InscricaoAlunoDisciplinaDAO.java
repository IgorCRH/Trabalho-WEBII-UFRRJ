package sistemauniversitario;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class InscricaoAlunoDisciplinaDAO {
    private static final String DB_URL = "jdbc:mysql://127.0.0.1:3306/sistemauniversitario";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    public static List<String> getDisciplinas() {
        List<String> disciplinas = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String sql = "SELECT NomeDisciplina FROM Disciplinas";
                try (PreparedStatement pstmt = connection.prepareStatement(sql);
                     ResultSet rs = pstmt.executeQuery()) {
                    while (rs.next()) {
                        disciplinas.add(rs.getString("NomeDisciplina"));
                    }
                }
            } 
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return disciplinas;
    }
    

	public static String getCodigoDisciplina(String nomeDisciplina, Connection connection) throws SQLException {
        String codigoDisciplina = null;

        String sql = "SELECT CodigoDisciplina FROM Disciplinas WHERE NomeDisciplina = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, nomeDisciplina);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    codigoDisciplina = rs.getString("CodigoDisciplina");
                }
            }
        }

        return codigoDisciplina;
    }

	public static List<String> getTurmas(String disciplinaSelecionada) {
	    List<String> turmas = new ArrayList<>();

	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
	            // Obtém o código da disciplina a partir do nome
	            String codigoDisciplina = getCodigoDisciplina(disciplinaSelecionada, connection);

	            // Agora, podemos usar o códigoDisciplina para buscar as turmas
	            String sql = "SELECT NumeroTurma FROM Turma_Disciplina WHERE CodigoDisciplina = ?";
	            try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
	                pstmt.setString(1, codigoDisciplina);
	                try (ResultSet rs = pstmt.executeQuery()) {
	                    while (rs.next()) {
	                        turmas.add(rs.getString("NumeroTurma"));
	                    }
	                }
	            }
	        }
	    } catch (ClassNotFoundException | SQLException e) {
	        e.printStackTrace();
	    }

	    return turmas;
	}
	
    public static void inscreverAluno(String numerodaTurma, int matriculaAluno) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String sql = "INSERT INTO Turma_Aluno (NumeroTurma, MatriculaAluno) VALUES (?, ?)";
                try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
                    pstmt.setString(1, numerodaTurma);
                    pstmt.setInt(2, matriculaAluno);
                    pstmt.executeUpdate();
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
