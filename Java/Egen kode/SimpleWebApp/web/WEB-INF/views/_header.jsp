<%-- 
    Document   : _header
    Created on : 17.sep.2017, 01:42:50
    Author     : mathi
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*" %>
<div style="background: #E0E0E0; height: 70px; padding: 5px;">
  <div style="float: left">
     <h1>Skynet 2.0</h1>
  </div>
    
  <div style="float: right; padding: 10px; text-align: right;">
 
     <!-- User store in session with attribute: loginedUser -->
     <b>${loginedUser.userName}</b> <% out.println("IP adresse: " + request.getRemoteAddr()); %> <br>
     <%
            // Set refresh, autoload time as 5 seconds
            response.setIntHeader("Refresh", 5);
            
            // Get current time
            Calendar calendar = new GregorianCalendar();
            
            String am_pm;
            int hour = calendar.get(Calendar.HOUR);
            int minute = calendar.get(Calendar.MINUTE);
            int second = calendar.get(Calendar.SECOND);
            
            if(calendar.get(Calendar.AM_PM) == 0) 
               am_pm = "AM";
            else
               am_pm = "PM";
               String CT = hour+":"+ minute +":"+ second +" "+ am_pm;
               out.println("Current Time is: " + CT + "\n");
         %>
   <br/>
     Search <input name="search">
 
  </div>
 
</div>