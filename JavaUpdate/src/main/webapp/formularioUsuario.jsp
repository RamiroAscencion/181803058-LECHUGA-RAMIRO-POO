<%-- 
    Document   : formularioUsuario
    Created on : 12 jun. 2020, 8:48:45
    Author     : AMD
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String titulo = "Agregar Usuario", usuario = "", action="agregarUsuario.jsp";
    int id = 0;
    if (request.getParameter("id") != null) {
        id = Integer.parseInt(request.getParameter("id"));
        titulo = "Editar Usuario";
        action = "editarUsuario.jsp";
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
            usuario = rs.getString("usuario");
            rs.getString("password");
            rs.getString("usuario");
        } catch (Exception e) {
            out.println(e.getMessage());
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title>Insercion de Usuario</title>
    </head>
    <body>
        <div class="container">
            <h1><%=titulo%></h1>
            <form action="<%out.print(action);%>" methode="POST" class="form" >
                <div class="form-row">
                    <%if(id != 0 ){%>
                    <div class="col">
                        <input  type="hidden" class="form-control" name="id_usuario" value="<%=id%>"/>
                    </div>
                    <% } %>
                    <div class="col">
                        <input  type="text" value="<%=usuario%>" class="form-control" placeholder="Nombre" name="usuario" requiered/>
                    </div>
                     <div class="col">
                        <input type="int" class="form-control" placeholder="Edad" name="edad"  requiered />
                    </div>
                    <%if (id == 0) {%>
                    <div class="col">
                        <input type="password" class="form-control" placeholder="Contraseña" name="password"  requiered />
                    </div>
                    <% }%>
                    <div class="col">
                        <input type="submit" class="btn btn-success btn-block" value="Enviar" />
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>