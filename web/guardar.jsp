<%-- 
    Document   : guardar
    Created on : 12/08/2015, 12:06:56 AM
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
            String nombre = request.getParameter("nombre");
            String dom= request.getParameter("dom");
            String email = request.getParameter("email");
            int tel = Integer.parseInt(request.getParameter("tel"));
            String resultado = con.altaCliente(nombre, dom, email, tel);
            if(resultado.equals("Insercion realizada")){
                response.sendRedirect("cliente.jsp");
            }else{
                response.sendRedirect("nuevo.jsp");
            }
        %>
    </body>
</html>
