<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
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
                            <div class="panel-heading text-center">Nuevo comercial</div>
                            <div class="panel-body ">
                                <form action="altaComercial.jsp" method="post">
                                    <table class="table">
                                    <tr >
                                        <td>
                                           <div class="input-group btn-block">
                                                <span class="input-group-addon" id="basic-addon1"><i class="fa fa-calendar-o"></i></span>
                                                <input class="form-control" type="text" name="nombre" placeholder="Nombre del comercial"/>
                                            </div><br />
                                        </td>
                                        <td>&nbsp;&nbsp;&nbsp;</td>
                                        <td>
                                            <div class="input-group btn-block">
                                                <span class="input-group-addon" id="basic-addon1"><i class="fa fa-calendar-o"></i></span>
                                                <input class="form-control" type="text" name="duracion" placeholder="Duarcion en segundos (ss)"/>
                                            </div><br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <%out.print(con.consultarClientes());%>
                                        </td>
                                        <td>&nbsp;&nbsp;&nbsp;</td>
                                        <td>
                                            <div class="input-group btn-block">
                                                <span class="input-group-addon" id="basic-addon1"><i class="fa fa-comment-o"></i></span>
                                                <input class="form-control" type="text" name="descripcion" placeholder="Descripcion"/>

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
                    <div class="col-sm-2"></div>
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
