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
            <tr>
               <td><label for="bastidor">Bastidor</label></td>
               <td><input type="text" id="bastidor" value="<%=((accion.equalsIgnoreCase("editar")) ? request.getParameter("bastidor") : "")%>"></td>
            </tr>
            <tr>
               <td><label for="matricula">Matricula</label></td>
               <td><input type="text" id="matricula" value="<%=((accion.equalsIgnoreCase("editar")) ? request.getParameter("matricula") : "")%>"></td>
            </tr>
            <tr>
               <td><label for="marca">Marca</label></td>
               <td><input type="text" id="marca" value="<%=((accion.equalsIgnoreCase("editar")) ? request.getParameter("marca") : "")%>"></td>
            </tr>
              <tr>
               <td><label for="marca">Kilometros</label></td>
               <td><input type="text" id="kilometros" value="<%=((accion.equalsIgnoreCase("editar")) ? request.getParameter("kilometros") : "")%>"></td>
            </tr>
              <tr>
               <td><label for="modelo">Modelo</label></td>
               <td><input type="text" id="modelo" value="<%=((accion.equalsIgnoreCase("editar")) ? request.getParameter("modelo") : "")%>"></td>
            </tr>
              <tr>
               <td><label for="categoria">Categoria</label></td>
               <td>
                   <select id="categoria">
                       <%
                           ArrayList<Categoria> categorias = (ArrayList<Categoria>) session.getAttribute("listaCategorias");
                           for (Categoria categoria: categorias) {
                                   %>
                                           <option value="<%=categoria.getId()%>"><%=categoria.getDescripcion()%></option>
                                   <%
                               }
                       %>
               
                   </select>
                   <input type="text" id="categoria" >
               </td>
            </tr>
        </table>
    </body>
</html>
