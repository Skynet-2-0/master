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
    <link href="Main.css" rel="stylesheet" type="text/css">
 </head>
 <body>
    
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>
 
    <h3>Modules Overview</h3>

<table style="border-collapse:collapse; margin-left: 25px;" class="tables">
         <tr>
            <th>Module no.</th>
            <th>Delivery date</th>
            <th>Edit</th>
            <th>Delete</th>
         </tr>
         <tr>
            <td> <a href="${pageContext.request.contextPath}/modules/modul1">1</a></td>
            <td>2. September</td>
         </tr>
         
         <tr>
            <td> <a href="${pageContext.request.contextPath}/modules/modul2">2</a></td>
            <td>14. September</td>
         </tr>
         
             <tr>
          <td> <a href="${pageContext.request.contextPath}/modules/modul3">3</a></td>
            <td>21. September</td>
         </tr>
         
             <tr>
          <td> <a href="${pageContext.request.contextPath}/modules/modul4">4</a></td>
            <td>4. Oktober</td>
         </tr>
         
             <tr>
            <td> <a href="${pageContext.request.contextPath}/modules/modul5">5</a></td>
            <td>11. Oktober</td>
         </tr>
         
             <tr>
          <td> <a href="${pageContext.request.contextPath}/modules/modul6">6</a></td>
          <td> 18. Oktober</td>
         </tr>
         
             <tr>
            <td> <a href="${pageContext.request.contextPath}/modules/modul7">7</a></td>
            <td>25. Oktober</td>
         </tr>
         
             <tr>
            <td> <a href="${pageContext.request.contextPath}/modules/modul8">8</a></td>
            <td>2. November</td>
         </tr>
         
              <tr>
            <td> <a href="${pageContext.request.contextPath}/modules/modul9">9</a></td>
            <td>9. November</td>
         </tr>
         
              <tr>
            <td> <a href="${pageContext.request.contextPath}/modules/modul10">10</a></td>
            <td>16. November</td>
         </tr>

      </table>
    <p></p>
    <button style="margin-left: 25px;"><a href="createStudents" class="createStudent">Create module</a></button>  
 </body>    
 </html> 
 