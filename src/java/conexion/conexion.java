/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author GIO
 */
public class conexion {
    
    public Connection conexion;
    public boolean conectar(){
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/estacion","root","mame32");
            if(conexion != null){
                System.out.println("Conexion exitosa");
                return true;
            }
        } catch (Exception e) {
            System.out.println("Conexion fallida "+e);
        }
        return false;
    }
    
     public ResultSet login(String usuario, String pass){
        ResultSet rs = null;
        try {
            if(conectar()){
                Statement stt = conexion.createStatement();
                rs = (ResultSet) stt.executeQuery("SELECT * FROM estacion.programa where usuario = '"+usuario+"' and pass = '"+pass+"';");
            }
            return rs;
        } catch (Exception e) {
            System.out.println("Erroral conectar "+e);
        }
        return rs;
    }
     
     public ResultSet consultar(String sql){
        ResultSet rs = null;
        try {
            if(conectar()){
                Statement stt = conexion.createStatement();
                rs = (ResultSet) stt.executeQuery(sql);
            }
            return rs;
        } catch (Exception e) {
            System.out.println("Erroral conectar "+e);
        }
        return rs;
    }
     
     public String consultarID(String usuario, String pass){
        ResultSet rs = null;
        String id = "";
        try {
            if(conectar()){
                Statement stt = conexion.createStatement();
                rs = (ResultSet) stt.executeQuery("SELECT * FROM estacion.programa where usuario = '"+usuario+"' and pass = '"+pass+"';");
            }
            if(rs.next()){
                do{
                    id = rs.getString(1);
                }while(rs.next());
            }
            return id;
        } catch (Exception e) {
            System.out.println("Erroral conectar "+e);
        }
        return id;
    }
     
     public String consultarClientes(){
        ResultSet rs = null;
        String resultado = "";
        try {
            if(conectar()){
                Statement stt = conexion.createStatement();
                rs = (ResultSet) stt.executeQuery("SELECT * FROM estacion.cliente;");
            }
            resultado = "<select type=\"text\" name=\"idCliente\" class=\"form-control\">  \n" +
"                                                <option selected=\"selected\"> Cliente</option> ";
            if(rs.next()){
                do{
                    resultado = resultado + "<option value='"+rs.getString(1)+"'> "+rs.getString(2)+"</option> ";
                }while(rs.next());
            }
            resultado = resultado + "</select><br />";
            return resultado;
        } catch (Exception e) {
            System.out.println("Erroral conectar "+e);
        }
        return resultado;
    }
     
     public String eliminar(String codigo){
        try {
            String sql ="update comercial set status = 'Cancelado' where codigo = '"+codigo+"';";
            if(conectar()){
                Statement stt = conexion.createStatement();
                stt.execute(sql);
            }
            return "Insercion realizada";
        } catch (Exception e) {
            System.out.println("Error en la conexion "+e);
        }
        return "ERROR";
    }
     
     public String cancelarComercial(String codigo, int id){
        try {
            String sql ="update programa_comercial set status_pc = 'Cancelado' where codigo = '"+codigo+"' and id_programa = "+id+";";
            if(conectar()){
                Statement stt = conexion.createStatement();
                stt.execute(sql);
            }
            return "Insercion realizada";
        } catch (Exception e) {
            System.out.println("Error en la conexion "+e);
        }
        return "ERROR";
    }
     
     public String programacion(String codigo,String fecha,String hora){
        try {
            String sql ="insert into transmicion(codigo,fecha,hora) values('"+codigo+"','"+fecha+"','"+hora+"');";
            if(conectar()){
                Statement stt = conexion.createStatement();
                stt.execute(sql);
            }
            return "Insercion realizada";
        } catch (Exception e) {
            System.out.println("Error en la conexion "+e);
        }
        return "ERROR";
    }
     
     public String altaComercial(String codigo,String nombre,String duracion,String descripcion){
        try {
            String sql ="insert into comercial(codigo,nombre,duracion,Decripcion,status) values('"+codigo+"','"+nombre+"','"+duracion+"','"+descripcion+"','Activo');";
            if(conectar()){
                Statement stt = conexion.createStatement();
                stt.execute(sql);
            }
            return "Insercion realizada";
        } catch (Exception e) {
            System.out.println("Error en la conexion "+e);
        }
        return "ERROR";
    }
     
     public String altaAsoc(String codigo,int id){
        try {
            String sql ="insert into cli_com(codigo_comer,idCliente) values('"+codigo+"',"+id+");";
            if(conectar()){
                Statement stt = conexion.createStatement();
                stt.execute(sql);
            }
            return "Insercion realizada";
        } catch (Exception e) {
            System.out.println("Error en la conexion "+e);
        }
        return "ERROR";
    }
     
     public String asignar(String codigo,int id){
        try {
            String sql ="insert into programa_comercial(codigo,id_programa) values('"+codigo+"',"+id+");";
            if(conectar()){
                Statement stt = conexion.createStatement();
                stt.execute(sql);
            }
            return "Insercion realizada";
        } catch (Exception e) {
            System.out.println("Error en la conexion "+e);
        }
        return "ERROR";
    }
    
}
