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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author PC
 */
@Entity
@Table(name="order_detail")
public class OrderDetailEntity {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
     @Column(name = "price")
    private double price;
     
     @Column(name="discount")
     private int discount;
     
     @Column(name="quantity")
     private int quantity;
     
     @Column(name = "paymentMethod")
    private String paymentMethod;

    public OrderDetailEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    

    
    @ManyToOne
    @JoinColumn(name = "orderId")
    private OrderEntity orders;

    public OrderEntity getOrders() {
        return orders;
    }

    public void setOrders(OrderEntity orders) {
        this.orders = orders;
    }

    
    
    @ManyToOne
    @JoinColumn(name = "productDetailId")
    private ProductDetailEntity Product_Detail;

    public ProductDetailEntity getProduct_Detail() {
        return Product_Detail;
    }

    public void setProduct_Detail(ProductDetailEntity Product_Detail) {
        this.Product_Detail = Product_Detail;
    }

   

    
    

    public double getTotalPrice(){
        double sum = 0;
        for(int i = 1; i <= getPrice(); i++)
        {
            sum = sum + i;
            //sum += i;
}
        return getTotalPrice();
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

     
     
}
