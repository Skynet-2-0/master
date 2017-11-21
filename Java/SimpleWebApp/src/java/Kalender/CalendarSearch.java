/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Kalender;

import Connection.DBUtils;
import Connection.MyUtils;
import Users.Students;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ann Margrethe
 */
@WebServlet(name = "CalendarSearch", urlPatterns = {"/CalendarSearch"})
public class CalendarSearch extends HttpServlet {
    
   public CalendarSearch() {
       super();
   }
    
   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        Connection conn = MyUtils.getStoredConnection(request);
        String Dato = (String) request.getParameter("Dato");
        String Hendelse = (String) request.getParameter("Hendelse");
        
        String errorString = null;
        List<CalendarCalendar> list = null;
        try{
            list = (List<CalendarCalendar>) DBUtils.findDate(conn, Dato, Hendelse);
        }
        catch(SQLException e){
            e.printStackTrace();
            errorString = e.getMessage();
        }
        request.setAttribute("errorString", errorString);
        request.setAttribute("CalendarCalendar", list);
        
        RequestDispatcher dispatcher;
        dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/CalendarSearch.jsp");
        
        dispatcher.forward(request, response);
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
   
   

    /**
     * Handles the HTTP <code>POST</code> method.
     *  
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        RequestDispatcher dispatcher;
        dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/CalendarSearch.jsp");
        
        dispatcher.forward(request, response);
    }

   

}