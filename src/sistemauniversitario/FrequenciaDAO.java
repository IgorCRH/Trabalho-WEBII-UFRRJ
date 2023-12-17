package sistemauniversitario;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class FrequenciaDAO {
    private static final String DB_URL = "jdbc:mysql://127.0.0.1:3306/sistemauniversitario";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    public static void inserirFrequencia(int aula, String disciplina, String[] alunosPresentes) {

    	try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String sql = "INSERT INTO Frequencia (IDAula, CodigoDisciplina, AlunosPresentes) VALUES (?, ?, ?)";
                try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
                    String codigoDisciplina = InscricaoAlunoDisciplinaDAO.getCodigoDisciplina(disciplina, connection);
                    
                    if (aula != -1) {
                        pstmt.setInt(1, aula);

                        if (codigoDisciplina != null && !codigoDisciplina.isEmpty()) {
                            pstmt.setInt(2, Integer.parseInt(codigoDisciplina));
                        }

                        // Converte o array de alunosPresentes para uma string separada por vírgulas
                        String alunosPresentesStr = String.join(",", alunosPresentes);
                        pstmt.setString(3, alunosPresentesStr);

                        pstmt.executeUpdate();
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
