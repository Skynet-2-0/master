<%-- 
    Document   : saveLog
    Created on : 12.des.2017, 19:49:18
    Author     : evakristine
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Save blog post</title>
    </head>
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>
    <body>
        
        <%	
        String Log_ID = request.getParameter("Log_ID");
	String driverName = "com.mysql.jdbc.Driver";
        String hostName = "jdbc:mysql://localhost:3306/";
        String dbName = "Skybase";
        String userName = "root";
        String password = "root";
        
	Connection conn = null;
        Statement st = null;
        ResultSet rs = null;
	
	try {
		Class.forName(driverName);
		
		conn =  DriverManager.getConnection(hostName+ dbName, userName, password);
		
		st = conn.createStatement();
                
                String strLog_ID = request.getParameter("Log_ID");
		String strTitle = request.getParameter("txtTitle");
		String strContent = request.getParameter("txtContent");
		
		String sql = "UPDATE Log " +
                        "SET Title = '"+ strTitle + "' " +
                        "Content = '"+ strContent + "' " +
                        "WHERE Log_ID = '" + strLog_ID + "'  ";
		
		rs = st.executeQuery(sql);
		out.println("Record Update Successfully");
	  		
	  		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
			e.printStackTrace();
		}
	
		try {
			if(st!=null){
				st.close();
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
			e.printStackTrace();
		}
	%>
    </body>
</html>
