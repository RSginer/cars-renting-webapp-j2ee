/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rsginer.carsrenting.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 *
 * @author Rubén
 */
@Entity
@Table(name = "vehiculos")
@NamedQueries({
    @NamedQuery(name = "Vehiculo.findAll", query = "SELECT v FROM Vehiculo v")
})
public class Vehiculo {
    
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_vehiculo")
    private int id;
    
    @Column(length = 50, nullable = false)
    private String bastidor;
    
    @Column(length = 50, nullable = false)
    private String matricula;
      
    @Column(length = 50, nullable = false)
    private String marca;
    
    @Column(length = 50)
    private String kilometros;
    
    @Column(length = 50, nullable = false)
    private String modelo;
    
    @ManyToOne
    @JoinColumn(name="categoria")
    private Categoria categoria;
    
    @OneToOne
    @JoinColumn(name = "ficha_tecnica")
    private FichaTecnica fichaTecnica;

    public Vehiculo(int id, String bastidor, String matricula, String marca, String kilometros, String modelo, Categoria categoria, FichaTecnica fichaTecnica) {
        this.id = id;
        this.bastidor = bastidor;
        this.matricula = matricula;
        this.marca = marca;
        this.kilometros = kilometros;
        this.modelo = modelo;
        this.categoria = categoria;
        this.fichaTecnica = fichaTecnica;
    }

    public Vehiculo() {
    }

    public FichaTecnica getFichaTecnica() {
        return fichaTecnica;
    }

    public void setFichaTecnica(FichaTecnica fichaTecnica) {
        this.fichaTecnica = fichaTecnica;
    }
    
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBastidor() {
        return bastidor;
    }

    public void setBastidor(String bastidor) {
        this.bastidor = bastidor;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getKilometros() {
        return kilometros;
    }

    public void setKilometros(String kilometros) {
        this.kilometros = kilometros;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }
    
    
}
