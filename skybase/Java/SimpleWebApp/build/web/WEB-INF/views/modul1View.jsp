<%-- 
    Document   : modulView
    Created on : Sep 24, 2017, 10:35:44 PM
    Author     : Brage
--%>


<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
 <head>
    <meta charset="UTF-8">
    <title>Modules</title>
 </head>
 <body>
     
 
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>
    
    <h3>Module 1. Godkjenning</h3>
    




             <form action="modul1" method="GET">
             <td>Search by name</td>
             <input type="text" value="${ requestScope.name}"></>
             <input type ="submit" value="Search">
                 
               
      
          
          <table border="0">
             <td>${ requestScope.name}</td>
             </tr>
          
          </table>
       </form>
    </c:if>
                   

                     </tbody>                  
                 </table>

                             
                 </form>
           
         
      
    


 
    <h3>Module 1. Learning Goals</h3>

<table border = "1">
         <tr>
            <th>Learning Goals</th>
         </tr>
    
           <tr>
            <td>Opprette, åpne og lagre et prosjekt i BlueJ</td>
         </tr>
         
      </table>
    
    </body>
    </html>
