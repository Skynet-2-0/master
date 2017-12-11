<%-- 
    Document   : EditModule
    Created on : 10.des.2017, 22:52:45
    Author     : jonas
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>Edit Module</title>
      <link href="Main.css" rel="stylesheet" type="text/css">
   </head>
   <body>
 
      <jsp:include page="_header.jsp"></jsp:include>
      <jsp:include page="_menu.jsp"></jsp:include>
 
      <h3>Edit Module</h3>
 
      <p style="color: red;">${errorString}</p>
 
      <c:if test="${not empty module}">
       
         <form method="POST" action="${pageContext.request.contextPath}/editModule">
            <input type="hidden" name="code" value="${module.module_id}" />
            <table style="border-collapse: collapse; margin: 25px 0px 0px 25px;" class="opprettStudent" border="0">
               <tr>
                  <td>Module ID</td>
                  <td style="color:red;">${module.module_id}</td>
               </tr>
               <tr>
                  <td>Module Name</td>
                  <td><input style="width: 400px;" type="text" name="name" value="${module.module_name}" /></td>
               </tr>
               <tr>
                  <td>Delivery Date</td>
                  <td><input style="width: 400px;" type="text" name="delivery_date" value="${module.delivery_date}" /></td>
               </tr>
               <tr>
                  <td>Description</td>
                  <td><input style="width: 400px; height: 140px;" type="text" name="description" value="${module.description}" /></textarea></td>
               </tr>
               <tr>
                  <td>learningGoals</td>
                  <td><input style="width: 400px; height: 140px; " type="text" name="learningGoals" value="${module.learningGoals}" /></td>
               </tr>
               <tr>
                  <td>Resources</td>
                  <td><input style="width: 400px; height: 140px;" type="text" name="resources" value="${module.resources}" /></td>
               </tr>
               <tr>
                  <td colspan = "2">
                      <input type="submit" value="Submit"/>
                      <button><a href="${pageContext.request.contextPath}/moduleList">Cancel</a></button>
                  </td>
               </tr>
            </table>
          </form>          
      </c:if> 
   </body>
</html>
