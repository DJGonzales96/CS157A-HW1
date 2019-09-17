<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JDBC Connection example</title>
</head>
<body>
<h1>JDBC Connection example</h1>

<%
	String db = "cs157a";
	String user = "root";
	String password = "password";
	
	try {
		java.sql.Connection con;
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost/cs157a", user, password);
		out.println(db + " database successfully opened.<br/>");
		
		out.println("Initial entries in table \"emp\": <br/>");
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM emp");
        while (rs.next()) {
            out.println(rs.getInt(1) + " " + rs.getString(2) + " " + rs.getInt(3) + "<br/><br/>");
        }
        
        rs.close();
        stmt.close();
        con.close();
	}
	catch(SQLException e) {
		out.println("SQLException caught: " + e.getMessage());
	}
%>
</body>
</html>