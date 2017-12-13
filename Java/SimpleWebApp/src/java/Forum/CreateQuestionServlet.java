/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Forum;


import Connection.MyUtils;
import Connection.DBUtils;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ellak
 */
@WebServlet(urlPatterns = {"/createQuestion"})
public class CreateQuestionServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    
    public CreateQuestionServlet(){
        super();
    }

  

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/createQuestionView.jsp");
        dispatcher.forward(request, response);
    }

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
       
        Connection conn = MyUtils.getStoredConnection(request);
        
        String question_id = (String) request.getParameter("question_id");
        String title= (String) request.getParameter("title").toUpperCase();
        String details = (String) request.getParameter("details").toUpperCase();
        String createDate = (String) request.getParameter("createDate");
        String name = (String) request.getParameter("name").toUpperCase();
        String email = (String) request.getParameter("email").toLowerCase();
        
        QuestionQuestion questionquestion = new QuestionQuestion(question_id, title, details, createDate, name, email);
        
        String errorString = null;
                
         
        if(errorString == null){
         try {
             try{
            boolean hasError;
            hasError = false;
            
            if( title == null || details == null || createDate == null || name== null || email== null ||
                    title.length() == 0 || details.length() == 0 || createDate.length() == 0 || name.length() == 0|| email.length() == 0){
                            
                                
                                hasError = true;
                                errorString = "Trenger å fylle på alt feltene";
                                
                            }
                            
                
                    DBUtils.insertQuestion (conn, questionquestion);
                } catch (SQLException ex) {
                    Logger.getLogger(CreateQuestionServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                            
         
         
        
         }catch(StringIndexOutOfBoundsException e) {
             e.printStackTrace();
         }
         
            
            request.setAttribute("errorString", errorString);
            request.setAttribute("Question", questionquestion);
            
            
            if(errorString != null){
                RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/views/createQuestionView.jsp");
                dispatcher.forward(request, response);
            
            }
       else{
           response.sendRedirect(request.getContextPath() + "/questionInfo");
       }
     }
   }
}
 

