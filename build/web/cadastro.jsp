<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>TEA+</title>
</head>
<body>
<%
    String nome = request.getParameter("nome");
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");

    try {
        // Validação dos campos
        if (nome == null || nome.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            senha == null || senha.trim().isEmpty()) {

            out.print("<p style='color:red;'>Erro: Todos os campos devem ser preenchidos corretamente.</p>");
            return;
        }

        // Conectando ao banco de dados
        Connection conecta;
        PreparedStatement st;
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/tea";
        String user = "root";
        String passwordDB = "root";
        conecta = DriverManager.getConnection(url, user, passwordDB);

        // Inserindo dados na tabela 'usuario'
        String sql = "INSERT INTO usuario (nome, email, senha_hash) VALUES (?, ?, ?)";
        st = conecta.prepareStatement(sql);
        st.setString(1, nome);
        st.setString(2, email);
        st.setString(3, senha);
        st.executeUpdate();

        // Configurar a sessão do usuário (ADICIONADO)
        session.setAttribute("email", email);
        session.setAttribute("nome", nome);
        session.setAttribute("tipoUsuario", "usuario"); // Valor padrão
        session.setAttribute("dataCadastro", new SimpleDateFormat("dd/MM/yyyy").format(new Date()));

        // Fechando conexões
        st.close();
        conecta.close();

        // Redirecionando para a página 'perfil.jsp'
        response.sendRedirect("perfil.jsp");

    } catch (SQLException e) {
        String erro = e.getMessage();
        if (erro.contains("Duplicate entry")) {
    out.print("<p style='color:#1984D0;'>Email já cadastrado.</p>");
} else {
    out.print("<p style='color:#1984D0;'>Erro no banco de dados: " + erro + "</p>");
}
} catch (Exception e) {
    out.print("<p style='color:#1984D0;'>Erro geral: " + e.getMessage() + "</p>");
}

%>


</body>
</html>