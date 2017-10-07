<%-- 
    Document   : display
    Created on : Oct 7, 2017, 10:33:08 AM
    Author     : Brage
--%>
<%@page import="java.sql.*"%>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Søk etter student</title>
    </head>
    <body>
        <h1>Søk etter student</h1>
        <%!
            public class Student {

String url="jdbc:mysql://localhost:3306/simplewebapp";
String username="root";
String password="root";

Connection conn = null;
PreparedStatement pstm = null;
ResultSet rs = null;

public Student () throws SQLException {
    try {

          conn = DriverManager.getConnection(url, username, password);
            pstm = conn.prepareStatement(
            "SELECt a.Name FROM students a"
                + " WHERE a.Name = ?");
            } 
            catch (SQLException e1) {
                e1.printStackTrace();
                e1.getStackTrace();    
                System.out.println(e1.getMessage());
        }
    }



public ResultSet getStudents(String name) throws SQLException {

    try {
        pstm.setString(1, name);
        rs = pstm.executeQuery();
        } 
        catch (SQLException e1) {
                e1.printStackTrace();
                e1.getStackTrace();
                System.out.println(e1.getMessage());
    }
        return rs;
}


%>
        <%
            String name = new String();
            
            if (request.getParameter("name") != null) {
                name = request.getParameter("name");
            }
            
            Student student = new Student();
            ResultSet students = student.getStudents(name);
            
            %>
           <table border="1">
               <tbody>
                   <tr>
                       <td>Name</td>                      
                  </tr>
                  <%while(students.next()) {%>
                  <tr>
                      <td><%= students.getString("name") %></td>
                  </tr>
                  <% } %>
           </tbody>
        </table>
       
    </body>
</html>