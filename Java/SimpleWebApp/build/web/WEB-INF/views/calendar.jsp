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
 
        <h3>Kalender</h3>
    
    <p style="color: red;">${errorString}</p>
    
    <form method="POST" action="${pageContext.request.contextPath}/CalendarSearch">
       <table border="0">
          <tr>
              <p style="color: red;">${errorString}</p> 
             <td>Søk etter dato</td>
             
             <td><input type="text" name="search" value="${list.dato}" /></td>
             <input type="submit" value="Submit" name="submit" />
          </tr>
       </table>
    </form>
 </body>
</html>
