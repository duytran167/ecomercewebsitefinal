/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.ColorEntity;
import com.mycompany.spring_mvc_project_final.entities.ProductDetailEntity;
import com.mycompany.spring_mvc_project_final.entities.ProductEntity;
import com.mycompany.spring_mvc_project_final.entities.SizeEntity;
import com.mycompany.spring_mvc_project_final.repository.ProductRepository;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
public class ProductService{

    @Autowired
    private ProductRepository productRepository;
    
    
    public List<ProductEntity> getProducts(){
        return (List<ProductEntity>) productRepository.findAll();
    }
     
    
    
    public void save(ProductEntity productEntity){
       productRepository.save(productEntity);
    }
    
    public ProductEntity findProductById(int id) {
        Optional<ProductEntity> optional = productRepository.findById(id);
        if (optional.isPresent()) {
            return optional.get();
        } else {
            return new ProductEntity();
        }
    }
    public List<ColorEntity> getListColorDetails (int id) {
        List<ColorEntity> list = new ArrayList<>();
        ProductEntity a = findProductById(id);
        for(ProductDetailEntity product : a.getProduct_detail()) {
            
          list.add(product.getColor());
            
        }
        return list;
    }
    public List<SizeEntity> getListSizeDetails (int id) {
        List<SizeEntity> list = new ArrayList<>();
        ProductEntity a = findProductById(id);
        for(ProductDetailEntity product : a.getProduct_detail()) {
            
          list.add(product.getSize());
            
        }
        return list;
    }
    
    public List<ProductEntity> getNewProducts(Date created_date){
        return (List<ProductEntity>) productRepository.findByNewProduct(created_date);
    }

    public List<ProductEntity> getProductsMostSell(String price){
            return (List<ProductEntity>) productRepository.findByProductMostSell(price);
    }

    


    
}


