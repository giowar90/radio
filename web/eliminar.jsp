<%-- 
    Document   : eliminar
    Created on : 4/08/2015, 10:42:38 AM
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
            String codigo = request.getParameter("id");
            String resultado = con.eliminar(codigo);
            if(resultado.equals("Insercion realizada")){
                response.sendRedirect("todos.jsp?codigo=0");
            }else{
                
            }
        %>
    </body>
</html>
