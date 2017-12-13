<%-- 
    Document   : questionListView
    Created on : 12.des.2017, 16:22:26
    Author     : ellak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Question List</title>
    </head>
    <body>
        
        <jsp:include page="_header.jsp"></jsp:include>
        <jsp:include page="_menu.jsp"></jsp:include>
        
        <h1>Question List</h1>
        <p style="color: red;">${errorString}</p>
        <table border="1" cellpadding="4" cellspacing="1" >
        <tr>
          <th>Question_ID</th> 
          <th>Title</th>
          <th>Details</th>
          <th>CreateDate</th>
          <th>Name</th>
          <th>Email</th>
     
       </tr>
       <c:forEach items="${questionList}" var="question" >
          <tr>
             <td>${question.question_id}</td>
             <td>${question.title}</td>
             <td>${question.details}</td> 
             <td>${question.createDate}</td>
             <td>${question.name}</td>
             <td>${question.email}</td>
             
             <td>
         </c:forEach>
    </table>
 
    <a href="createQuestion" >Create Questions</a> <<>>
    <a href="studentForum" >Back to forum</a>
       
    </body>
</html>
