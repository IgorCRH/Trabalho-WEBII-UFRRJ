<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="sistemauniversitario.InscricaoAlunoDisciplinaDAO" %>
<%@ page import="sistemauniversitario.AulasDAO" %>

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

        input[type="text"], input[type="password"] {
            padding: 8px;
            margin: 5px 0;
            box-sizing: border-box;
            width: 100%; 
        }
        
        select {
            padding: 8px;
            margin: 5px 0;
            box-sizing: border-box;
            width: 100%; 
            background-color: steelblue;
            color: white;
        }
        
        select:hover {
            background-color: #ffffff;
            color: #4682B4;
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
    <title>Inscrição em Disciplina</title>
    <script>
        function submitForm() {
            document.forms["mainForm"].submit();
        }
    </script>
</head>
<body>

<%
    List<String> disciplinas = InscricaoAlunoDisciplinaDAO.getDisciplinas();
    session.setAttribute("disciplinas", disciplinas);

    String disciplinaSelecionada = request.getParameter("disciplinaSelecionada");
    if (disciplinaSelecionada == null) {
        disciplinaSelecionada = ""; 
    }
    session.setAttribute("disciplinaSelecionada", disciplinaSelecionada);
    
    List<String> turmas = InscricaoAlunoDisciplinaDAO.getTurmas(disciplinaSelecionada);
    session.setAttribute("turmas", turmas);
    
    String turmaSelecionada = request.getParameter("turmaSelecionada");
    session.setAttribute("turmaSelecionada", turmaSelecionada);
%>

<h1>Cadastro de Aulas</h1>

<form id="mainForm" action="cadastrarAula.jsp" method="post" onsubmit="submitForm()">
    <label for="disciplinaSelect">Disciplina:</label>
    <select id="disciplinaSelect" name="disciplinaSelecionada" onchange="submitForm()">
        <option value="">Selecione uma disciplina</option>
        <c:forEach items="${disciplinas}" var="disciplina">
            <option value="${disciplina}" ${disciplina eq disciplinaSelecionada ? 'selected' : ''}>${disciplina}</option>
        </c:forEach>
    </select>

    <label for="turmaSelect">Turma:</label>
    <select id="turmaSelect" name="turmaSelecionada">
        <option value="">Selecione uma turma</option>
        <c:forEach items="${turmas}" var="turma">
            <option value="${turma}">${turma}</option>
        </c:forEach>
    </select>
    
    <label for="dataAula">Data da Aula:</label>
    <input type="text" id="dataAula" name="dataAula" placeholder="YYYY-MM-DD">
    <input type="hidden" id="turmaSelecionadaInput" name="turmaSelecionadaInput" value="<%=turmaSelecionada%>">
    <input type="hidden" id="disciplinaSelecionadaInput" name="disciplinaSelecionadaInput" value="<%=disciplinaSelecionada%>">
    <input type="submit" name="dataenviada" value="Enviar Data e Cadastrar Aula" onchange="submitForm()">
</form>

<%
    if (request.getParameter("dataenviada") != null){
        String dataAula = request.getParameter("dataAula");
        String disciplinaAlocada = (String) session.getAttribute("disciplinaSelecionada");
        String turmaAlocada = (String) session.getAttribute("turmaSelecionada");
        out.println("D: " + turmaAlocada);
        AulasDAO.cadastrarAula(dataAula, disciplinaAlocada, turmaAlocada);
    }

%>

<form action="telaprincipalprofessor.jsp">
    <button type="submit">Ir para Tela Principal do Professor</button>
</form>

</body>
</html>
