package sistemauniversitario;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CursosDAO {
    private static final String DB_URL = "jdbc:mysql://127.0.0.1:3306/sistemauniversitario";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    public static void cadastrarCurso(String nomeCurso, String departamento) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String sql = "INSERT INTO Cursos (NomeCurso, Departamento) VALUES (?, ?)";
                try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
                    pstmt.setString(1, nomeCurso);
                    pstmt.setString(2, departamento);
                    pstmt.executeUpdate();
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
    
    public static List<Integer> listarCursos() {
        List<Integer> cursos = new ArrayList<Integer>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String sql = "SELECT CodigoCurso, NomeCurso, Departamento FROM Cursos";
                try (PreparedStatement pstmt = connection.prepareStatement(sql);
                     ResultSet rs = pstmt.executeQuery()) {
                    while (rs.next()) {
                        int codigoCurso = rs.getInt("CodigoCurso");
                        cursos.add(codigoCurso);
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return cursos;
    }
}