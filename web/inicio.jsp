<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TOP 91.5 FM</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap.css" />
        <link rel="stylesheet" href="font-awesome/css/font-awesome.css" />
        <link rel="stylesheet" href="css/estilos.css" />
        <link href='images/top-91.5.jpg' rel='shortcut icon' type='image/jpg'> 
    </head>
    <body>
        <jsp:useBean id="con" class="conexion.conexion"></jsp:useBean>
        <nav class="navbar navbar-default navbar-inverse" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="todos.jsp?codigo=0">TOP 91.5</a>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="todos.jsp?codigo=0">Inicio</a>
                        </li>
                        <li>
                            <a href="inicio.jsp">Asignar comercial</a>
                        </li>
                        <li>
                            <a href="nuevo.jsp">Nuevo comercial</a>
                        </li>
                        <li>
                            <a href="cliente.jsp">Nuevo cliente</a>
                        </li>
                        <li>
                            <a href="index.html">Salir</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="cont container-fluid">
            <div class="row">
                <div class="col-sm-12">
                    <div class="col-sm-12">
                        <div class="panel panel-default">
                            <div class="panel-heading text-center">COMERCIAL</div>
                            <table class="table table-hover">
                                <tr>
                                    <th>Codigo</th>
                                    <th>Nombre</th>
                                    <th>Duracion</th>
                                    <th>Descripción</th>
                                    <th>Nombre del cliente</th>
                                    <th>Dirección</th>
                                    <th>Telefono</th>
                                    <th>Correo electronico</th>
                                    <th>Selecionar</th>
                                    <th>Eiiminar</th>
                                </tr>
                                <%
                                    ResultSet rs = con.consultar("SELECT * FROM comercial com inner join cli_com  cc on(com.codigo=cc.codigo_comer) inner join cliente cli on(cli.idcliente=cc.idCliente)where status = 'Activo';");
                                    if(rs.next()){
                                        do{
                                %>
                                <tr>
                                    <td><%=rs.getString(1)%></td>
                                    <td><%=rs.getString(2)%></td>
                                    <td><%=rs.getString(3)%></td>
                                    <td><%=rs.getString(4)%></td>
                                    <td><%=rs.getString(10)%></td>
                                    <td><%=rs.getString(11)%></td>
                                    <td><%=rs.getString(12)%></td>
                                    <td><%=rs.getString(13)%></td>
                                    <td>
                                        <a href="asignarComercial.jsp?codigo=<%=rs.getString(1)%>" class=""><i class="fa fa-check-circle-o"></i></a>
                                    </td>
                                    <td>
                                        <a href="eliminar.jsp?id=<%=rs.getString(1)%>" class=""><i class="fa fa-trash"></i></a>
                                    </td>
                                </tr>
                                <%
                                            }while(rs.next());
                                    }
                                %>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="footer text-center">
            <div class="container">
                <small>Desarrollado por <a href="">VERO</a></small>
            </div>
        </footer>
    </body>
</html>
