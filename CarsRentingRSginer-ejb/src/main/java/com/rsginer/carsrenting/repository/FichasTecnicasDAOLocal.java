/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rsginer.carsrenting.repository;

import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Rubén
 */
@Local
public interface FichasTecnicasDAOLocal {
     List findAll();


}
