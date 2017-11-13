<%-- 
    Document   : studentsListView
    Created on : 17.sep.2017, 21:52:27
    Author     : mathi, Brage
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
 <head>
    <meta charset="UTF-8">
    <title>Student List</title>
 </head>
 <body>
 
    <jsp:include page="_headerUser.jsp"></jsp:include>
    <jsp:include page="_menuUser.jsp"></jsp:include>
 
    <h3>Student List</h3>
 
    <p style="color: red;">${errorString}</p>
 
    <table border="1" cellpadding="5" cellspacing="1" >
       <tr>
          <th>Username</th>
          <th>Gender</th>
          <th>Id</th>
          <th>Name</th>
          <th>Email</th>
          <th>Usertype</th>
          <th>Edit</th>
          <th>Delete</th>
          
       </tr>
       <c:forEach items="${userAccountList}" var="useraccount" >
          <tr>
             <td>${useraccount.userName}</td>
             <td>${useraccount.gender}</td> 
             <td>${useraccount.user_account_id}</td>
             <td>${useraccount.name}</td>
             <td>${useraccount.email}</td>
             <td>${useraccount.userType}</td>
          </tr>
       </c:forEach>
    </table>

 </body>
</html>