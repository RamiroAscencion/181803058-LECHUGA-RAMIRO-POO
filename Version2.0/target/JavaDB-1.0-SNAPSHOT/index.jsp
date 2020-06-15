<%-- 
    Document   : index
    Created on : 29 may. 2020, 9:00:58
    Author     : AMD
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    Connection conexion = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection("jdbc:mysql://localhost/usuarios", "root", "");
        stmt = conexion.prepareStatement("Select * from usuario");
        rs = stmt.executeQuery();

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title>CRUD</title>
    </head>
    <body>
        <h1>Los registros en la base de datos son: </h1>
        <div class="container">
            <table class="table table-hover">
                <thead class=" thead-dark">
                    <tr>
                        <td colspan="2"><h2>Usuarios</h2></td>
                        <td><a class="btn btn-success btn-block" href="formularioUsuario.jsp">Agregar usuario</a></td>

                    </tr>


                    <tr>
                        <th>#</th>
                        <th>Nombre</th>
                        <th scope="col">Contraseña</th>
                    </tr>
                </thead>
                <tbody>
                    <% while (rs.next()) {%>
                    <tr>
                        <th><%=rs.getInt("id_usuario")%></th>
                        <td><%=rs.getString("usuario")%></td>
                        <td><%=rs.getString("password")%></td>
                    </tr>
                    <% }%>
                </tbody>
            </table>
        </div>
    </body>
</html>
<%
    } catch (SQLSyntaxErrorException e) {
        switch (e.getErrorCode()) {
            case 1049:
                out.println("<b> Error SQL: </b> Error en la conexion");
                break;
            case 1146:
                out.println("<b> Error SQL: </b> La tabla no existe");
                break;
        }
    }%>