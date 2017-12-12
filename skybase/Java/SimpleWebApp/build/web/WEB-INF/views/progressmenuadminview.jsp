<%-- 
    Document   : progressmenuview
    Created on : Nov 13, 2017, 8:18:32 PM
    Author     : Brage
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<!DOCTYPE html>
<html>
 <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Progress</title>
 </head>
 <body>
 
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>

    

      
       
        Oversikt over alle studenters progresjon
                
    
    <br>
    
    

    
   <table border="1" cellpadding="5" cellspacing="1" >
      
        <tr>
            <th>Navn</th>
            <th>Modul no.</th>
            <th>Status</th>
            <th>Poeng</th>
            <th>Kommentar</th>
            <th>Lukket kommentar</th>
        </tr>

        
            <c:forEach items="${map}" var="map" >
              <tr>
                    <td>${map.key}</td>
                    
                        
                   
             <c:forEach items="${map.value}" var="feedback">
                
                
                 <td>${feedback.module_id}</td>
                 <td>${feedback.status}</td>
                 <td>${feedback.score}</td>
                 <td>${feedback.commentOpen}</td>
                 <td>${feedback.commentHidden}</td>
               
                 
                 
              
             
        
             </c:forEach>
               
             
            
                    </tr>
                    
    
       </c:forEach>
                 
 
         </table> 
    
    </body>
</html>
