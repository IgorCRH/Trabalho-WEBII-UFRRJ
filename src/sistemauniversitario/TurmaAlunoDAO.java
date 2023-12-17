package sistemauniversitario;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TurmaAlunoDAO {

    private static final String DB_URL = "jdbc:mysql://127.0.0.1:3306/sistemauniversitario";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    public static List<String> getAlunosDaTurma(String turma) {
        List<String> alunos = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String sql = "SELECT MatriculaAluno FROM Turma_Aluno WHERE NumeroTurma = ?";
                try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
                    pstmt.setString(1, turma);
                    try (ResultSet rs = pstmt.executeQuery()) {
                        while (rs.next()) {
                            String matriculaAluno = rs.getString("MatriculaAluno");

                            String nomeAluno = getNomeDoAluno(matriculaAluno, connection);
                            alunos.add(nomeAluno);
                        }
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return alunos;
    }

    private static String getNomeDoAluno(String matriculaAluno, Connection connection) throws SQLException {
        String sql = "SELECT Nome FROM Aluno WHERE Matricula = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, matriculaAluno);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("Nome");
                }
            }
        }
        return null;
    }
}

