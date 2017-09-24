/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mathi
 */

@WebServlet(urlPatterns = {"/doEditStudent"})
public class DoEditStudentServlet extends HttpServlet{
    
    private static final long serialVersionUID = 1L;
 
   public DoEditStudentServlet() {
       super();
   }
 
   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
       Connection conn = MyUtils.getStoredConnection(request);
       
       String idStr = (String) request.getParameter("id");
       String name = (String) request.getParameter("name");
       String email = (String) request.getParameter("email");
       int id = 0;
       try{
           id = Integer.parseInt(idStr);
       }
       catch(Exception e){
           
       }
       
       Students students = new Students(id, name, email);
       
       String errorString = null;
       
       try{
           DBUtils.updateStudents(conn, students);
       }
       catch(SQLException e){
           e.printStackTrace();
           errorString = e.getMessage();
       }
       
       request.setAttribute("errorString", errorString);
       request.setAttribute("students", students);
       
       if(errorString != null){
           RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/views/editStudentView.jsp");
           dispatcher.forward(request, response);
       }
       else{
           response.sendRedirect(request.getContextPath() + "/studentList");
       }
   }
   
   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
       doGet(request, response);
   }
    
}
