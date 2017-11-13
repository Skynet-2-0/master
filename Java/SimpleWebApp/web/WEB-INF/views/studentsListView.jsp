<%-- 
    Document   : studentsListView
    Created on : 17.sep.2017, 21:52:27
    Author     : mathi
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
 
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>
 
    <h3>Student List</h3>
 
    <p style="color: red;">${errorString}</p>
 
    <table border="1" cellpadding="5" cellspacing="1" >
       <tr>
          <th>Id</th>
          <th>Name</th>
          <th>Email</th>
          <th>Edit</th>
          <th>Delete</th>
       </tr>
       <c:forEach items="${studentList}" var="student" >
          <tr>
             <td>${student.id}</td>
             <td>${student.name}</td>
             <td>${student.email}</td>
             <td>
                <a href="editStudents?id=${student.id}">Edit</a>
             </td>
             <td>
                <a href="deleteStudents?id=${student.id}">Delete</a>
             </td>
          </tr>
       </c:forEach>
    </table>
 
    <a href="createStudents" >Create Student</a>
 </body>
</html>