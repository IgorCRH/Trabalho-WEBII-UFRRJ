import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Constantes para informações de conexão com o banco de dados
    private static final String DB_URL = "jdbc:mysql://127.0.0.1:3306/sistemauniversitario";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("login");
        String password = request.getParameter("senha");

        // Realizar autenticação no banco de dados
        String role = null;
		try {
			role = authenticate(username, password);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        if (role != null) {
            // As credenciais correspondem a um usuário cadastrado
            HttpSession session = request.getSession();
            session.setAttribute("role", role);
            session.setAttribute("login",username);

            // Redirecionar para a página correspondente ao papel do usuário
            String redirectPage = getRedirectPage(role);
            response.sendRedirect(redirectPage);
        } else {
            // Redirecionar de volta para a página de login em caso de falha na autenticação
            response.sendRedirect("login.jsp");
        }
    }

    private String authenticate(String username, String password) throws ClassNotFoundException {
        String role = null;
        
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        	// Verificar na tabela Aluno
            if (checkCredentials(connection, "Aluno", username, password)) {
                role = "Aluno";
            }

            // Verificar na tabela Professor
            if (role == null && checkCredentials(connection, "Professor", username, password)) {
                role = "Professor";
            }

            // Verificar na tabela FuncionarioAdministrativo
            if (role == null && checkCredentials(connection, "FuncionarioAdministrativo", username, password)) {
                role = "FuncionarioAdministrativo";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return role;
    }

    private boolean checkCredentials(Connection connection, String tableName, String username, String password)
            throws SQLException {
        String query = "SELECT * FROM " + tableName + " WHERE Login=? AND Senha=?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                return resultSet.next();
            }
        }
    }

    private String getRedirectPage(String role) {
        switch (role) {
            case "Aluno":
                return "telaprincipalaluno.jsp";
            case "Professor":
                return "telaprincipalprofessor.jsp";
            case "FuncionarioAdministrativo":
                return "telaprincipalfuncionarioadmin.jsp";
            default:
                return "login.jsp";
        }
    }
}
