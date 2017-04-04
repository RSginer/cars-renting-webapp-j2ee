/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rsginer.carsrenting.service;

import com.rsginer.carsrenting.domain.Categoria;
import com.rsginer.carsrenting.repository.CategoriasDAOLocal;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;

/**
 *
 * @author alumno
 */
@Stateless
public class CategoriasService implements CategoriasServiceLocal {

    @EJB
    private CategoriasDAOLocal categoriasDAO;
    
    @Override
    public List listaCategorias() {
        return categoriasDAO.findAll();
    }
}
