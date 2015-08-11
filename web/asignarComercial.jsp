<%-- 
    Document   : asignarComercial
    Created on : 5/08/2015, 07:41:38 PM
    Author     : GIO
--%>

<%@page import="java.sql.ResultSet"%>
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
            String codigo = request.getParameter("codigo");
            int id = Integer.parseInt(con.consultarID(session.getAttribute("usuario").toString(),session.getAttribute("pass").toString()));
            String resultado = con.asignar(codigo,id);
            if(resultado.equals("Insercion realizada")){
                 response.sendRedirect("todos.jsp?codigo=0");
            }
        %>
    </body>
</html>
