/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rsginer.carsrenting.repository;

import com.rsginer.carsrenting.domain.FichaTecnica;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Rubén
 */
@Stateless
public class FichasTecnicasDAO implements FichasTecnicasDAOLocal {
    @PersistenceContext(unitName = "carsrentingPU")
    EntityManager em;

    @Override
    public List findAll() {
        List a = em.createNamedQuery("FichaTecnica.findAll").getResultList();
        return a;
    }
    
    
}
