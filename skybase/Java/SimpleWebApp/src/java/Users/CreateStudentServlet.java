package Users;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Connection.MyUtils;
import Connection.DBUtils;
import java.io.IOException;
import static java.lang.System.out;
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
       
       
       Integer user_account_id = (Integer) Integer.parseInt(request.getParameter("user_account_id"));
       String username = (String) request.getParameter("username");
       String gender = (String) request.getParameter("gender");
       String name = (String) request.getParameter("name");
       String password = (String) request.getParameter("password");
       String email = (String) request.getParameter("email");
       String usertype = (String) request.getParameter("usertype");
      
       
       UserAccount useraccount = new UserAccount(user_account_id, username, gender, name, password, email, usertype);
       
       String errorString = null;
       
       if(errorString == null){
       try{
           if(user_account_id >= 1){
           try{
               DBUtils.insertStudents(conn, useraccount);
           }catch(StringIndexOutOfBoundsException e){
               e.printStackTrace();
               errorString = e.getMessage();
           }
           }        
          // DBUtils.insertStudents(conn, students);
       }
       catch(SQLException e){
           e.printStackTrace();
           errorString = e.getMessage();
       }
       }
       
       request.setAttribute("errorString", errorString);
       request.setAttribute("userAccount", useraccount);
       
       if(errorString != null){
           RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/views/createStudentView.jsp");
           dispatcher.forward(request, response);
       }
       else{
           response.sendRedirect(request.getContextPath() + "/studentList");
       }
   }
        
//doGet(request, response);
}
    

