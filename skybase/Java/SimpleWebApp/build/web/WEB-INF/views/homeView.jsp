<%-- 
    Document   : homeView
    Created on : 17.sep.2017, 02:03:05
    Author     : mathi
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
     <meta charset="UTF-8">
     <title>Home Page</title>
  </head>
  <body>
 
     <jsp:include page="_header.jsp"></jsp:include>
     <jsp:include page="_menu.jsp"></jsp:include>
    
      <h3>Home Page</h3>
      <img src="http://tflip.uia.no/images/uia_logo.gif" alt="uia_logo" style="width:600px;height:100px;">
      
      <form name="myForm" action="display.jsp" method="POST">
          <table border="0">
              
              <tbody>
                  <tr>
                      <td>Studentsøk: </td>
                      <td> <input type="text" name="name" value="" size="50" /> </td>
                  </tr>
              </tbody>
          </table>
          &nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;<input type="reset" value="Clear" name="clear" />
          &nbsp;<input type="submit" value="Submit" name="submit" />
      </form>
      
     
    
    <textarea name="txtReason" id="txtReason" style="display: none;" class="textboxmulti">
 
─────────▄▄───────────────────▄▄──
──────────▀█───────────────────▀█─
──────────▄█───────────────────▄█─
──█████████▀───────────█████████▀─
───▄██████▄─────────────▄██████▄──
─▄██▀────▀██▄─────────▄██▀────▀██▄
─██────────██─────────██────────██
─██───██───██─────────██───██───██      Hvorfor er du her å lurker rundt?
─██────────██─────────██────────██
──██▄────▄██───────────██▄────▄██─      Gå heller å se på denne videoen:
───▀██████▀─────────────▀██████▀──      https://www.youtube.com/watch?v=7ohbr90cKDc
──────────────────────────────────
──────────────────────────────────
──────────────────────────────────
───────────█████████████──────────
──────────────────────────────────
──────────────────────────────────

</textarea>
  </body>
</html>