<%-- 
    Document   : modulView
    Created on : Sep 24, 2017, 10:35:44 PM
    Author     : Brage
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
            <th>Module ID</th>
            <th>UserID</th>
            <th>Filnavn</th>
            <th>Status</th>
            <th>Poeng</th>
            <th>Åpen kommentar</th>
            <th>Skjult kommentar</th>
        </tr>
            
    <c:forEach items="${moduleFeedbackList}" var="modulefeedback" >
            
          <tr>
             <td>${modulefeedback.name}</td>
             <td>${modulefeedback.module_id}</td>
             <td>${modulefeedback.user_account_id}</td>
             <td>${modulefeedback.attachment_id}</td>
             <td>${modulefeedback.status}</td>
             <td>${modulefeedback.score}</td>
             <td>${modulefeedback.commentOpen}</td>
             <td>${modulefeedback.commentHidden}</td>
             
       </c:forEach>
        
    </table>

 <a href="${pageContext.request.contextPath}/modules">Tilbake</a>