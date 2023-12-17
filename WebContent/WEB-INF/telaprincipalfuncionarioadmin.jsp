<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
     <style>
        body {
            background-color: #7DBEED;
            font-family: Arial, sans-serif;
            text-align: center;
        }

        h1 {
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
        display: block;
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
        
        button:hover {
            background-color: #ffffff;
            color: #4682B4;
        }

    </style>
    
    <meta charset="UTF-8">
    <title>Tela Principal do Funcionário</title>
</head>
<body>

<h1>Bem-vindo à Tela Principal do Funcionário</h1>

<button onclick="window.location.href='cadastraaluno.jsp'">Cadastrar Aluno</button>
<br>
<button onclick="window.location.href='cadastracurso.jsp'">Cadastrar Curso</button>
<br>
<button onclick="window.location.href='cadastradisciplina.jsp'">Cadastrar Disciplina</button>
<br>

<form action="LogoutServlet" method="post">
    <button type="submit">Deslogar</button>
</form>

</body>
</html>
