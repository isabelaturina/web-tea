<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Gerenciar Usuários - TEA+</title>
    <link href="css/gerenciamento.css" rel="stylesheet" type="text/css"/>
</head>

<body>
    <div class="header">
        <h1>Gerenciar Usuários - TEA+</h1>
    </div>

    <div class="menu">
        
        <a href="gerenciar_usuarios.jsp" class="active">Gerenciar Usuários</a>
        <a href="estatisticas.jsp">Estatísticas</a>
        <a href="logout.jsp" style="float:right">Sair</a>
    </div>

    <div class="container">
        <div class="content">
            <h2>Lista de Usuários Cadastrados</h2>
            
            <div class="search-box">
                <form method="get" action="gerenciar_usuarios.jsp">
                    <input type="text" name="search" placeholder="Pesquisar por nome ou email...">
                    <button type="submit" class="btn">Buscar</button>
                </form>
            </div>
            
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Email</th>
                        <th>Data de Cadastro</th>                   
                    </tr>
                </thead>
                <tbody>
                    <%
                        Connection conexao = null;
                        PreparedStatement stmt = null;
                        ResultSet rs = null;
                        
                        try {
                           Class.forName("com.mysql.cj.jdbc.Driver");

                            String url = System.getenv("JDBC_URL") + "/" + System.getenv("DB_NAME") + "?useSSL=true&requireSSL=true&serverTimezone=UTC";
                            String userDB = System.getenv("DB_USER");
                            String passDB = System.getenv("DB_PASS");
                            conexao = DriverManager.getConnection(url, userDB, passDB);

                            
                            String searchTerm = request.getParameter("search");
                            String sql;
                            
                            if (searchTerm != null && !searchTerm.isEmpty()) {
                                sql = "SELECT * FROM usuario WHERE nome LIKE ? OR email LIKE ? ORDER BY id DESC";
                                stmt = conexao.prepareStatement(sql);
                                stmt.setString(1, "%" + searchTerm + "%");
                                stmt.setString(2, "%" + searchTerm + "%");
                            } else {
                                sql = "SELECT * FROM usuario ORDER BY id DESC";
                                stmt = conexao.prepareStatement(sql);
                            }
                            
                            rs = stmt.executeQuery();
                            
                            while (rs.next()) {
                                int id = rs.getInt("id");
                                String nome = rs.getString("nome");
                                String email = rs.getString("email");
                                String dataCadastro = rs.getString("data_cadastro"); // Supondo que existe este campo
                    %>
                    <tr>
                        <td><%= id %></td>
                        <td><%= nome %></td>
                        <td><%= email %></td>
                        <td><%= dataCadastro != null ? dataCadastro : "N/A" %></td>    
                    </tr>
                    <%
                            }
                        } catch (Exception e) {
                            out.println("<tr><td colspan='5'>Erro ao carregar usuários: " + e.getMessage() + "</td></tr>");
                        } finally {
                            if (rs != null) rs.close();
                            if (stmt != null) stmt.close();
                            if (conexao != null) conexao.close();
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>