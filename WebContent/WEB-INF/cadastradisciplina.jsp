<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="sistemauniversitario.DisciplinasDAO" %>
<%@ page import="sistemauniversitario.CursosDAO" %>

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
    <title>Cadastrar Disciplina</title>
</head>
<body>

<h2>Cadastrar Disciplina</h2>

<%
    List<Integer> cursos = CursosDAO.listarCursos();
    session.setAttribute("cursos", cursos);
%>

<form action="cadastradisciplina.jsp" method="post">
    <label for="nomeDisciplina">Nome da Disciplina:</label>
    <input type="text" id="nomeDisciplina" name="nomeDisciplina" required>
    <br>
    <label for="departamento">Departamento:</label>
    <input type="text" id="departamento" name="departamento" required>
    <br>
    <label for="cursoSelect">Curso:</label>
    <select id="cursoSelect" name="cursoSelecionado">
        <option value="">Selecione um curso</option>
        <c:forEach items="${cursos}" var="curso">
            <option value="${curso}" ${curso eq cursoSelecionado ? 'selected' : ''}>${curso}</option>
        </c:forEach>
    </select>
    <br>
    <input type="submit" value="Cadastrar" name="disciplinacadastrada">
</form>

<%     if (request.getParameter("disciplinacadastrada") != null) {

        String disciplinaSelecionada = request.getParameter("nomeDisciplina");
        String departamento = request.getParameter("departamento");
        List<Integer> codigoCursoAtributo = (List<Integer>) session.getAttribute("cursos");
        int cursoAssociado = (codigoCursoAtributo != null && !codigoCursoAtributo.isEmpty()) ? codigoCursoAtributo.get(0) : 0;


    DisciplinasDAO.cadastrarDisciplina(disciplinaSelecionada, departamento, cursoAssociado);
} %>

<form action="telaprincipalfuncionarioadmin.jsp">
    <button type="submit">Ir para Tela Principal do Funcionário</button>
</form>

</body>
</html>