/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.OrderDetailEntity;
import com.mycompany.spring_mvc_project_final.entities.OrderEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 *
 * @author PC
 */
@Repository
public interface OrderDetailRepository extends CrudRepository<OrderDetailEntity, Integer>{
    @Query(value = "SELECT o FROM OrderEntity o WHERE o.users.id = ?1")
    List<OrderEntity> findOrderByUserId(@Param("id") int id);

    @Query(value = "SELECT od FROM OrderDetailEntity od WHERE od.orders.users.id = ?1")
    List<OrderDetailEntity> findOrderDetailsByOrderId(int id);
}
