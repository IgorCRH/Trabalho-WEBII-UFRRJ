<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        
        button:hover {
            background-color: #ffffff;
            color: #4682B4;
        }

    </style>
    
    <meta charset="UTF-8">
    <title>Tela Principal do Professor</title>
</head>
<body>

<h2>Bem-vindo, Professor!</h2>

<button onclick="window.location.href='cadastrarAula.jsp'">Cadastrar Aula</button>
<br>
<button onclick="window.location.href='gerarfrequencia.jsp'">Dar Frequência</button>
<br>

<form action="LogoutServlet" method="post">
    <button type="submit">Deslogar</button>
</form>

</body>
</html>
