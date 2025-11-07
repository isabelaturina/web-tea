<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Verifica se a sessão já contém informações de login
    String nome = (String) session.getAttribute("nome");
    String email = (String) session.getAttribute("email");
    String tipoUsuario = (String) session.getAttribute("tipoUsuario");

    if (nome == null || email == null || tipoUsuario == null) {
        // Não está logado, redireciona para login.html
        response.sendRedirect("login.html");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Área Protegida</title>
</head>
<body>
    <h1>Bem-vindo, <%= nome %>!</h1>
    <p>Você está logado como <strong><%= tipoUsuario %></strong>.</p>
    <p>Email: <%= email %></p>

    <a href="logout.jsp">Sair</a>
</body>
</html>
