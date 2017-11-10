package org.apache.jsp.WEB_002dINF.views;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.FileOutputStream;
import java.io.File;
import java.io.DataInputStream;

public final class uploader_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html; charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \n");
      out.write("\"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\n");
      out.write("<title>File Uploading using Java</title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    </h1>Uploading Files</h1>\n");
      out.write("        <form name=\"UploadForm\" action=\"uploader.jsp\" method=\"POST\" enctype=\"multipart/form-data\">\n");
      out.write("        ");

            String saveFile = new String();
            String contentType = request.getContentType();
            
            if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
            
                DataInputStream in = new DataInputStream(request.getInputStream());
                
                int formdataLength = request.getContentLength();
                byte dataBytes[] = new byte[formdataLength];
                int byteRead = 0;
                int totalBytesRead = 0;
                
                while (totalBytesRead < formdataLength) {
                    byteRead = in.read(dataBytes, totalBytesRead, formdataLength);
                    totalBytesRead += byteRead;
                }
                
                String file = new String(dataBytes);
                
                saveFile = file.substring(file.indexOf("filename\"") + 10);
                saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
                saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));

                int lastIndex = contentType.lastIndexOf("=");

                String boundary = contentType.substring(lastIndex + 1, contentType.length());

                int pos;

                pos = file.indexOf("filename=\"");
                pos = file.indexOf("\n", pos) + 1;
                pos = file.indexOf("\n", pos) + 1;
                pos = file.indexOf("\n", pos) + 1;

                int boundaryLocation = file.indexOf(boundary, pos) - 4;

                int startPos = ((file.substring(0, pos).getBytes())).length;
                int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;

                saveFile = "C:/uploadDirectory1" + saveFile;
                
                File ff = new File(saveFile);

                try{
                    FileOutputStream fileOut = new FileOutputStream(ff);
                    fileOut.write(dataBytes, startPos, (endPos - startPos));
                    fileOut.flush();
                    fileOut.close();
                } catch (Exception e){
                    out.println(e);
                    }
            }
            
      out.write("\n");
      out.write("        <input type=\"file\" name=\"file\" value=\"\" width=\"100\"/>\n");
      out.write("        <input type=\"submit\" value=\"Submit\" name=\"submit\" />\n");
      out.write("</form>\n");
      out.write("</body>\n");
      out.write("</html>\n");
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
