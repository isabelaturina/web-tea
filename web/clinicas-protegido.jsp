<%@page import="java.net.URLEncoder"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("email") == null) {
        String mensagem = URLEncoder.encode("Faça seu login para acessar a clinicas proximas a voce", "UTF-8");
        String destino = URLEncoder.encode("clinicasprox.html", "UTF-8");
        response.sendRedirect("login.html?error=" + mensagem + "&destino=" + destino);
        return;
    } else {
        response.sendRedirect("clinicasprox.html");
    }
%>
