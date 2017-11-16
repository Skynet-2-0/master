

<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link href="Forside.css" rel="stylesheet" type="text/css">

 </head>

 <body>
   <%--<jsp:include page="_header.jsp"></jsp:include>
    <jsp:include page="_menu.jsp"></jsp:include> --%>
 
    <p style="color: red;">${errorString}</p>
    <div class="login-page">
    <div class="form">
    <h3>Login Page</h3>
    <form method="POST" action="${pageContext.request.contextPath}/login">
       <table border="0">
          <tr>
             <td>User Name:</td>
             <td><input type="text" name="userName" value= "${user.userName}" /> </td>
          </tr>
          <tr>
             <td>Password:</td>
             <td><input type="password" name="password" value="${user.password}" size="20" />
             <button class="showPass" type="button" id="eye" onclick="if(password.type=='text')password.type='password';
             else password.type='text';"> Show Password
         </button> 
        </td>
          </tr>
          <form class="login-form">
             <input type="text" placeholder="username"/>
             <input type="password" placeholder="password"/>
          <tr>
             <th>Remember me</th>
             <th><input type="checkbox" name="rememberMe" value= "Y" /></th>
          </tr>
          <tr>
             <td colspan ="2">
                 <button type="submit" value= "Login" class="btn1 "/>Login</button>
                <%--<a href="${pageContext.request.contextPath}/">Cancel</a>--%>
             </td>
          </tr>
       </table>
    </form>
             </div>
             </div>
           
             <p style="color:red;">User Name: tom<br> password: tom001 or <br><br> mette/mette001</p>
             <%--
    <jsp:include page="_footer.jsp"></jsp:include>
             --%>     
 </body>
</html>