<%-- 
    Document   : CalendarSearch
    Created on : 14.nov.2017, 10:48:34
    Author     : Ann Margrethe
--%>

<%@page import="(org.apache.tomcat.jni.User.username(long, long))"%>
<%@page language="java"  contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<% Class.forName("com.mysql.jdbc.Driver");%>

<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kalender resultat</title>
    </head>
        <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>
    
       <h1>Søk etter student</h1>
        
        <%!
            public class CalendarCalendar {
String url="jdbc:mysql://localhost:3306/skybase";
String username="root";
String password="root";
Connection conn = null;
PreparedStatement pstm = null;
ResultSet rs = null;
public CalendarCalendar () throws SQLException {
    try {
          conn = DriverManager.getConnection(url, username, password);
            pstm = conn.prepareStatement(
            "SELECT a.Dato FROM calendar a"
                + " WHERE a.Dato = ?");
            } 
            catch (SQLException e1) {
                e1.printStackTrace();
                e1.getStackTrace();    
                System.out.println(e1.getMessage());
        }
    }
public ResultSet getDato(String dato) throws SQLException {
    try {
        pstm.setString(1, dato);
        rs = pstm.executeQuery();
        } 
        catch (SQLException e1) {
                e1.printStackTrace();
                e1.getStackTrace();
                System.out.println(e1.getMessage());
    }
        return rs;
}
}
%>
        <%
            String dato = new String();
            
            if (request.getParameter("dato") != null) {
                dato = request.getParameter("dato");
            }
            
            CalendarCalendar calendarCalendar = new CalendarCalendar();
            ResultSet datos = calendarCalendar.getDato(dato);
            
            %>
           <table border="1">
               
                   <tr>
                       <td>Dato</td>                      
                  </tr>
                  <% while(datos.next()){ %> 
                  <tr>
                      <td><%= datos.getString("Dato") %></td>
                  </tr>
                  <% } %>
           
        </table>
                 
               <a href="${pageContext.request.contextPath}/Calendar">Tilbake</a>
