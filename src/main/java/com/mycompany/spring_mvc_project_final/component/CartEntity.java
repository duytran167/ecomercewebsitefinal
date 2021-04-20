/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.component;

import com.mycompany.spring_mvc_project_final.entities.ColorEntity;
import com.mycompany.spring_mvc_project_final.entities.OrderDetailEntity;
import com.mycompany.spring_mvc_project_final.entities.ProductDetailEntity;
import com.mycompany.spring_mvc_project_final.entities.ProductEntity;
import com.mycompany.spring_mvc_project_final.entities.SizeEntity;
import com.mycompany.spring_mvc_project_final.entities.UserEntity;

import com.mycompany.spring_mvc_project_final.repository.ProductRepository;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

/**
 *
 * @author PC
 */
@Component
@Scope(value = "session")
public class CartEntity {

    List<OrderDetailEntity> orderDetailsList;
    private int order;

    ProductEntity product;
    ProductDetailEntity productDetail;
    ProductRepository productRepository;
    CartEntity cart;
    private UserEntity user;
    private Double price;

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public CartEntity() {
        orderDetailsList = new ArrayList<>();
    }
    public int getOrder() {
        return order;
    }

    public void setOrder(int order) {
        this.order = order;
    }

    public UserEntity getUser() {
        return user;
    }

    public void setUser(UserEntity user) {
        this.user = user;
    }
    

    public List<OrderDetailEntity> getOrderDetailsList() {
        return orderDetailsList;
    }

    public void setOrderDetailsList(List<OrderDetailEntity> orderDetailsList) {
        this.orderDetailsList = orderDetailsList;
    }

    public ProductEntity getProduct() {
        return product;
    }

    public void setProduct(ProductEntity product) {
        this.product = product;
    }

    public ProductRepository getProductRepository() {
        return productRepository;
    }

    public void setProductRepository(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public CartEntity getCart() {
        return cart;
    }

    public void setCart(CartEntity cart) {
        this.cart = cart;
    }

    public List<OrderDetailEntity> getOrderDetailList() {
        return orderDetailsList;
    }

    public void setOrderDetailList(List<OrderDetailEntity> orderDetailList) {
        this.orderDetailsList = orderDetailList;
    }

    public ProductDetailEntity getProductDetail() {
        return productDetail;
    }

    public void setProductDetail(ProductDetailEntity productDetail) {
        this.productDetail = productDetail;
    }

    //Add Item
    public void addItem(ProductEntity product,SizeEntity size_pro, ColorEntity color_pro, double price) {
        //, ColorEntity color_pro, SizeEntity size_pro
        boolean t = false;
        for (int i = 0; i < orderDetailsList.size(); i++) {
            if (orderDetailsList.get(i).getProductDetail().getProduct().getId() == product.getId()) {
                OrderDetailEntity orderDetails = orderDetailsList.get(i);
                orderDetails.setQuantity(orderDetails.getQuantity() + 1);
                orderDetailsList.set(i, orderDetails);
                t = true;
            }
        }
        if (!t) {
            OrderDetailEntity orderDetails = new OrderDetailEntity();
            orderDetails.setQuantity(1);
            orderDetails.setPrice(price);
            ProductDetailEntity productDetail = new ProductDetailEntity();
//            productDetail.setId(1);
            productDetail.setProduct(product);
            productDetail.setColor(color_pro);
            productDetail.setSize(size_pro);
            productDetail.setQuantity(1);
            orderDetails.setProductDetail(productDetail);
            orderDetailsList.add(orderDetails);
        }
    }

    //Remove Item
    public void removeItem(ProductEntity product) {
        for (int i = 0; i < orderDetailsList.size(); i++) {
            if (orderDetailsList.get(i).getProductDetail().getProduct().getId() == product.getId()) {
                orderDetailsList.remove(i);
            }
        }
    }
    //Total Amount
    public double getTotal() {
        double sum = 0;
        for (int i = 0; i < orderDetailsList.size(); i++) {
                double price = orderDetailsList.get(i).getProductDetail().getProduct().getPrice();
                int quantity = orderDetailsList.get(i).getQuantity();
                sum = (price * quantity);
        }
        return sum;
    }

}
