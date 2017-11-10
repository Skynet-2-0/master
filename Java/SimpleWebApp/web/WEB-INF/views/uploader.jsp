<%-- 
    Document   : uploader
    Created on : Nov 1, 2017, 8:20:32 PM
    Author     : Mr.Schibbye
--%>

<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.DataInputStream"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>File Uploading using Java</title>
</head>
<body>
    </h1>Uploading Files</h1>
        <%
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
            %>
</body>
</html>
