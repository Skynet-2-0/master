<%-- 
    Document   : editCalendar
    Created on : 11.des.2017, 15:57:22
    Author     : Ann Margrethe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Edit Kalender</title><p>
    </head>
     <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>
    <body>
        <h1>Kalender Edit</h1>
<%	
        String Calendar_ID = request.getParameter("Calendar_ID");
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
		
		String sql = "SELECT * FROM Calendar WHERE Calendar_ID ="+Calendar_ID+"";
		
		rs = st.executeQuery(sql);
		if(rs != null) {
			rs.next();
		%>
                
                <form name="frmUpdate" method="post" action="saveCalendar?Calendar_ID=<%=rs.getInt("Calendar_ID")%>" >	
		Endre dato eller hendelse
                <p><table width="428" border="1">	
			<tr>
				<th width="181">
				<div align="left">Calendar_ID </div></th>
				<td width="231"><%=rs.getInt("Calendar_ID")%></td>
			</tr>
			<tr>
				<th width="181">
				<div align="left">Dato </div></th>
				<td><input type="text" name="txtDato" size="20" value="<%=rs.getString("Dato")%>"></td>
			</tr>
			<tr>
				<th width="181">
				<div align="left">Hendelse </div></th>
				<td><input type="text" name="txtHendelse" size="20" value="<%=rs.getString("Hendelse")%>"></td>
			</tr>			
	
			</table> 
                        <p><input type="submit" value="Save">
		</form> 
		
		<% }
	  		
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