<%-- 
    Document   : createStudentView
    Created on : 17.sep.2017, 22:18:42
    Author     : mathi
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<!DOCTYPE html>
<html>
 <head>
    <meta charset="UTF-8">
    <title>Create Student</title>
 </head>
 <body>
 
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>
    
    <h3>Create Student</h3>
    
    <p style="color: red;">${errorString}</p>
    
    <form method="POST" action="${pageContext.request.contextPath}/createStudents">
       <table border="0">
          <tr>
             <td>Id</td>
             <td><input type="text" name="id" value="${student.id}" /></td>
          </tr>
          <tr>
             <td>Name</td>
             <td><input type="text" name="name" value="${student.name}" /></td>
          </tr>
          <tr>
             <td>Email</td>
             <td><input type="text" name="email" value="${student.email}" /></td>
          </tr>
          <tr>
             <td colspan="2">                  
                 <input type="submit" value="Submit" />
                 <a href="studentList">Cancel</a>
             </td>
          </tr>
       </table>
    </form>
    <%--
    <jsp:include page="_footer.jsp"></jsp:include>
    --%>
 </body>
</html>
