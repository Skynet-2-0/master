<%-- 
    Document   : modul1Viewcopy2
    Created on : Oct 7, 2017, 10:14:01 AM
    Author     : Brage
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Søk etter student</title>
    </head>
    <body> 
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
        <form name="myForm" action="display.jsp" method="POST">
       
   <table border="1">      
        <tbody>          
            <tr>
                <td>Navn</td>
                <td><input type="text" name="name" value="" size="50"</td>
            </tr>           
    </table>
            <input type="reset" value="Clear" name="clear"/>
            <input type="submit" value="Submit" name="submit"/>
 </form>
  </body>
</html>
