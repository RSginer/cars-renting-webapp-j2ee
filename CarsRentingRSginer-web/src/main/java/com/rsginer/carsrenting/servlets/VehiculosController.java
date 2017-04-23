/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rsginer.carsrenting.servlets;

import com.rsginer.carsrenting.domain.Categoria;
import com.rsginer.carsrenting.service.CategoriasServiceLocal;
import com.rsginer.carsrenting.service.VehiculosServiceLocal;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Rubén
 */
@WebServlet(name = "VehiculosController",
        loadOnStartup = 1,
        urlPatterns = {"/listaVehiculos","/nuevoVehiculo"})
public class VehiculosController extends HttpServlet {

    @EJB
    private CategoriasServiceLocal categoriasService;

    @EJB
    private VehiculosServiceLocal vehiculosService;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String userPath = request.getServletPath();
        switch (userPath) {
            case "/listaVehiculos":
                listarVehiculos(request, response);
                break;
            case "/nuevoVehiculo":
                mostrarFormularioVehiculo(request, response);
            default:
                break;
        }
    }
    
    private void listarVehiculos(HttpServletRequest request, HttpServletResponse response) {
           try {
            List lista = this.vehiculosService.listaVehiculos();
            ArrayList<Categoria> listaVehiculos = new ArrayList<>(lista);
             request.getSession().setAttribute("listaVehiculos", listaVehiculos);
             RequestDispatcher rd = request.getRequestDispatcher("/listaVehiculos.jsp");
             rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
        private void mostrarFormularioVehiculo(HttpServletRequest request, HttpServletResponse response) {
           try {
            List lista = this.categoriasService.listaCategorias();
            ArrayList<Categoria> listaCategorias = new ArrayList<>(lista);
             request.getSession().setAttribute("listaCategorias", listaCategorias);
             RequestDispatcher rd = request.getRequestDispatcher("/detalleVehiculo.jsp?accion=nuevo");
             rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
