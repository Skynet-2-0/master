<%-- 
    Document   : BlogListView
    Created on : 21.nov.2017, 13:20:39
    Author     : evakristine
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Post View</title>
    </head>
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>


    <body>
        <h1>Your blog posts</h1>
        
         <table border="1" cellpadding="5" cellspacing="1" >
       <tr>
          <th>Date</th>
          <th>Title</th>
          <th>Content</th>
          
          
       </tr>
       <c:forEach items="${Blog}" var="blog" >
          <tr>
             <td>${blog.title}</td>
             <td>${blog.content}</td>
          </tr>
       </c:forEach>
    </table>
             
    </body>
</html>
