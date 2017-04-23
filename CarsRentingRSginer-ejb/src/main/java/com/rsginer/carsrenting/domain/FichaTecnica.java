/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rsginer.carsrenting.domain;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author Rubén
 */
@Entity
@Table(name = "ficha_tecnica")
@NamedQueries({
    @NamedQuery(name = "FichaTecnica.findAll", query = "SELECT f FROM FichaTecnica f"),
})
public class FichaTecnica {
        
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_ficha_tecnica")
    private int id;
    
    
    
    @Column(name = "propietario", length = 50, nullable = false)
    private String propietario;
    
    @Column(name = "fecha_itv", nullable = false)
    private Timestamp fechaItv;
    
    @Column(name = "observaciones", length = 255)
    private String observaciones;

    public FichaTecnica(int id, String propietario, Timestamp fechaItv, String observaciones) {
        this.id = id;
        this.propietario = propietario;
        this.fechaItv = fechaItv;
        this.observaciones = observaciones;
    }

    public FichaTecnica() {
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPropietario() {
        return propietario;
    }

    public void setPropietario(String propietario) {
        this.propietario = propietario;
    }

    public Timestamp getFechaItv() {
        return fechaItv;
    }

    public void setFechaItv(Timestamp fechaItv) {
        this.fechaItv = fechaItv;
    }


    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }
    
    
    
    
}
