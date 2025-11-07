<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Invalida a sessão
    session.invalidate();
    
    // Redireciona para a página inicial
    response.sendRedirect("index.jsp");
%>