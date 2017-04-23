/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rsginer.carsrenting.service;

import com.rsginer.carsrenting.repository.CategoriasDAOLocal;
import com.rsginer.carsrenting.repository.VehiculosDAOLocal;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;

/**
 *
 * @author Rubén
 */
@Stateless
public class VehiculosService implements VehiculosServiceLocal {

    @EJB
    private VehiculosDAOLocal vehiculosDAO;
    
    @Override
    public List listaVehiculos() {
        return vehiculosDAO.findAll();
    }
}
