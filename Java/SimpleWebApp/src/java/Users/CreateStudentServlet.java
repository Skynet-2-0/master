package Users;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Connection.MyUtils;
import Connection.DBUtils;
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

@WebServlet(urlPatterns = {"/createStudents"})
public class CreateStudentServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    
    public CreateStudentServlet(){
        super();
        System.out.println("create student servlet initializing....");
        
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/views/createStudentView.jsp");
        dispatcher.forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
        Connection conn = MyUtils.getStoredConnection(request);
         
       
       String id = (String) request.getParameter("id");
       String name = (String) request.getParameter("name");
       String email = (String) request.getParameter("email");
      
       
       Students students = new Students(id, name, email);
       
       String errorString = null;
       
       if(errorString == null){
       try{
               DBUtils.insertStudents(conn, students);
               System.out.println("eyhey, inserted into students");
               //response.sendRedirect(request.getContextPath() + "/studentList");
               System.out.println("redirect m8");
            
           }
          // DBUtils.insertStudents(conn, students);
      
       catch(SQLException e){
           e.printStackTrace();
           errorString = e.getMessage();
       }
       
       request.setAttribute("errorString", errorString);
       request.setAttribute("students", students);
       
       if(errorString != null){
           RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/views/createStudentView.jsp");
           dispatcher.forward(request, response);
       }
       else{
           response.sendRedirect(request.getContextPath() + "/studentList");
       } 
   }
   
  }
}
