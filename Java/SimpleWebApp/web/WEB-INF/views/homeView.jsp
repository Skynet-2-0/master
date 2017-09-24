<%-- 
    Document   : homeView
    Created on : 17.sep.2017, 02:03:05
    Author     : mathi
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
     <meta charset="UTF-8">
     <title>Home Page</title>
  </head>
  <body>
 
     <jsp:include page="_header.jsp"></jsp:include>
     <jsp:include page="_menu.jsp"></jsp:include>
    
      <h3>Home Page</h3>
      <img src="http://tflip.uia.no/images/uia_logo.gif" alt="uia_logo" style="width:600px;height:100px;">
      
      <br>Dette er en Simple web application med bruk av jsp, servlet &amp; Jdbc. <br><br>
      <b>Den inneholder disse funksjonene til nå:</b>
      <ul>
         <li>Login</li>
         <li>Storing user information in cookies</li>
         <li>Student List</li>
         <li>Create Student</li>
         <li>Edit Product</li>
         <li>Delete Product</li>
      </ul>
 
     <jsp:include page="_footer.jsp"></jsp:include>
 
  </body>
</html>