<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="sistemauniversitario.InscricaoAlunoDisciplinaDAO" %>
<%@ page import="sistemauniversitario.AulasDAO" %>
<%@ page import="sistemauniversitario.TurmaAlunoDAO" %>
<%@ page import="sistemauniversitario.AlunoDAO" %>
<%@ page import="sistemauniversitario.FrequenciaDAO" %>

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
        
        checkbox {
            padding: 8px;
            margin: 5px 0;
            box-sizing: border-box;
            width: 100%; 
            background-color: steelblue;
            color: darkblue;   
        }
        
        button:hover {
            background-color: #ffffff;
            color: #4682B4;
        }

    </style>
    
    <meta charset="UTF-8">
    <title>Área de Frequência das Aulas</title>
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
    
    List<String> aulas = AulasDAO.obterAulasDaTurma(turmaSelecionada);
    session.setAttribute("aulas", aulas);
    
    String aulaSelecionada = request.getParameter("aulaSelecionada");
    session.setAttribute("aulaSelecionada", aulaSelecionada);
    
    int idaulaSelecionada = AulasDAO.obterIDAulaSelecionada(aulaSelecionada);
    session.setAttribute("idaulaSelecionada", idaulaSelecionada);
    
    List<String> alunosDaTurma = TurmaAlunoDAO.getAlunosDaTurma(turmaSelecionada);
    session.setAttribute("alunosDaTurma", alunosDaTurma);
%>

<h1>Área de Frequência das Aulas</h1>

<form id="mainForm" action="gerarfrequencia.jsp" method="post" onsubmit="submitForm()">
    <label for="disciplinaSelect">Disciplina:</label>
    <select id="disciplinaSelect" name="disciplinaSelecionada" onchange="submitForm()">
        <option value="">Selecione uma disciplina</option>
        <c:forEach items="${disciplinas}" var="disciplina">
            <option value="${disciplina}" ${disciplina eq disciplinaSelecionada ? 'selected' : ''}>${disciplina}</option>
        </c:forEach>
    </select>

    <label for="turmaSelect">Turma:</label>
    <select id="turmaSelect" name="turmaSelecionada" onchange="submitForm()">
        <option value="">Selecione uma turma</option>
        <c:forEach items="${turmas}" var="turma">
            <option value="${turma}">${turma}</option>
        </c:forEach>
    </select>
    
    <label for="AulaSelect">Aula:</label>
    <select id="AulaSelect" name="aulaSelecionada">
        <option value="">Selecione uma aula</option>
        <c:forEach items="${aulas}" var="aula">
            <option value="${aula}">${aula}</option>
        </c:forEach>
    </select>


    <div id="studentsDiv">
    <%
        List<String> matriculas = AlunoDAO.getMatriculasDosAlunos(turmaSelecionada);
        List<String> nomes = AlunoDAO.getNomesDosAlunos(turmaSelecionada);

        for (int i = 0; i < matriculas.size(); i++) {
            String matricula = matriculas.get(i);
            String nome = nomes.get(i);
    %>
            <input type="checkbox" name="alunosPresentes" value="<%= nome %>" />
            <label><%= nome %></label>
            <br />
    <%
        }
    %>
</div>
  <button type="submit" name="enviafrequencia" value="enviafrequencia">Enviar Frequência</button>  
</form>

<%
if (request.getParameter("enviafrequencia") != null) {

    String[] alunosPresentes = request.getParameterValues("alunosPresentes");
    session.setAttribute("alunosPresentes", alunosPresentes);

    if (alunosPresentes != null) {
        FrequenciaDAO.inserirFrequencia(idaulaSelecionada, disciplinaSelecionada, alunosPresentes);
    } else {
    	out.println("Não há alunos nesta turma.");
    }
}

%>

<form action="telaprincipalprofessor.jsp">
    <button type="submit">Ir para Tela Principal do Professor</button>
</form>

</body>
</html>
