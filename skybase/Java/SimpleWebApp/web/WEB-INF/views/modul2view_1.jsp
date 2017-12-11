 
 
 <%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
 <head>
    <meta charset="UTF-8">
    <title>Modules</title>
    <link href="../Main.css" rel="stylesheet" type="text/css">
 </head>
 <body>
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>
 
    <h3>Module 2</h3>

    <table style="border-collapse: collapse; margin: 25px 0px 0px 25px;" class="tables" border="1">
         <tr>
            <th colspan="2">Module 2 - Introduksjon til BlueJ</th>
         </tr>
         <tr>
            <td><b>Beskrivelse</b></td>
            <td>Studenten skal lage en blå sirkel og få den til å bevege på seg</td>
         </tr>      
         <tr>
             <td><b>Læreplanmål</b></td>
         <td>
          <ul>
             <li>Forstå grunnlegende funksjoner ved blueJ</li>
             <li>Kune lagre, slette og exportere filer i blueJ</li>
             <li>Forstå forskjellen på klasser og objekter</li>
          </ul>
         </td>
         </tr> 
         <tr>
             <td><b>Ressurser<br>og vedlegg</b></td>
             <td>
                 <ul>
                     <li> https://www.bluej.org/ </li>
                     <li> https://www.youtube.com/watch?v=UMcijMC4Dwk </li>
                 </ul>
             </td>
         </tr>
      </table>  
    <h2 style="font-family: roboto; margin-left: 25px; font-size: 20px;">Last opp besvarelse:</h2> 
    

    
    
    
    
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
    <link href="../Main.css" rel="stylesheet" type="text/css">
 </head>
 <body>
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>
 
    <h3>Module 2</h3>

    <table style="border-collapse: collapse; margin: 25px 0px 0px 25px;" class="tables" border="1">
         <tr>
            <th colspan="2">Module 2 - Introduksjon til BlueJ</th>
         </tr>
         <tr>
            <td><b>Beskrivelse</b></td>
            <td>Studenten skal lage en blå sirkel og få den til å bevege på seg</td>
         </tr>      
         <tr>
             <td><b>Læreplanmål</b></td>
         <td>
          <ul>
             <li>Forstå grunnlegende funksjoner ved blueJ</li>
             <li>Kune lagre, slette og exportere filer i blueJ</li>
             <li>Forstå forskjellen på klasser og objekter</li>
          </ul>
         </td>
         </tr> 
         <tr>
             <td><b>Ressurser<br>og vedlegg</b></td>
             <td>
                 <ul>
                     <li> https://www.bluej.org/ </li>
                     <li> https://www.youtube.com/watch?v=UMcijMC4Dwk </li>
                 </ul>
             </td>
         </tr>
      </table>
    
    <h3>Oversikt</h3> 
    
    <table class="tables" style="border-collapse: collapse; margin: 25px 0px 0px 25px;" border="1">              
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
    </table><br>
    
    <form style="margin-left: 25px;" name="myForm" action="kjøyr" method="POST">
                    <input type="submit" value="Submit" name="submit"/>
&emsp;
                    <a href="${pageContext.request.contextPath}/modules">Tilbake</a>
    </body>
 </html>
 
 