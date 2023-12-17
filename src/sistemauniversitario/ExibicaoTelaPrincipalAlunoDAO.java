package sistemauniversitario;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ExibicaoTelaPrincipalAlunoDAO {

    public static int getMatricula(String login) {
        int matricula = 0;
        String url = "jdbc:mysql://127.0.0.1:3306/sistemauniversitario";
        String usuarioDB = "root";
        String senhaDB = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conexao = DriverManager.getConnection(url, usuarioDB, senhaDB);

            String sql = "SELECT Matricula FROM Aluno WHERE Login = ?";
            try (PreparedStatement pstmt = conexao.prepareStatement(sql)) {
                pstmt.setString(1, login);
                ResultSet rs = pstmt.executeQuery();
                if (rs.next()) {
                    matricula = rs.getInt("Matricula");
                }
            }

            conexao.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return matricula;
    }
}