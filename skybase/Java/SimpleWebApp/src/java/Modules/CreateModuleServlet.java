package Modules;

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
 * @author Jonas
 */

    @WebServlet(urlPatterns = {"/createModule"})
    public class CreateModuleServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    
    public CreateModuleServlet(){
        super();
    }
    
    //Viser Opprett Modul siden.

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/views/createModule.jsp");
        dispatcher.forward(request, response);
    }
    
    //Når brukeren skriver module informasjonen, og klikker Submit.
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
       Connection conn = MyUtils.getStoredConnection(request);
       
       String module_id = (String) request.getParameter("module_id");
       String module_name = (String) request.getParameter("module_name");
       String delivery_date = (String) request.getParameter("delivery_date");
       String description = (String) request.getParameter("description");
       String learningGoals = (String) request.getParameter("learningGoals");
       String resources = (String) request.getParameter("resources");
      
       Module module = new Module(module_id, module_name, delivery_date, description, learningGoals, resources);
       
       String errorString = null;
       
       if(errorString == null){
       try{
           DBUtils.createModules(conn, module);
       }
       catch(SQLException e){
           e.printStackTrace();
           errorString = e.getMessage();
          
       }

       //Lagrer informasjon til request attribrute.
       request.setAttribute("errorString", errorString);
       request.setAttribute("module", module);
       
       //Hvis feil, videresend til Edit page.
       if(errorString != null){
           RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/views/createModule.jsp");
           dispatcher.forward(request, response);
       }
       
       //Hvis alt fungerer som det skal.
       //Omdiriger til Module list siden.
       else{
           response.sendRedirect(request.getContextPath() + "/moduleList");
       }
   }
}}
    