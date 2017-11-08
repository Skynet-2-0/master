<%-- 
    Document   : display
    Created on : Oct 7, 2017, 10:33:08 AM
    Author     : Brage
--%>

<%@page language="java"  contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<% Class.forName("com.mysql.jdbc.Driver");%>

<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Søk etter student</title>
    </head>
        <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>
    
    <h3>Module 1. Godkjenning</h3>
    
    <table border = "1">
         <tr>
            <th>Module no.</th>
            <th>Learning Goals</th>
         </tr>
    
           <tr>
            <td>1 </td>
            <td>Opprette, åpne og lagre et prosjekt i BlueJ</td>
         </tr>
         
      </table>
    
        <h3>Søk etter student</h3>
        
        <%!
            public class Student {

String url="jdbc:mysql://localhost:3306/simplewebapp";
String username="root";
String password="root";

Connection conn = null;
PreparedStatement pstm = null;
ResultSet rs = null;
boolean hasError = false;
String errorString = null;



public Student () throws SQLException {
    try {

          conn = DriverManager.getConnection(url, username, password);
            pstm = conn.prepareStatement(
            "SELECT a.Name FROM students a"
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
               
                   <tr>
                       <td>Name</td>                      
                  
                  <% while(students.next()){ %> 
                  
                      <td><%= students.getString("name") %></td>
                  </tr>
                  <% } %>
           
        </table>
                 
               <a href="${pageContext.request.contextPath}/modules/modul1">Tilbake</a>
               
                <br></br>
               
               <table border="1">
                   
                   <tr>
                       <td>Er modulen godkjent?</td>                      
                       <td><input type="text" name="godkjent" value="" size="50"</td>
                   </tr>
               
                   <tr>
                       <td>Hvor mange poeng vil du gi</td>                      
                       <td><input type="text" name="poeng" value="" size="50"</td>
                   </tr>
                   
                   <tr>
                       <td>Åpen kommentar</td>
                       <td><input type="text" name="åpen kommentar" value="" size="50" height="500"</td>
                     
                   </tr>
                   
                     <tr>
                       <td>Skjult kommentar</td>
                       <td><input type="text" name="skjult kommentar" value="" size="50" height="500"</td>
                     
                   </tr>
           
        </table>
                <form name="myForm" action="modul1graded" method="POST">
                    <input type="submit" value="Submit" name="submit"/>