///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package Kalender;
//
//import Connection.DBUtils;
//import Connection.MyUtils;
//import Kalender.CalendarCalendar;
//import Users.Students;
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.sql.Connection;
//import java.sql.SQLException;
//import java.util.List;
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
///**
// *
// * @author Ann Margrethe
// */
//@WebServlet(name = "CalendarServlet", urlPatterns = {"/CalendarServlet"})
//public class CalendarServlet extends HttpServlet {
//
//    private static final long serialVersionUID = 1L;
//    
//    public CalendarServlet(){
//        super();
//    }
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException{
//        
//        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/views/calendar.jsp");
//        dispatcher.forward(request, response);
//    }
//    
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException{
//        
//        Connection conn = MyUtils.getStoredConnection(request);
//       
//       String Dato = (String) request.getParameter ("Dato");
//       String Hendelse = (String) request.getParameter("Hendelse");
//      
//       
//       CalendarCalendar calendarCalendar = new CalendarCalendar(Dato, Hendelse);
//       calendarCalendar = null;
//       String errorString = null;
//       
//       if(errorString == null){
//       try{
//           
//           try{
//               DBUtils.findDate(conn, Dato);
//           }catch(StringIndexOutOfBoundsException e){
//               e.printStackTrace();
//               errorString = e.getMessage();
//           }
//          
//       }
//       catch(SQLException e){
//           e.printStackTrace();
//           errorString = e.getMessage();
//       }
//               List<CalendarCalendar> list = null;
//        try{
//            list = DBUtils.queryCalendar(conn);
//        }
//        catch(SQLException e){
//            e.printStackTrace();
//            errorString = e.getMessage();
//        }
//       }
//       
//       request.setAttribute("errorString", errorString);
//       request.setAttribute("CalendarCalendar", calendarCalendar);
//       
//       if(errorString != null){
//           RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/views/CalendarSearch.jsp");
//           dispatcher.forward(request, response);
//       }
//       else{
//           response.sendRedirect(request.getContextPath() + "/CalendarSearch");
//       }
//   }
//        
////doGet(request, response);
//}
//    
//
