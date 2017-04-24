
<%@page import="com.rsginer.carsrenting.domain.FichaTecnica"%>
<%@page import="com.rsginer.carsrenting.domain.Vehiculo"%>
<%@page import="java.util.List"%>
<%@page import="com.rsginer.carsrenting.domain.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Listado Vehiculos</title>
    </head>
    <body>
        <h1>Listado de Vehiculos</h1>
        <h2></h2>
        <a href="nuevoVehiculo">Agregar Vehiculo</a>
        <br/>
        <br/>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Bastidor</th>
                <th>Matricula</th>
                <th>Marca</th>
                <th>Kilometros</th>
                <th>Modelo</th>
                <th>Categoria</th>
                <th>Ficha técnica</th>
            </tr>
            <%
                ArrayList<Vehiculo> listaVehiculos = (ArrayList<Vehiculo>) session.getAttribute("listaVehiculos");
                for (int i = 0; i < listaVehiculos.size(); i++) {
                   Vehiculo vehiculo = listaVehiculos.get(i);

            %>
            <tr>
                <td><%=vehiculo.getId()%></td>
                <td><%=vehiculo.getBastidor()%></td>
                <td><%=vehiculo.getMatricula()%></td>
                <td><%=vehiculo.getMarca()%></td>
                <td><%=vehiculo.getKilometros()%></td>
                <td><%=vehiculo.getModelo()%></td>
                <td><%=vehiculo.getCategoria().getDescripcion()%></td>         
                <td>
                    <table>
                        <%
                            FichaTecnica fichaTecnica = vehiculo.getFichaTecnica();
                        %>
                        <tr>
                        <th>id</th>
                        <th>propietario</th>
                        <th>fecha_itv</th>
                        <th>observaciones</th>
                        </tr>
                        <tr>
                            <td><%=fichaTecnica.getId()%></td>
                            <td><%=fichaTecnica.getPropietario()%></td>
                            <td><%=fichaTecnica.getFechaItv().toString()%></td>
                            <td><%=fichaTecnica.getObservaciones()%></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <%}%>
        </table>
        <br>
        <a href="index.html">Regresar al Inicio</a>
    </body>
</html>