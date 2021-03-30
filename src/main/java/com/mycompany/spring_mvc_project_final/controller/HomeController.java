/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.controller;


import com.mycompany.spring_mvc_project_final.service.ProductDetailService;
import com.mycompany.spring_mvc_project_final.service.ProductService;

import com.mycompany.spring_mvc_project_final.utils.SecurityUtils;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
    
    @Autowired
    private ProductService productService;

    @Autowired
    private ProductDetailService productDetailService;

    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
    public String welcomePage(Model model, @ModelAttribute("created_date") Date created_date, 
            @ModelAttribute("price") String price ) {
        model.addAttribute("title", "Welcome");
        model.addAttribute("message", "WELCOME SHOPPING WITH US!");
        model.addAttribute("product", productService.getNewProducts(created_date));
        model.addAttribute("productsell", productService.getProductsMostSell(price));
        
        List<String> roles = SecurityUtils.getRolesOfUser();
        if (!CollectionUtils.isEmpty(roles) && (roles.contains("ROLE_ADMIN")
                || roles.contains("ROLE_SELLER") || roles.contains("ROLE_MANAGER"))) {
            return "redirect:/admin/home";
        }
        return "home2";
    }

    @RequestMapping("/login")
    public String loginPage(Model model, @RequestParam(value = "error", required = false) boolean error) {
        if (error) {
            model.addAttribute("message", "Login Fail!!!");
        }
        return "login";
    }
    
    
    
    @RequestMapping("/403")
    public String accessDenied(Model model) {
        return "403Page";
    }
    
    
}
