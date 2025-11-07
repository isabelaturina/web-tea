<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Verifica se o usuário está logado
    if (session.getAttribute("email") == null) {
        request.setAttribute("message", "Você precisa estar logado para acessar seu perfil.");
        request.setAttribute("redirect", "perfil.jsp");
        request.getRequestDispatcher("login-required.jsp").forward(request, response);
        return;
    }

    // Dados do usuário
    String nomeUsuario = (String) session.getAttribute("nome");
    String emailUsuario = (String) session.getAttribute("email");
    String tipoUsuario = (String) session.getAttribute("tipoUsuario");
    String dataCadastro = (String) session.getAttribute("dataCadastro");
    
    if (tipoUsuario == null) tipoUsuario = "usuario";
    String inicialNome = nomeUsuario != null && !nomeUsuario.isEmpty() ? 
                        nomeUsuario.substring(0, 1).toUpperCase() : "?";
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Meu Perfil - TEA+</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/perfil.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <header>
            <div class="container nav-container">
                <a href="index.jsp" class="logo">TEA+</a>
                <div class="nav-links">
                    <a href="index.jsp">Início</a>
                    <% if (session.getAttribute("email") != null) { %>
                     
                        <a href="logout.jsp">Sair</a>
                    <% } else { %>                    
                        <a href="login.html">Login</a>
                        <a href="cadastro.html">Cadastre-se</a>
                    <% } %>
                </div>
            </div>
        </header>
        
        <main class="container">
            <div class="profile-container">
                <!-- Sidebar do Perfil -->
                <div class="profile-sidebar">
                    <div class="profile-avatar">
                        <%= inicialNome %>
                    </div>
                    <div class="profile-info">
                        <h2><%= nomeUsuario != null ? nomeUsuario : "Usuário" %></h2>
                        <p><%= emailUsuario %></p>
                        <span class="badge <%= tipoUsuario.equals("admin") ? "badge-admin" : "badge-primary" %>">
                            <%= tipoUsuario.equals("admin") ? "Administrador" : "Usuário" %>
                        </span>
                    </div>
                    
                    <ul class="profile-menu">
                        <li><a href="perfil.jsp" class="active">Visão Geral</a></li>                                        
                    </ul>
                </div>
                
                <!-- Conteúdo Principal -->
                <div class="profile-content">
                    <div class="profile-header">
                        <h1>Visão Geral do Perfil</h1>
                    </div>
                    
                    <div class="profile-details">
                        <div class="detail-card">
                            <h3>Nome Completo</h3>
                            <p><%= nomeUsuario != null ? nomeUsuario : "Não informado" %></p>
                        </div>
                        
                        <div class="detail-card">
                            <h3>Email</h3>
                            <p><%= emailUsuario %></p>
                        </div>
                        
                        <div class="detail-card">
                            <h3>Tipo de Conta</h3>
                            <p><%= tipoUsuario.equals("admin") ? "Administrador" : "Usuário Regular" %></p>
                        </div>
                        
                        <div class="detail-card">
                            <h3>Data de Cadastro</h3>
                            <p><%= dataCadastro != null ? dataCadastro : "Data não disponível" %></p>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </body>
</html>