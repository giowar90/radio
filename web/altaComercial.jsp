<%-- 
    Document   : altaComercial
    Created on : 5/08/2015, 01:22:29 AM
    Author     : GIO
--%>

<%@page import="java.util.Random"%>
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
            String nombre = request.getParameter("nombre");
            String duracion = request.getParameter("duracion");
            int idCliente = Integer.parseInt(request.getParameter("idCliente"));
            String descripcion = request.getParameter("descripcion");
            Random rnd = new Random();
            String codigo = nombre.substring(0,2)+"-"+rnd.nextInt(900)+100;
            String resultado = con.altaComercial(codigo, nombre, duracion, descripcion);
            String resultado2 = con.altaAsoc(codigo, idCliente);
            if(resultado.equals("Insercion realizada") && resultado2.equals("Insercion realizada")){
                response.sendRedirect("todos.jsp?codigo=0");
            }else{
                response.sendRedirect("nuevo.jsp");
            }
        %>
    </body>
</html>
