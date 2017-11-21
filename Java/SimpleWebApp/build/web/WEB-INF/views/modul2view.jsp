<%-- 
    Document   : modulView
    Created on : Sep 24, 2017, 10:35:44 PM
    Author     : Brage
--%>

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
 
    <h3>Module 2. Learning Goals</h3>

<table border = "1">
         <tr>
            <th>Module no.</th>
            <th>Learning Goals</th>
         </tr>
    
           <tr>
            <td>2 </td>
            <td>Studenten skal lage en blå sirkel og få den til å bevege på seg</td>
         </tr>
         
      </table>
    
    <table border  ="1">
        
        <br>
        
         <h3>Oversikt</h3>
        
        <tr>
            <th>Navn</th>
            <th>Filnavn</th>
            <th>Innleveringsdato</th>
            <th>Status</th>
            <th>Poeng</th>
            <th>Vurdert av</th>
            <th>Kommentar</th>
        </tr>
            
        <tr>
            
            <td>Brage Fosso</td>
            <td>Modul2.jar</td>
            <td>01.02.18 04:20</td>
            <td>Godkjent</td>
            <td>10</td> 
            <td>Christian Moen</td>
            <td></td>
            
      </tr>
      
      <tr>
            
            <td>Jonas Omdal</td>
            <td></td>
            <td></td>
            <td>Ikke levert</td>
            <td></td>
            <td></td>
            <td></td>
           
            
      </tr>
      
            <tr>
            
            <td>Mathias Evensen</td>
            <td>Modul2boi.jar</td>
            <td>02.05.18 21:54</td>
            <td>Levert</td>
            <td><input type="text" name="Poeng"</td>
            <td><input type="text" name="Vurdert av"</td>
            <td><input type="text" name="Kommentar"</td>
            
      </tr>
        
    </table>
    
    <form name="myForm" action="kjøyr" method="POST">
                    <input type="submit" value="Submit" name="submit"/>

                    <a href="${pageContext.request.contextPath}/modules">Tilbake</a>