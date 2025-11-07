<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="application/json" %>
<%
    // Mapa para armazenar quantidade de cadastros por mês
    Map<Integer, Integer> cadastrosPorMes = new HashMap<>();
    for (int i = 1; i <= 12; i++) {
        cadastrosPorMes.put(i, 0);  // inicia com 0 para todos os meses
    }

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tea", "root", "");
        String sql = "SELECT MONTH(data_cadastro) as mes, COUNT(*) as total FROM usuario GROUP BY mes";
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int mes = rs.getInt("mes");
            int total = rs.getInt("total");
            cadastrosPorMes.put(mes, total);
        }
        rs.close();
        ps.close();
        con.close();
    } catch (Exception e) {
        // Tratar exceção se quiser
    }

    // Construir JSON manualmente
    out.print("{\"data\": [");
    for (int i = 1; i <= 12; i++) {
        out.print(cadastrosPorMes.get(i));
        if (i < 12) out.print(",");
    }
    out.print("]}");
%>
