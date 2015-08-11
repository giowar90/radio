<%-- 
    Document   : verificar
    Created on : 4/08/2015, 09:48:01 AM
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
            String usuario = request.getParameter("usuario");
            String pass = request.getParameter("pass");
            session.setAttribute("usuario", usuario);
            session.setAttribute("pass", pass);
            ResultSet rs = con.login(usuario, pass);
            int id = 0;
            if(rs.next()){
                do{
                    id = Integer.parseInt(rs.getString(1));
                }while(rs.next());
                session.setAttribute("id",id);
                response.sendRedirect("todos.jsp?codigo=0");
            }
            else{
                response.sendRedirect("index.html");
            }
        %>
    </body>
</html>
