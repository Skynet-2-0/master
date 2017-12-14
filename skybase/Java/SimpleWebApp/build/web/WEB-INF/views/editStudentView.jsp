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
    <link href="Main.css" rel="stylesheet" type="text/css">
 </head>
 <body>
 
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>
 
    <h3 style="margin-left: 25px; font-family: Helvetica; text-decoration: underline;">Edit Student</h3>
 
    <p style="color: red;">${errorString}</p>
 
    <c:if test="${not empty useraccount}">
        <form method="POST" action="${pageContext.request.contextPath}/editStudents">
          <input type="hidden" name="user_account_id" value="${useraccount.user_account_id}" />
          <table style="border-collapse: collapse; margin: 25px 0px 0px 25px;" class="opprettStudent" border="0">
             <tr>
                <td>Id</td>
                <td style="color: red;">${useraccount.user_account_id}</td>
             </tr>
          <tr>
             <td>User Name</td>
             <td><input type="text" name="username" value="${useraccount.userName}" /></td>
          </tr>
          <tr>
             <td>Gender</td>
             <td><input type="text" name="gender" value="${useraccount.gender}" /></td>
          <tr>
              <td>Name</td>
             <td><input type="text" name="name" value="${useraccount.name}" /></td>
          </tr>
          <tr>
              <td>Password</td>
             <td><input type="password" name="password" value="${useraccount.password}" size="20" />
                 <button type="button" id="eye" onclick="if(password.type=='text')password.type='password';
             else password.type='text';"> Show Password
          </tr>
          <tr>
             <td>Email</td>
             <td><input type="text" name="email" value="${useraccount.email}" /></td>
          </tr>
          <tr>
             <td>User type</td>
             <td><input type="text" name="usertype" value="${useraccount.userType}" /></td>
          </tr>
             <tr>
                <td style="background-color:#355C7D;" colspan = "2">
                    <input type="submit" value="Submit" />
                    <button><a href="${pageContext.request.contextPath}/studentList">Cancel</a></button>
                </td>
             </tr>
          </table>
       </form>
    </c:if>
 </body>
</html>
