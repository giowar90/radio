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
                                <a href="todos.jsp?codigo=0">Inico</a>
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
                        <div class="col-sm-2"></div>
                        <div class="col-sm-8">
                            <div class="panel panel-default">
                                <div class="panel-heading text-center">Comerciales</div>
                                <table class="table table-hover table-condensed">
                                    <tr>
                                        <th>Codigo</th>
                                        <th>Comercial</th>
                                        <th>Cliente</th>
                                        <th>Telefono</th>
                                        <th>Direccion</th>
                                        <th>Duracion</th>
                                        <th>Eiiminar</th>
                                        <th>Programar</th>
                                        <th>Reporte</th>
                                    </tr>
                                <%
                                    ResultSet rs = con.consultar("select co.codigo,co.nombre,cli.nombre,cli.domicilio,cli.telefono,co.duracion,co.duracion,pro.id from comercial co inner join programa_comercial pc on(co.codigo=pc.codigo)inner join programa pro on(pro.id=pc.id_programa)inner join cli_com cc on(cc.codigo_comer=co.codigo)inner  join cliente cli on(cli.idcliente=cc.idCliente)where pro.usuario = '" + session.getAttribute("usuario") + "' and pc.status_pc = 'Activo';");
                                    if (rs.next()) {
                                        do {
                                %>
                                <tr>
                                    <td><%=rs.getString(1)%></td>
                                    <td><%=rs.getString(2)%></td>
                                    <td><%=rs.getString(3)%></td>
                                    <td><%=rs.getString(4)%></td>
                                    <td><%=rs.getString(5)%></td>
                                    <td><%=rs.getString(6)%> seg(s).</td>
                                    <td>
                                        <a href="cancelarComercial.jsp?codigo=<%=rs.getString(1)%>&id=<%=rs.getString(8)%>" class=""><i class="fa fa-trash"></i></a>
                                    </td>
                                    <td>
                                        <a href="todos.jsp?codigo=<%=rs.getString(1)%>&id=<%=rs.getString(8)%>" class=""><i class="fa fa-clock-o"></i></a>
                                    </td>
                                    <td>
                                        <a href="reporte.jsp?codigo=<%=rs.getString(1)%>" class=""><i class="fa fa-file-archive-o"></i></a>
                                    </td>
                                </tr>
                                <%
                                        } while (rs.next());
                                    }
                                %>
                            </table>
                        </div>
                    </div>
                    <div class="col-sm-2"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <%
                        String cod = request.getParameter("codigo");
                        if (!cod.equals("0")) {
                    %>
                    <div class="col-sm-4"></div>
                    <div class="col-sm-4">
                        <div class="panel panel-default">
                            <div class="panel-heading text-center">Nueva programación</div>
                            <div class="panel panel-body">
                                <form action="nuevaProgramacion.jsp" method="post">
                                    <table>
                                        <tr >
                                            <td>
                                                <label for="">Fecha de transmición</label>
                                                <div class="input-group btn-block">
                                                    <span class="input-group-addon" id="basic-addon1"><i class="fa fa-calendar-o"></i></span>
                                                    <input class="form-control" type="date" min="2015-07-31" name="fecha" placeholder="Fecha"/>
                                                    <input type="hidden" name="codigo" value="<%=cod%>"/>
                                                    <input type="hidden" name="id" value="<%=request.getParameter("id")%>"/>
                                                </div><br />
                                            </td>
                                            <td>&nbsp;&nbsp;&nbsp;</td>
                                            <td>
                                                <label for="">Hora de transmición</label>
                                                <div class="input-group btn-block">
                                                    <span class="input-group-addon" id="basic-addon1"><i class="fa fa-clock-o"></i></span>
                                                    <input class="form-control" type="time" placeholder="Hora" name="hora"/>
                                                </div><br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="input-group btn-block">
                                                    <a href="todos.jsp?codigo=0" class="btn btn-danger btn-block">Cancelar</a>
                                                </div><br />
                                            </td>
                                            <td>&nbsp;&nbsp;&nbsp;</td>
                                            <td>
                                                <div class="input-group btn-block">
                                                    <input class="btn btn-success btn-block" type="submit" value="Guardar"/>
                                                </div><br />
                                            </td>
                                        </tr>
                                    </table>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4"></div>
                    <%
                        }
                    %>
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
