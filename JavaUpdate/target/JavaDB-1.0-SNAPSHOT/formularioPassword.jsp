<%-- 
    Document   : formularioPassword
    Created on : 19 jun. 2020, 18:25:41
    Author     : AMD
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String password = "";
    Connection conexion = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection("jdbc:mysql://localhost/usuarios", "root", "");
        stmt = conexion.prepareStatement("SELECT * FROM usuario WHERE id_usuario=?");
        stmt.setInt(1, id);
        rs = stmt.executeQuery();
        rs.next();
        rs.getString("password");
        password = rs.getString("password");
 
    } catch (Exception e) {
        out.println(e.getMessage());
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title>Cambio de contraseña</title>
    </head>
    <body>
        <div class="container">
            <h1>Modificar contraseña</h1>
            <form action="editarPassword.jsp" methode="POST" class="form" >
                <div class="form-row">
                  
                    <div class="col">
                        <input  type="hidden" class="form-control" name="id_usuario" value="<%=id%>"/>
                    </div>
                 
                   
                    <div class="col">
                        <input  type="text"  class="form-control" placeholder="Contraseña antigua" name="pass1" requiered/>
                    </div>
                    <div class="col">
                        <input  type="text" class="form-control" placeholder="Nueva contraseña" name="pass2" requiered/>
                    </div>
                    <div class="col">
                        <input  type="text"  class="form-control" placeholder="Nueva contraseña" name="pass3" requiered/>
                    </div>
                  
                    <div class="col">
                        <input type="submit" class="btn btn-success btn-block" value="Enviar" />
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>