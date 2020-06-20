<%-- 
    Document   : editarPassword
    Created on : 19 jun. 2020, 18:55:53
    Author     : AMD
--%>


<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar password</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" 
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    </head>
    <body>
        <%
            int id = Integer.parseInt(request.getParameter("id_usuario"));
            String passactual = request.getParameter("pass1");
            boolean value = false;
            
            Connection conexion = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conexion = DriverManager.getConnection("jdbc:mysql://localhost/usuarios", "root", "");
                stmt = conexion.prepareStatement("SELECT * FROM usuario WHERE password=MD5(?) AND id_usuario=?");

                stmt.setString(1, passactual);
                stmt.setInt(2, id);
                rs = stmt.executeQuery();
                
                if(rs.next() == true){
                    value = true;
                }
              
                String nuevapass1 = request.getParameter("pass2");
                String nuevapass2 = request.getParameter("pass3");

                if (value == true) {
                    if (nuevapass1.equals(nuevapass2)) {
                        stmt = conexion.prepareStatement("UPDATE usuario SET password=MD5(?) where ?=id_usuario");
                        stmt.setString(1, nuevapass1);
                        stmt.setInt(2, Integer.parseInt(request.getParameter("id_usuario")));
                        stmt.executeUpdate();
                            %>
                            <br>
                            <div class="alert alert-success" role="alert">
                                <h3>Se ha actualizado la contraseña correctamente</h3>
                            </div>
                        <%
                    }else{%>
                            <br>
                            <div class="alert alert-danger" role="alert">
                                <h3>No coinciden las contraseñas</h3>
                            </div>
                  <%}
                }else{%>
                    <br>
                    <div class="alert alert-danger" role="alert">
                         <h3>Error de contraseña</h3>
                    </div>
                <%}
        }finally {
        %>
        <br>
        <div class="shadow-lg p-3 mb-5 bg-white rounded"><a class="btn btn-primary btn-block" href="index.jsp">Regresar</a></div>
        <%
            }
        %>
    </body>
</html>