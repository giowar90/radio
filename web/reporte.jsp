<%-- 
    Document   : reporte
    Created on : 5/08/2015, 09:21:01 PM
    Author     : GIO
--%>

<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="net.sf.jasperreports.engine.JasperReport"%>
<%@page import="net.sf.jasperreports.engine.JasperCompileManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <jsp:useBean id="con" class="conexion.conexion"></jsp:useBean>
        <%
            try {
              if(con.conectar()){
                  String codigo = request.getParameter("codigo");
                  JasperReport reporte = JasperCompileManager.compileReport("E:\\Documents\\NetBeansProjects\\TOPradio\\src\\java\\reportes\\reporteTransmicion.jrxml");
                  Map parametros = new	HashMap();
                  parametros.put("codigo",codigo);
                  byte[] bytes = JasperRunManager.runReportToPdf(reporte,parametros,con.conexion);
                  response.setContentType("application/pdf");
                  response.setContentLength(bytes.length);
                  ServletOutputStream outstream = response.getOutputStream();
                  outstream.write(bytes,0,bytes.length);
                  outstream.flush();
                  outstream.close();
              }
          } catch (Exception e) {
             out.print(e);
          }
        %>
    </body>
</html>
