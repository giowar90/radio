<%-- 
    Document   : cancelarComercial
    Created on : 5/08/2015, 01:03:20 AM
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
            String codigo = request.getParameter("codigo");
            int id = Integer.parseInt(request.getParameter("id"));
            String resultado = con.cancelarComercial(codigo, id);
            if(resultado.equals("Insercion realizada")){
                response.sendRedirect("todos.jsp?codigo=0");
            }else{
                
            }
        %>
    </body>
</html>
