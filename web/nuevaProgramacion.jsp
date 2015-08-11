<%-- 
    Document   : nuevaProgramacion
    Created on : 4/08/2015, 11:57:35 PM
    Author     : GIO
--%>

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
            String fecha = request.getParameter("fecha");
            String hora = request.getParameter("hora")+":00";
            String codigo = request.getParameter("codigo");
            int id = Integer.parseInt(request.getParameter("id"));
            String resultado = con.programacion(codigo, fecha, hora);
            if(resultado.endsWith("Insercion realizada")){
                response.sendRedirect("todos.jsp?codigo=0");
            }else{
                response.sendRedirect("todos.jsp?codigo="+codigo);
            }
        %>
    </body>
</html>
