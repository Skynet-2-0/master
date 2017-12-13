<%-- 
    Document   : is100View
    Created on : 12.des.2017, 16:38:24
    Author     : ellak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <style>
            
            
            table {
                border: 1px solid black;
                border-collapse: collapse;
                
                width: 100% 
                
                
                
            }
            
            table, th, td {
                color: #000;
           
            }
            
            table a hover {
                color: #000;
                text-align: left;
                
            }   
            
            th{
                background-color: #F0F0F0;
                color: #000;
                padding: 5px;
              
            }
            
            .leftpart {
                width: 60%;
            }
            
            .rightpart {
                width: 40%;
            }
     
       
        </style>
        <title>IS-100 Forums</title>
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
       <c:forEach items="${questionList}" var="question" >
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
