<%-- 
    Document   : graded1
    Created on : Nov 1, 2017, 8:40:45 PM
    Author     : Brage
--%>

<%@page language="java"  contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>


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
    
       
        
        
          
               <br></br>
                 
               <a href="${pageContext.request.contextPath}/modul1">Vurder flere studenter</a>
               
                <br></br>
               
     Din vurdering er lagret