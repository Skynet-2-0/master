<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : editStudentView
    Created on : 17.sep.2017, 23:30:56
    Author     : mathi
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
 <head>
    <meta charset="UTF-8">
    <title>Edit Student</title>
 </head>
 <body>
 
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>
 
    <h3>Edit Student</h3>
 
    <p style="color: red;">${errorString}</p>
 
    <c:if test="${not empty students}">
        <form method="POST" action="${pageContext.request.contextPath}/editStudents">
          <input type="hidden" name="id" value="${students.id}" />
          <table border="0">
             <tr>
                <td>Id</td>
                <td style="color: red;">${students.id}</td>
             </tr>
             <tr>
                 <td>Name</td>
                <td><input type="text" name="name" value="${students.name}" /></td>
             </tr>
             <tr>
                <td>Email</td>
                <td><input type="text" name="email" value="${students.email}" /></td>
             </tr>
             <tr>
                <td colspan = "2">
                    <input type="submit" value="Submit" />
                    <a href="${pageContext.request.contextPath}/studentList">Cancel</a>
                </td>
             </tr>
          </table>
        </form>
    </c:if>
 </body>
</html>
