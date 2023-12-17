package sistemauniversitario;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class AlunoDAO {
    private static final String DB_URL = "jdbc:mysql://127.0.0.1:3306/sistemauniversitario";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    public static void cadastrarAluno(String nome, String login, String cpf, String senha, String email) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String sql = "INSERT INTO Aluno (Nome, Login, CPF, Senha, Email) VALUES (?, ?, ?, ?, ?)";
                try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
                    pstmt.setString(1, nome);
                    pstmt.setString(2, login);
                    pstmt.setString(3, cpf);
                    pstmt.setString(4, senha);
                    pstmt.setString(5, email);
                    pstmt.executeUpdate();
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
    
    public static List<String> getMatriculasDosAlunos(String numeroTurma) {
        List<String> matriculas = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String sql = "SELECT MatriculaAluno FROM Turma_Aluno WHERE NumeroTurma = ?";
                try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
                    pstmt.setString(1, numeroTurma);
                    try (ResultSet rs = pstmt.executeQuery()) {
                        while (rs.next()) {
                            matriculas.add(rs.getString("MatriculaAluno"));
                        }
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return matriculas;
    }
    
    public static List<String> getNomesDosAlunos(String numeroTurma) {
        List<String> nomes = new ArrayList<String>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String sql = "SELECT Nome FROM Aluno WHERE Matricula IN "
                        + "(SELECT MatriculaAluno FROM Turma_Aluno WHERE NumeroTurma = ?)";
                try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
                    pstmt.setString(1, numeroTurma);
                    try (ResultSet rs = pstmt.executeQuery()) {
                        while (rs.next()) {
                            nomes.add(rs.getString("Nome"));
                        }
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return nomes;
    }

}