<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sistemauniversitario.AlunoDAO" %>
<%@ page import="sistemauniversitario.Aluno" %>

<!DOCTYPE html>
<html>
<head>

     <style>
        body {
            background-color: #7DBEED;
            font-family: Arial, sans-serif;
            text-align: center;
        }

        h1, h2 {
            line-height: 1;
            color: #21689C;
        }

        button {
            background-color: #21689C;
            color: #fff;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            cursor: pointer;
            background-color: lightblue;
        }
        
              input,
      button {
        
        margin: 0 auto;
		font-size: 20px;
        color: white;
        background-color: steelblue;
      }

        label {
            display: block;
            text-align: center;
            color: white;
            margin-bottom: 10px;
        }

        input[type="text"], input[type="password"] {
            padding: 8px;
            margin: 5px 0;
            box-sizing: border-box;
            width: 100%; 
        }

        
        input:hover {
            background-color: #ffffff;
            color: #4682B4;
        }
        
        button:hover {
            background-color: #ffffff;
            color: #4682B4;
        }

    </style>
    
    <meta charset="UTF-8">
    <title>Cadastrar Aluno</title>
</head>
<body>

<h2>Cadastrar Aluno</h2>

<form action="cadastraaluno.jsp" method="post">
    <label for="nome">Nome:</label>
    <input type="text" id="nome" name="nome" required>
    <br>
    <label for="login">Login:</label>
    <input type="text" id="login" name="login" required>
    <br>
    <label for="cpf">CPF:</label>
    <input type="text" id="cpf" name="cpf" required>
    <br>
    <label for="senha">Senha:</label>
    <input type="password" id="senha" name="senha" required>
    <br>
    <label for="email">E-Mail:</label>
    <input type="text" id="email" name="email" required>
    <br>
    <input type="submit" value="Cadastrar" name="alunocadastrado">
</form>

<%     if (request.getParameter("alunocadastrado") != null) {

        String nomeAluno = request.getParameter("nome");
        String loginAluno = request.getParameter("login");
        String cpfAluno = request.getParameter("cpf");
        String senhaAluno = request.getParameter("senha");
        String emailAluno = request.getParameter("email");


    AlunoDAO.cadastrarAluno(nomeAluno, loginAluno, cpfAluno, senhaAluno, emailAluno);
} %>

<form action="telaprincipalfuncionarioadmin.jsp">
    <button type="submit">Ir para Tela Principal do Funcionário</button>
</form>

</body>
</html>