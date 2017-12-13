<%-- 
    Document   : questionListView
    Created on : 12.des.2017, 16:22:26
    Author     : ellak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Question List</title>
    </head>
    <body>
        <jsp:include page="_header.jsp"></jsp:include>
        <jsp:include page="_menu.jsp"></jsp:include>
        
        <h1>Question List</h1>
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
             <td>${forum.title}</td>
             <td>${forum.details}</td> 
             <td>${forum.createDate}</td>
             <td>${forum.name}</td>
             <td>${forum.email}</td>
             <td>
         </c:forEach>
    </table>
 
    <a href="createQuestion" >Create Questions</a>
        </table>
    </body>
</html>
