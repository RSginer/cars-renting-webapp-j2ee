<%-- 
    Document   : detalleVehiculo
    Created on : 23-abr-2017, 22:45:21
    Author     : Rubén
--%>

<%@page import="com.rsginer.carsrenting.domain.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        String accion = request.getParameter("accion");
    %>
    <body>
        <h1><%=accion.toString().toUpperCase()%> Vehiculo</h1>

        <table>
            <caption>Datos generales del vehiculo</caption>
            <tr>
                <td><label for="bastidor">Bastidor</label></td>
                <td><input type="text" name="bastidor" id="bastidor" value="<%=((accion.equalsIgnoreCase("editar")) ? request.getParameter("bastidor") : "")%>"></td>
            </tr>
            <tr>
                <td><label for="matricula">Matricula</label></td>
                <td><input type="text" name="matricula" id="matricula" value="<%=((accion.equalsIgnoreCase("editar")) ? request.getParameter("matricula") : "")%>"></td>
            </tr>
            <tr>
                <td><label for="marca">Marca</label></td>
                <td><input type="text" id="marca" name="marca" value="<%=((accion.equalsIgnoreCase("editar")) ? request.getParameter("marca") : "")%>"></td>
            </tr>
            <tr>
                <td><label for="marca">Kilometros</label></td>
                <td><input type="text" id="kilometros" name="kilometros" value="<%=((accion.equalsIgnoreCase("editar")) ? request.getParameter("kilometros") : "")%>"></td>
            </tr>
            <tr>
                <td><label for="modelo">Modelo</label></td>
                <td><input type="text" id="modelo" name="modelo" value="<%=((accion.equalsIgnoreCase("editar")) ? request.getParameter("modelo") : "")%>"></td>
            </tr>
            <tr>
                <td><label for="categoria">Categoria</label></td>
                <td>
                    <select id="categoria">
                        <%
                            ArrayList<Categoria> categorias = (ArrayList<Categoria>) session.getAttribute("listaCategorias");
                            for (Categoria categoria : categorias) {
                        %>
                        <option value="<%=categoria.getId()%>"><%=categoria.getDescripcion()%></option>
                        <%
                            }
                        %>
                    </select>
                </td>
            </tr>
        </table>
        <br/>
        <table>
            <caption>Ficha técnica</caption>
            <tr>
                <td>Id</th>
                <td><input type="text" name="idFicha"></th>
             
            </tr>
            <tr>
                <td>Fecha Itv</td>
                <td><input type="date" name="fechaItv"></td>
            </tr>
            <tr>
                <td>Propietario</td>
                <td><input type="text" name="propietario"></td>
            </tr>
            <tr>
                <td>Observaciones</td>
                <td><input type="text" name="observaciones"></td>
            </tr>
            <tr>
                <td><input type="reset" value="Reiniciar"></td>
                <td><input type="submit" value="Enviar"></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
            </tr>
        </table>
    </body>
</html>
