<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="application/json; charset=UTF-8" %>
<%
// Mapa: mês -> total
Map<Integer, Integer> cadastrosPorMes = new HashMap<>();
for (int m = 1; m <= 12; m++) cadastrosPorMes.put(m, 0);

 try {
Class.forName("com.mysql.cj.jdbc.Driver");

// CORREÇÃO APLICADA AQUI: Use a variável do Azure diretamente
String url = System.getenv("JDBC_URL"); 
String userDB = System.getenv("DB_USER");
String passwordDB = System.getenv("DB_PASS");

Connection con = DriverManager.getConnection(url, userDB, passwordDB);

String sql = "SELECT MONTH(data_cadastro) AS mes, COUNT(*) AS total " +
"FROM usuario WHERE data_cadastro IS NOT NULL GROUP BY mes ORDER BY mes";

PreparedStatement ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery();

while (rs.next()) {
cadastrosPorMes.put(rs.getInt("mes"), rs.getInt("total"));
}

rs.close();
ps.close();
con.close();

} catch (Exception e) {
// Para debug no Azure, você pode logar o erro, mas não o imprima em JSON de produção.
// Caso queira imprimir o erro para teste:
         out.print("{\"error\": \"" + e.getMessage().replace("\"", "'") + "\"}");
}

// JSON de resposta
out.print("{\"data\": [");
for (int i = 1; i <= 12; i++) {
out.print(cadastrosPorMes.get(i));
if (i < 12) out.print(",");
}
out.print("]}");
%>