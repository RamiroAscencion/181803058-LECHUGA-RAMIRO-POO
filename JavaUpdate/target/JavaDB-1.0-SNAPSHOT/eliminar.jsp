<%-- 
    Document   : eliminar
    Created on : 20 jun. 2020, 19:41:01
    Author     : AMD
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" 
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title>Borrar</title>
    </head>
    <body>
        <%
            if (request.getParameter("id") != null) {
                Connection conexion = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;

                try {
                    //Declarar el driver para la conexion a la base de datos
                    Class.forName("com.mysql.jdbc.Driver");
                    conexion = DriverManager.getConnection("jdbc:mysql://localhost/usuarios", "root", "");
                    stmt = conexion.prepareStatement("DELETE  FROM usuario WHERE id_usuario=?");
                    stmt.setString(1, request.getParameter("id"));
                    stmt.executeUpdate();

                } catch (Exception e) {
                    out.print(e.getMessage());
                }
            }
        %>

        <h1>Hello World!</h1>
        <div class="alert alert-success" role="alert">
            <h3>Se ha borrado el registro correctamente</h3>
            <div class="shadow-lg p-3 mb-5 bg-white rounded"><a class="btn btn-primary btn-block" href="index.jsp">Regresar</a></div>
        </div>
    </body>
</html>
