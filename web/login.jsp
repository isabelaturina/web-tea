<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<%
    // Configurações do banco
    final String DB_URL = "jdbc:mysql://localhost:3306/tea";
    final String DB_USER = "root";
    final String DB_PASSWORD = "root";
    
    // Credenciais admin
    final String ADMIN_EMAIL = "adm@gmail.com";
    final String ADMIN_SENHA = "adm2025";
    
    // Obter parâmetros
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");
    
    // Verificar campos vazios
    if (email == null || email.trim().isEmpty()) {
        response.sendRedirect("login.html?error=Digite+o+email");
        return;
    }
    if (senha == null || senha.trim().isEmpty()) {
        response.sendRedirect("login.html?error=Digite+a+senha");
        return;
    }
    
    // Verificar admin
    if (email.equalsIgnoreCase(ADMIN_EMAIL)) {
        if (senha.equals(ADMIN_SENHA)) {
            session.setAttribute("email", ADMIN_EMAIL);
            session.setAttribute("tipoUsuario", "admin");
            response.sendRedirect("gerenciar_usuarios.jsp");
            return;
        } else {
            response.sendRedirect("login.html?error=Senha+do+admin+incorreta");
            return;
        }
    }
    
    // Verificar usuário normal
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        
        String sql = "SELECT id, nome, email, data_cadastro FROM usuario WHERE email = ? AND senha_hash = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, email);
        stmt.setString(2, senha);
        
        rs = stmt.executeQuery();
        
        if (rs.next()) {
            // Login válido
            session.setAttribute("usuarioId", rs.getInt("id"));
            session.setAttribute("nome", rs.getString("nome"));
            session.setAttribute("email", rs.getString("email"));
            session.setAttribute("tipoUsuario", "usuario");
           Date dataCadastro = rs.getDate("data_cadastro");
if (dataCadastro != null) {
    String dataFormatada = new SimpleDateFormat("dd/MM/yyyy").format(dataCadastro);
    session.setAttribute("dataCadastro", dataFormatada);
} else {
    session.setAttribute("dataCadastro", "Data não disponível");
}

            response.sendRedirect("perfil.jsp");
            
        } else {
            // Verificar se o erro é no email ou senha
            String checkEmailSql = "SELECT email FROM usuario WHERE email = ?";
            PreparedStatement checkEmailStmt = conn.prepareStatement(checkEmailSql);
            checkEmailStmt.setString(1, email);
            ResultSet emailRs = checkEmailStmt.executeQuery();
            
            if (emailRs.next()) {
                response.sendRedirect("login.html?error=Senha+incorreta");
            } else {
                response.sendRedirect("login.html?error=Email+nao+cadastrado");
            }
        }
    } catch (Exception e) {
        response.sendRedirect("login.html?error=Erro+no+sistema");
        e.printStackTrace();
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (stmt != null) stmt.close(); } catch (Exception e) {}
        try { if (conn != null) conn.close(); } catch (Exception e) {}
    }
%>