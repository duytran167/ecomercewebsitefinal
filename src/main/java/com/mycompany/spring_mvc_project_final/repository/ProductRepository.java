/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.ProductEntity;
import java.util.Date;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author PC
 */
@Repository
public interface ProductRepository extends CrudRepository<ProductEntity, Integer>  {
    
    
    
    
    ProductEntity findByName(String name);
    ProductEntity deleteById(int id);
    
     List<ProductEntity>findByNameContainingOrCategoryNameContaining(String name1, String name2);
     
     @Query(value = "Select * from product p order by p.created_date desc limit 4", nativeQuery = true)
     List<ProductEntity>findByNewProduct(Date created_date);
     
     @Query(value = "Select * from product p order by p.price desc limit 4", nativeQuery = true)
     List<ProductEntity>findByProductMostSell(String price);
     
    
     
    
     
}