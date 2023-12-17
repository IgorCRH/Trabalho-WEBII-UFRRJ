<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="sistemauniversitario.InscricaoAlunoDisciplinaDAO" %>

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

        form {
            display: inline-block;
        }
        
        select {
        display: block;
        margin: 0 auto;
		font-size: 20px;
        color: white;
        background-color: steelblue;
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
%>

<h1>Inscrição em Disciplina</h1>

<form action="inscricaodisciplina.jsp" method="post">
    <label for="disciplinaSelect">Disciplina:</label>
    <select id="disciplinaSelect" name="disciplinaSelecionada">
        <option value="">Selecione uma disciplina</option>
        <c:forEach items="${disciplinas}" var="disciplina">
            <option value="${disciplina}" ${disciplina eq disciplinaSelecionada ? 'selected' : ''}>${disciplina}</option>
        </c:forEach>
    </select>
    <input type="submit" value="Confirmar a Disciplina">
    </form>

<form action="inscricaodisciplina.jsp" method="post">
    <label for="turmaSelect">Turma:</label>
    <select id="turmaSelect" name="turmaSelecionada">
        <option value="">Selecione uma turma</option>
        <c:forEach items="${turmas}" var="turma">
            <option value="${turma}">${turma}</option>
        </c:forEach>
    </select>
    
    <input type="submit" value="Inscrever-se" name="botaoinscricao">
</form>

<%     if (request.getParameter("botaoinscricao") != null) {
    // Obtém a matrícula do aluno do escopo da sessão
        Object matriculaAtributo = session.getAttribute("matricula");
        int matriculaAluno = (matriculaAtributo != null) ? (int) matriculaAtributo : 0;
        String turmaSelecionada = request.getParameter("turmaSelecionada");

    // Realiza a inserção na tabela Tabela_Aluno
    InscricaoAlunoDisciplinaDAO.inscreverAluno(turmaSelecionada, matriculaAluno);
} %>
</br>

<form action="telaprincipalaluno.jsp">
    <button type="submit">Ir para Tela Principal do Aluno</button>
</form>

</body>
</html>
