<%-- 
    Document   : CalendarSearch
    Created on : 14.nov.2017, 10:48:34
    Author     : Ann Margrethe
--%>

<%@page language="java"  contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kalender resultat</title>
    </head>
        <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>
    <body>
         <h1>Søk etter dato</h1>
        
       
    <p style="color: red;">${errorString}</p>
 
    <table border="1" cellpadding="5" cellspacing="1" >
       <tr>
          <th>Dato</th>
          <th>Hendelse</th>
          <th>Edit</th>
          <th>Delete</th>
       </tr>
       <c:forEach items="${calendar}" var="calendar" >
          <tr>
             <td>${calendar.dato}</td>
             <td>${calendar.hendelse}</td>
             <td>
                <a href="editStudents?id=${student.id}">Edit</a>
             </td>
             <td>
                <a href="deleteStudents?id=${student.id}">Delete</a>
             </td>
          </tr>
       </c:forEach>
    </table>
 
    <a href="createStudents" >Create Student</a>
    <%--
    <jsp:include page="_footer.jsp"></jsp:include>
    --%>
       
                 
              <a href="${pageContext.request.contextPath}/Calendar">Tilbake</a>
    </body>
      
</html>
