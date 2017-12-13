<%-- 
    Document   : uploadModuleStudent
    Created on : Dec 12, 2017, 12:49:18 PM
    Author     : Mr.Schibbye
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<!DOCTYPE html>
<html>
 <head>
    <meta charset="UTF-8">
    <title>Upload</title>
 </head>
 <body>
 
     <h3>Create Student</h3>
    
    <p style="color: red;">${errorString}</p>
    
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>
    <jsp:include page="_uploadToDB.jsp"></jsp:include>
    
    <form method="POST" action="${pageContext.request.contextPath}/uploadModuleStudent">
       <table border="0">
          <tr>
              <p style="color: red;">${errorString}</p> 
             <td>Id - autogenerert</td>
             <td><input type="hidden" name="user_account_id" value="${useraccount.user_account_id}" /></td>
          </tr>
          
       </table>
    </form>