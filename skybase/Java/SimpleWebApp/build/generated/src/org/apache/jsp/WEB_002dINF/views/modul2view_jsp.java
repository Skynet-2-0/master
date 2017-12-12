package org.apache.jsp.WEB_002dINF.views;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class modul2view_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("    ");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write(" <head>\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <title>Modules</title>\r\n");
      out.write("    <link href=\"../Main.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write(" </head>\r\n");
      out.write(" <body>\r\n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "_header.jsp", out, false);
      out.write("\r\n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "_menu.jsp", out, false);
      out.write("\r\n");
      out.write(" \r\n");
      out.write("    <h3>Module 2</h3>\r\n");
      out.write("\r\n");
      out.write("    <table style=\"border-collapse: collapse; margin: 25px 0px 0px 25px;\" class=\"tables\" border=\"1\">\r\n");
      out.write("         <tr>\r\n");
      out.write("            <th colspan=\"2\">Module 2 - Introduksjon til BlueJ</th>\r\n");
      out.write("         </tr>\r\n");
      out.write("         <tr>\r\n");
      out.write("            <td><b>Beskrivelse</b></td>\r\n");
      out.write("            <td>Studenten skal lage en blå sirkel og få den til å bevege på seg</td>\r\n");
      out.write("         </tr>      \r\n");
      out.write("         <tr>\r\n");
      out.write("             <td><b>Læreplanmål</b></td>\r\n");
      out.write("         <td>\r\n");
      out.write("          <ul>\r\n");
      out.write("             <li>Forstå grunnlegende funksjoner ved blueJ</li>\r\n");
      out.write("             <li>Kune lagre, slette og exportere filer i blueJ</li>\r\n");
      out.write("             <li>Forstå forskjellen på klasser og objekter</li>\r\n");
      out.write("          </ul>\r\n");
      out.write("         </td>\r\n");
      out.write("         </tr> \r\n");
      out.write("         <tr>\r\n");
      out.write("             <td><b>Ressurser<br>og vedlegg</b></td>\r\n");
      out.write("             <td>\r\n");
      out.write("                 <ul>\r\n");
      out.write("                     <li> https://www.bluej.org/ </li>\r\n");
      out.write("                     <li> https://www.youtube.com/watch?v=UMcijMC4Dwk </li>\r\n");
      out.write("                 </ul>\r\n");
      out.write("             </td>\r\n");
      out.write("         </tr>\r\n");
      out.write("      </table>\r\n");
      out.write("    \r\n");
      out.write("    <h3>Oversikt</h3> \r\n");
      out.write("    \r\n");
      out.write("    <table class=\"tables\" style=\"border-collapse: collapse; margin: 25px 0px 0px 25px;\" border=\"1\">              \r\n");
      out.write("        <tr>\r\n");
      out.write("            <th>Navn</th>\r\n");
      out.write("            <th>Filnavn</th>\r\n");
      out.write("            <th>Innleveringsdato</th>\r\n");
      out.write("            <th>Status</th>\r\n");
      out.write("            <th>Poeng</th>\r\n");
      out.write("            <th>Vurdert av</th>\r\n");
      out.write("            <th>Kommentar</th>\r\n");
      out.write("        </tr>            \r\n");
      out.write("        <tr>         \r\n");
      out.write("            <td>Brage Fosso</td>\r\n");
      out.write("            <td>Modul2.jar</td>\r\n");
      out.write("            <td>01.02.18 04:20</td>\r\n");
      out.write("            <td>Godkjent</td>\r\n");
      out.write("            <td>10</td> \r\n");
      out.write("            <td>Christian Moen</td>\r\n");
      out.write("            <td></td>            \r\n");
      out.write("      </tr>    \r\n");
      out.write("      <tr>     \r\n");
      out.write("            <td>Jonas Omdal</td>\r\n");
      out.write("            <td></td>\r\n");
      out.write("            <td></td>\r\n");
      out.write("            <td>Ikke levert</td>\r\n");
      out.write("            <td></td>\r\n");
      out.write("            <td></td>\r\n");
      out.write("            <td></td>  \r\n");
      out.write("      </tr>\r\n");
      out.write("            <tr>   \r\n");
      out.write("            <td>Mathias Evensen</td>\r\n");
      out.write("            <td>Modul2boi.jar</td>\r\n");
      out.write("            <td>02.05.18 21:54</td>\r\n");
      out.write("            <td>Levert</td>\r\n");
      out.write("            <td><input type=\"text\" name=\"Poeng\"</td>\r\n");
      out.write("            <td><input type=\"text\" name=\"Vurdert av\"</td>\r\n");
      out.write("            <td><input type=\"text\" name=\"Kommentar\"</td>          \r\n");
      out.write("      </tr>     \r\n");
      out.write("    </table><br>\r\n");
      out.write("    \r\n");
      out.write("    <form style=\"margin-left: 25px;\" name=\"myForm\" action=\"kjøyr\" method=\"POST\">\r\n");
      out.write("                    <input type=\"submit\" value=\"Submit\" name=\"submit\"/>\r\n");
      out.write("&emsp;\r\n");
      out.write("                    <a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/modules\">Tilbake</a>\r\n");
      out.write("    </body>\r\n");
      out.write(" </html>\r\n");
      out.write(" \r\n");
      out.write(" ");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
