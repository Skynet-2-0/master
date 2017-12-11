package LoginLogout;


import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author mathi
 */

@WebFilter(filterName = "aut", urlPatterns = {"/aut/*"})
public class LoginRestrictions implements Filter{
    
    //private static final long serialVersionUID = 1L;
    /*
    public LoginRestrictions(){
        super();
    }
    */
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        //Filter.super.init(filterConfig); //To change body of generated methods, choose Tools | Templates.

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(false);
        //UserAccount loginedUser = MyUtils.getLoginedUser(session);
        /*
        String requestPath;
        requestPath = HttpServletRequest.getRequestURI();   //CLIENT_CERT_AUTH;
        */
        if(/*needsAuthentication(requestPath) ||*/ session == null || session.getAttribute("loginedUser") == null){
            response.sendRedirect(request.getContextPath() + "/login"); // redirect hvis ikke logget inn
        }
        else{
            chain.doFilter(req, res); //Hvis loget inn, alt er greit
        }
        
        /*
        Connection conn = MyUtils.getStoredConnection(req);
        
        try {
            UserAccount admin = DBUtils.findUser(conn, "tom");
            if(admin == admin){
                needsAuthentication(requestPath);
                }
        } catch (SQLException ex) {
            Logger.getLogger(LoginRestrictions.class.getName()).log(Level.SEVERE, null, ex);
        }
        */
    }
    
    public void destroy(){
        //clean/close
    }
    /*
    //Validasjon av sider som ikke trenger autentikasjon
    private boolean needsAuthentication(String url){
        String[] validNonAuthenticationUrls = {"/WEB-INF/views/loginView.jsp", "/WEB-INF/views/homeView.jsp"};
        
        for(String validUrl : validNonAuthenticationUrls){
            if(url.endsWith(validUrl)){
                return false;
            }
        }
        return true;
    }
    */
}