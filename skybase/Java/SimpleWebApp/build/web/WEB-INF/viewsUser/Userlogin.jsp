<%-- 
    Document   : Userlogin
    Created on : 10.nov.2017, 21:36:13
    Author     : jonas
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
    <meta charset="UTF-8">
    <title>User Info</title>
 </head>
 <body>
 
    <jsp:include page="_headerUser.jsp"></jsp:include>
    <jsp:include page="_menuUser.jsp"></jsp:include>  
   
    <h3>Hello: ${user.userName}</h3>
 
    User Name: <b>${user.userName}</b>
    <br />
    Gender: ${user.gender } <br />
    <br>
    <a href="${pageContext.request.contextPath}/Snake.jsp">Snake</a>
 </body>
</html>