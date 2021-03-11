/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.service.CategoryService;
import com.mycompany.spring_mvc_project_final.service.ColorService;
import com.mycompany.spring_mvc_project_final.service.ProductService;
import com.mycompany.spring_mvc_project_final.service.SizeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author PC
 */
@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private ProductService productService;


    @Autowired
    private CategoryService categoryService;
    
    @Autowired
    private SizeService sizeService;
    
    @Autowired
    private ColorService colorService;
    
    @InitBinder
    public void initBinder(WebDataBinder webDataBinder) {
        StringTrimmerEditor stringTrimerEditor = new StringTrimmerEditor(true);
        webDataBinder.registerCustomEditor(String.class, stringTrimerEditor);
    }

    @RequestMapping(value = {"/category"}, method = RequestMethod.GET)
    public String categoryList(Model model) {
        model.addAttribute("products", productService.getProducts());
        return "category";
    }
    
    @RequestMapping(value ="/detail/{id}", method = RequestMethod.GET)
    public String detail(Model model,
            @PathVariable("id") int id) {
        model.addAttribute("products", productService.findProductById(id));
        model.addAttribute("categories",
                categoryService.getCategories());
        model.addAttribute("size", sizeService.getSize());
        model.addAttribute("color", colorService.getColor());
        
        return "detail";
    }
}
