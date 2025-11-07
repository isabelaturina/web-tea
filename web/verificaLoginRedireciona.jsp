<%@page import="java.net.URLEncoder"%>
<%
    String destino = request.getParameter("destino"); // recebe a página de destino
    if (session.getAttribute("email") == null) {
        String mensagem = URLEncoder.encode("Faça login para acessar nossa pagina exclusiva ", "UTF-8");
        destino = URLEncoder.encode(destino != null ? destino : "index.html", "UTF-8");
        response.sendRedirect("login.html?error=" + mensagem + "&destino=" + destino);
    } else {
        response.sendRedirect(destino);
    }
%>
