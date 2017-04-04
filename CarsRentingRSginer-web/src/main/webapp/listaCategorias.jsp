
<%@page import="java.util.List"%>
<%@page import="com.rsginer.carsrenting.domain.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Listado Categorias</title>
    </head>
    <body>

        <h1>Listado de Categorias</h1>
        <h2></h2>
        <a href="addCategoria.jsp">Agregar Categoría</a>
        <br/>
        <br/>

        <table border="1">
            <tr>
                <th>Id</th>
                <th>Descripcion</th>
            </tr>
            <%
                ArrayList<Categoria> listaCategorias = (ArrayList<Categoria>) session.getAttribute("listaCategorias");
                for (int i = 0; i < listaCategorias.size(); i++) {
                    int id = listaCategorias.get(i).getId();
                    String descripcion = listaCategorias.get(i).getDescripcion();

            %>
            <tr>
                <td><%=id%></td>
                <td><%=descripcion%></td>
            </tr>
            <%}%>
        </table>
        <br>
        <a href="index.html">Regresar al Inicio</a>
    </body>
</html>