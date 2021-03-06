/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.entities;

import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author PC
 */
@Entity
@Table( name = "color")
public class ColorEntity {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @Column( name ="name")
    private String name;
    
    @OneToMany(mappedBy = "color", fetch = FetchType.LAZY,
            cascade = CascadeType.ALL)
    private Set<ProductDetailEntity> product_detail;

    public ColorEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Set<ProductDetailEntity> getProduct_detail() {
        return product_detail;
    }

    public void setProduct_detail(Set<ProductDetailEntity> product_detail) {
        this.product_detail = product_detail;
    }

   
    
    
    
}
