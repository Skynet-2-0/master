<%-- 
    Document   : calendar
    Created on : 17.okt.2017, 11:23:06
    Author     : Ann Margrethe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
   
<html>
 <head>
    <meta charset="UTF-8">
    <title>Kalender</title>
 </head>
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>
 
        <h3>Create Student</h3>
    
    <p style="color: red;">${errorString}</p>
    
    <form method="POST" action="${pageContext.request.contextPath}/createStudents">
       <table border="0">
          <tr>
              <p style="color: red;">${errorString}</p> 
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
 </body>
</html>
