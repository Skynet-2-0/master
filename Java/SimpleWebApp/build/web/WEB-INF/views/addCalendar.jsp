<%-- 
    Document   : addCalendar
    Created on : 13.des.2017, 19:23:32
    Author     : Ann Margrethe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
    <meta charset="UTF-8">
    <title>Create Student</title>
 </head>
 <body>
 
    <jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include>
    
    <h3>Create Student</h3>
    
    <p style="color: red;">${errorString}</p>
    
    <form method="POST" action="${pageContext.request.contextPath}/addCalendar">
       <table border="0">
           <tr>
             <td>Calendar_ID</td>
             <td><input type="text" name="Calendar_ID" value="${calendar.Calendar_ID}" /></td>
         </tr>
          
         <tr> 
             <td>Date</td>
             <td><input type="text" name="Date" value="${calendar.Date}" /></td>
            </tr>
            
          <tr>
              <td>Event</td>
             <td><input type="text" name="Event" value="${calendar.Event}" /></td>
          </tr>
          <tr>
             <td colspan="2">                  
                 <input type="submit" value="Submit" />
                 <a href="CalendarList">Cancel</a>
             </td>
          </tr>
       </table>
    </form>
 </body>
</html>
