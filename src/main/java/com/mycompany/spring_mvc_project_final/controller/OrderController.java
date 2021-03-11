/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.entities.OrderEntity;
import com.mycompany.spring_mvc_project_final.entities.ProductEntity;
import com.mycompany.spring_mvc_project_final.service.CategoryService;
import com.mycompany.spring_mvc_project_final.service.OrderService;
import com.mycompany.spring_mvc_project_final.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author PC
 */
@Controller
@RequestMapping("/checkout")
public class OrderController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private CategoryService categoryService;
    
    
    
    
    @RequestMapping(value = {"/", "/checkout"}, method = RequestMethod.GET)
    public String home(Model model) {
        model.addAttribute("orders", orderService.getOrders());
        return "checkout";
    }
    
    @RequestMapping("/add-order")
    public String addBook(Model model) {
        model.addAttribute("orders", new OrderEntity());
        model.addAttribute("categories",
                categoryService.getCategories());
        
        model.addAttribute("action", "add");
        return "checkout";
    }
    

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String resultAddBook(Model model,
            @ModelAttribute("orders") OrderEntity order) {
        
        orderService.save(order);
        return "redirect:/order/confirmation/{id}";
    }

    
}
