package Modules;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Connection.DBUtils;
import Connection.MyUtils;
import Feedback.Feedback;
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
 * @author brage
 */

@WebServlet(urlPatterns = {"/modul1"})
public class Modul1 extends HttpServlet{
    
    private static final long serialVersionUID = 1L;
    
    public Modul1(){
        super();
    }
    
    @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
        
       RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/modul1view.jsp");
       
        dispatcher.forward(request, response);
        
    }
    
    @Override
    protected void doPost (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
        Connection conn = MyUtils.getStoredConnection(request);
       
       
       String status = (String) request.getParameter("status");
       String commentOpen = (String) request.getParameter("commentOpen");
       String commentHidden = (String) request.getParameter("commentHidden");
       String score = (String) request.getParameter("score");
       String module_id = (String) request.getParameter("module_id");
       String user_account_id = (String) request.getParameter("user_account_id");

      
       
       Feedback feedback = new Feedback(status, commentOpen, commentHidden, score, module_id, user_account_id );
       
       String errorString = null;
       
       if(errorString == null){
       try{      
           try{
                   DBUtils.insertOralFeedback(conn, feedback);
                   
           }catch(StringIndexOutOfBoundsException e){
               e.printStackTrace();
               errorString = e.getMessage();
           }      
         
       }
       catch(SQLException e){
           e.printStackTrace();
           errorString = e.getMessage();
        }
       }
       
       request.setAttribute("errorString", errorString);
       request.setAttribute("feedback", feedback);
       
       if(errorString != null){
           RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/views/modul1view.jsp");
           dispatcher.forward(request, response);
       }
       else{
           response.sendRedirect(request.getContextPath()+ "/modul1graded");
        
        
        
  // doGet(request, response);
}
}
}
