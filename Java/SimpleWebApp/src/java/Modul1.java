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
 * @author brage
 */

@WebServlet(urlPatterns = {"/modules/modul1"})
public class Modul1 extends HttpServlet{
    
    private static final long serialVersionUID = 1L;
    
    public Modul1(){
        super();
    }
    
    @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
        
         Connection conn = MyUtils.getStoredConnection(request);
         
       String name = (String) request.getParameter("name");
       
           String errorString = null;
         
     
       try{
           request.setAttribute("name", DBUtils.findName(conn, name));
                
        }
        
          catch(SQLException e){
           errorString = e.getMessage();
       }   
              
    
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/modul1Viewcopy2.jsp");
       
        dispatcher.forward(request, response);
        
    }
    
    @Override
    protected void doPost (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
        doGet(request, response);
}
}
