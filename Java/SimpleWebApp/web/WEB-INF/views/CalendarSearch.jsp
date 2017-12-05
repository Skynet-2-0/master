<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : CalendarSearch
    Created on : 14.nov.2017, 10:48:34
    Author     : Ann Margrethe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Post View</title>
    </head>
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>


        <body>
            <h1>Kalender Søk</h1>

            

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

            <%
            
        //String id = request.getParameter("Log_ID");
        String driverName = "com.mysql.jdbc.Driver";
        String hostName = "jdbc:mysql://localhost:3306/";
        String dbName = "Skybase";
        String userName = "root";
        String password = "root";
        try {
        Class.forName(driverName);
        } catch (ClassNotFoundException e) {
        e.printStackTrace();
        }
        Connection conn = null;
        Statement st = null;
        ResultSet rs = null;
        %>
            <table 
                cellpadding = "10" cellspacing = "10" border = "1">
              
                     <tr bgcolor = "brickred" >
                     <td><b>Dato</b></td> 
                     <td><b>Hendelse</b></td>
                     
                     </tr>
                     <%
                        try {
                        conn = DriverManager.getConnection(hostName+ dbName, userName, password);
                        st = conn.createStatement();
                          //String sql = "Select a.Calendar_ID, a.Dato, a.Hendelse from Calendar a"
                //+ " where a.Dato = ? ";
                          String sql = "Select a.Dato, a.Hendelse from Calendar a";
                        //String sql = "SELECT * FROM Calendar LIMIT 100;";
                        rs = st.executeQuery(sql);
                        while (rs.next()) {
                        %> 
                        <tbody> 
                            <tr>
                  
                    <td><%= rs.getString("Dato") %></td>
                    <td><%= rs.getString("Hendelse") %></td>

                    </tr>
                    
           
                        <%
                        }
                        } catch (Exception e) {
                        e.printStackTrace();
                        }
                        %>
                        </table>
                        
                        <a href="${pageContext.request.contextPath}/Calendar">Tilbake</a>
                        
                        </body>
                        </html>