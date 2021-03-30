/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.OrderEntity;
import com.mycompany.spring_mvc_project_final.entities.ProductEntity;
import com.mycompany.spring_mvc_project_final.repository.OrderRepository;
import com.mycompany.spring_mvc_project_final.repository.ProductRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author PC
 */
@Service
public class OrderService {
        @Autowired
    private OrderRepository orderRepository;
    
    
    public List<OrderEntity> getOrders(){
        return (List<OrderEntity>) orderRepository.findAll();
    }
     
    
    
    public void save(OrderEntity orderEntity){
       orderRepository.save(orderEntity);
    }
    
    public OrderEntity findOrderById(int id) {
        Optional<OrderEntity> optional = orderRepository.findById(id);
        if (optional.isPresent()) {
            return optional.get();
        } else {
            return new OrderEntity();
        }
    }
    
    
    
}
