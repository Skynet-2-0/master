<%-- 
    Document   : _header
    Created on : 17.sep.2017, 01:42:50
    Author     : mathi
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*" %>
<div style="background: rgba(175, 175, 175, 0.6); height: 70px; padding: 5px;">
  <div style="float: left">
     <h2>Skynet 2.0</h2>
  </div>   
  <div style="float: right; padding: 10px; text-align: right;">
 
     <!-- User store in session with attribute: loginedUser -->
     <b>${loginedUser.userName}</b> <% out.println("IP adresse: " + request.getRemoteAddr()); %> <br>
    <br/>
 </div>
    
      <div style="float: top; padding: 5px; text-align: center; font-size: 25px;">
          <script type="text/javascript">
    var myVar=setInterval(function () {myTimer()}, 1000);
    var counter = 0;
    function myTimer() {
    var dateOBJ = new Date();
    document.getElementById("demo").innerHTML = dateOBJ.toLocaleString();
    }
    </script>
    
<body>
   <span id="demo"></span>
</body>

      </div>
  </div>
 
