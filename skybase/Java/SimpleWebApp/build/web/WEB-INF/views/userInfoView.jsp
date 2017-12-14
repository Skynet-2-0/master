<%-- 
    Document   : userInfoView
    Created on : 17.sep.2017, 20:37:55
    Author     : mathi
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
    <meta charset="UTF-8">
    <title>User Info</title>
    <link href="Main.css" rel="stylesheet" type="text/css">
 </head>
 <body>
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>  
    <div class="header">
    <h3 style="margin-left: 25px; font-family: Helvetica; text-decoration: underline;">Hello: ${user.userName}</h3>
    </div>
    <div style="margin-left: 25px">
    User Name: <b>${user.userName}</b>
    <br />
    Gender: ${user.gender } <br />
    <br>
    <button style="padding: 7px 25px 7px 25px;"><a href="${pageContext.request.contextPath}/Snake.jsp">Snake</a></button>
    </div> 
 </body>