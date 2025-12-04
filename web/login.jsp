<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%!
    // =========================================================================
    // Bloco de Declaração para a função hashSenha (Compartilhada com cadastro.jsp)
    // =========================================================================
    // Função para gerar o HASH da Senha (SHA-256) - Essencial para comparar senhas
    String hashSenha(String s) throws Exception {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] hash = md.digest(s.getBytes("UTF-8"));
        StringBuilder hex = new StringBuilder();
        for (byte b : hash) hex.append(String.format("%02x", b));
        return hex.toString();
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Teamais</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>

<%
    // Variáveis de feedback e parâmetros de entrada
    String mensagem = "";
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");

    // -------------------------------------------------------------------------
    // 2. LÓGICA DE PROCESSAMENTO DO FORMULÁRIO (POST)
    // -------------------------------------------------------------------------
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        
        // 🔑 VARIÁVEIS DE AMBIENTE (PARA DEPLOY NO AZURE)
        String userDB = System.getenv("DB_USER");
        String passwordDB = System.getenv("DB_PASS");
        String dbName = System.getenv("DB_NAME");
        String jdbcUrlBase = System.getenv("JDBC_URL"); 
        
        // Monta a URL de conexão com SSL para Azure
        String url = null;
        if (jdbcUrlBase != null && dbName != null) {
            url = jdbcUrlBase + "/" + dbName + 
                  "?useSSL=true&requireSSL=true&verifyServerCertificate=false&serverTimezone=UTC";
        }
        
        try {
            if (email == null || email.trim().isEmpty() || senha == null || senha.trim().isEmpty()) {
                mensagem = "Erro: Todos os campos devem ser preenchidos.";
            } else if (url == null || userDB == null || passwordDB == null) {
                // Mensagem de erro para quando não há variáveis de ambiente configuradas localmente
                mensagem = "❌ Erro de Configuração: Variáveis de ambiente (DB_USER, DB_PASS, JDBC_URL, DB_NAME) não encontradas. Configure-as localmente ou faça o deploy no Azure.";
            } else {

                // 1. Tenta conectar ao banco de dados
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conecta = DriverManager.getConnection(url, userDB, passwordDB);

                // 2. Busca o usuário pelo email
                String sql = "SELECT nome, senha_hash, tipo_usuario, data_cadastro FROM usuario WHERE email = ?";
                PreparedStatement st = conecta.prepareStatement(sql);
                st.setString(1, email);
                
                ResultSet rs = st.executeQuery();

                if (rs.next()) {
                    // Usuário encontrado
                    String nomeUsuario = rs.getString("nome");
                    String senhaHashDB = rs.getString("senha_hash");
                    String tipoUsuario = rs.getString("tipo_usuario") != null ? rs.getString("tipo_usuario") : "usuario";
                    Timestamp dataCadastroTS = rs.getTimestamp("data_cadastro");
                    String dataCadastro = new SimpleDateFormat("dd/MM/yyyy").format(new java.util.Date(dataCadastroTS.getTime()));
                    
                    // 3. Compara o hash da senha digitada com o hash do banco de dados
                    if (hashSenha(senha).equals(senhaHashDB)) {
                        // Login bem-sucedido
                        session.setAttribute("email", email);
                        session.setAttribute("nome", nomeUsuario);
                        session.setAttribute("tipoUsuario", tipoUsuario);
                        session.setAttribute("dataCadastro", dataCadastro);
                        
                        mensagem = "✅ Login realizado com sucesso! Redirecionando...";
                        %>
                        <script>
                            setTimeout(function() {
                                window.location.href = 'perfil.jsp';
                            }, 1500);
                        </script>
                        <%
                    } else {
                        mensagem = "❌ Email ou senha incorretos.";
                    }
                } else {
                    mensagem = "❌ Email ou senha incorretos.";
                }

                rs.close();
                st.close();
                conecta.close();
            }
        } catch (SQLException e) {
            // Este é o bloco que pegará o Access denied se a senha do Azure estiver errada
            mensagem = "❌ Erro no banco de dados. Detalhe: " + e.getMessage();
        } catch (Exception e) {
            mensagem = "❌ Erro geral: " + e.getMessage();
        }
    }
%>

<form method="post">
    <div class="container">
        <div class="right-side">
            <a href="index.jsp" class="back-link"><i class="fas fa-arrow-left"></i> Voltar</a>    
            <h2>Faça seu Login</h2>
            
            <%-- Exibe a mensagem de status do login --%>
            <% if (!mensagem.isEmpty()) { %>
                <p style="color: <%= mensagem.startsWith("❌") ? "red" : "green" %>; font-weight: bold; margin-bottom: 15px;">
                    <%= mensagem %>
                </p>
            <% } %>

            <div id="loginForm">
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required placeholder="Digite seu email"
                           value="<%= email != null ? email : "" %>">
                </div>
                <div class="form-group">
                    <label for="senha">Senha:</label>
                    <div class="password-input-wrapper">
                        <input type="password" id="senha" name="senha" required placeholder="Digite sua senha">
                        <button type="button" class="toggle-password" aria-label="Mostrar senha">
                            <i class="fas fa-eye-slash"></i>
                        </button>
                    </div>
                </div>
                <button type="submit">Entrar</button>
                <div class="cadastro-link">
                    Não tem uma conta? <a href="cadastro.jsp">Cadastrar</a>
                </div>
            </div>
        </div>
    </div>
</form>
        
<script>
    // Lógica de visualização da senha
    document.addEventListener('DOMContentLoaded', function() {
        const togglePassword = document.querySelector('.toggle-password');
        const passwordInput = document.getElementById('senha');
        
        if (togglePassword) {
             togglePassword.addEventListener('click', function() {
                 const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
                 passwordInput.setAttribute('type', type);
                  
                 const icon = this.querySelector('i');
                 if (type === 'text') {
                     icon.classList.remove('fa-eye-slash');
                     icon.classList.add('fa-eye');
                 } else {
                     icon.classList.remove('fa-eye');
                     icon.classList.add('fa-eye-slash');
                 }
             });
        }
    }); 
</script>
        
</body>
</html>