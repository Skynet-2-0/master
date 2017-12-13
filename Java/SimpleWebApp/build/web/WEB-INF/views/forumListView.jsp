<%-- 
    Document   : ForumListView
    Created on : 10.des.2017, 16:06:07
    Author     : ellak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forum List</title>
    </head>
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>
    <body>
        <h1>Forum List</h1>
        
        <p style="color: red;">${errorString}</p>
 
    <table border="1" cellpadding="4" cellspacing="0" >
       <tr>
          <th>Title</th>
          <th>Details</th>
          <th>CreateDate</th>
          <th>Name</th>
          <th>Email</th>
       
       </tr>
       <c:forEach items="${forumList}" var="forum" >
          <tr>
             <td>${forum.question_id}</td>
             <td>${forum.createDate}</td> 
             <td>${forum.details}</td>
             <td>${forum.name}</td>
             <td>${forum.view}</td>
             <td>${forum.user_account_id}</td>
             
            
             
       </c:forEach>
    </table>
 
    <a href="createQuestion" >Create Question</a>
 
    </body>
</html>
