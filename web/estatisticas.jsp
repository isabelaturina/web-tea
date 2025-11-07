<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Estatísticas - TEA+</title>
    <link href="css/estatisticas.css" rel="stylesheet" type="text/css"/>
    <!-- Incluindo Chart.js para gráficos -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <div class="header">
        <h1>Estatísticas - TEA+</h1>
    </div>

    <div class="menu">
       
        <a href="gerenciar_usuarios.jsp">Gerenciar Usuários</a>
        <a href="estatisticas.jsp" class="active">Estatísticas</a>
        <a href="logout.jsp" style="float:right">Sair</a>
    </div>

    <div class="container">
        <div class="content">
            <h2>Estatísticas do Sistema</h2>
            
            <div class="stats-container">
                <%
                    Connection conexao = null;
                    Statement stmt = null;
                    ResultSet rs = null;
                    
                    int totalUsuarios = 0;
                    int usuariosUltimoMes = 0;
                    
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        String url = "jdbc:mysql://localhost:3306/tea";
                        String user = "";
                        String password = "";
                        
                        conexao = DriverManager.getConnection(url, user, password);
                        
                        // Total de usuários
                        stmt = conexao.createStatement();
                        rs = stmt.executeQuery("SELECT COUNT(*) AS total FROM usuario");
                        if (rs.next()) {
                            totalUsuarios = rs.getInt("total");
                        }
                        
                        // Usuários no último mês
                        rs = stmt.executeQuery("SELECT COUNT(*) AS total FROM usuario WHERE data_cadastro >= DATE_SUB(NOW(), INTERVAL 1 MONTH)");
                        if (rs.next()) {
                            usuariosUltimoMes = rs.getInt("total");
                        }
                    } catch (Exception e) {
                        out.println("Erro: " + e.getMessage());
                    } finally {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conexao != null) conexao.close();
                    }
                %>
                
                <div class="stat-card">
                    <div class="stat-value"><%= totalUsuarios %></div>
                    <div class="stat-label">Total de Usuários</div>
                </div>
                
                <div class="stat-card">
                    <div class="stat-value"><%= usuariosUltimoMes %></div>
                    <div class="stat-label">Novos Usuários (último mês)</div>
                </div>
                
                <div class="stat-card">
                    <div class="stat-value">0</div>
                    <div class="stat-label">Atividades Hoje</div>
                </div>
            </div>
            
            <div class="chart-container">
                <canvas id="cadastrosChart"></canvas>
            </div>
        </div>
    </div>

    <script>
    document.addEventListener('DOMContentLoaded', function() {
    const ctx = document.getElementById('cadastrosChart').getContext('2d');
    const cadastrosChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'],
            datasets: [{
                label: 'Cadastros por Mês',
                data: [],  // inicial vazio
                backgroundColor: '#0066cc',
                borderColor: 'rgba(76, 175, 80, 1)',
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                y: { beginAtZero: true }
            }
        }
    });

    // Função para buscar os dados e atualizar gráfico
    function atualizarGrafico() {
        fetch('cadastrosPorMes.jsp')
        .then(response => response.json())
        .then(data => {
            cadastrosChart.data.datasets[0].data = data.data;
            cadastrosChart.update();
        })
        .catch(error => console.error('Erro ao carregar dados:', error));
    }

    atualizarGrafico(); // chama inicialmente

    // Se quiser atualizar automaticamente a cada X segundos (exemplo: 60 segundos)
    // setInterval(atualizarGrafico, 60000);
});

    </script>
</body>
</html>