<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="sistemauniversitario.CursosDAO" %>
<%@ page import="sistemauniversitario.Curso" %>
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
    <title>Cadastrar Curso</title>
</head>
<body>

<h2>Cadastrar Curso</h2>

<form action="cadastracurso.jsp" method="post">
    <label for="nomeCurso">Nome do Curso:</label>
    <input type="text" id="nomeCurso" name="nomeCurso" required>
    <br>
    <label for="departamento">Departamento:</label>
    <input type="text" id="departamento" name="departamento" required>
    <br>
    <input type="submit" value="Cadastrar" name="cursocadastrado">
</form>

<%     if (request.getParameter("cursocadastrado") != null) {

        String cursoSelecionado = request.getParameter("nomeCurso");
        String deptSelecionado = request.getParameter("departamento");


    CursosDAO.cadastrarCurso(cursoSelecionado, deptSelecionado);
} %>

<form action="telaprincipalfuncionarioadmin.jsp">
    <button type="submit">Ir para Tela Principal do Funcionário</button>
</form>


</body>
</html>
