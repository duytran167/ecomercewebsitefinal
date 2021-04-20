/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.entities.CategoryEntity;
import com.mycompany.spring_mvc_project_final.entities.ProductEntity;
import com.mycompany.spring_mvc_project_final.repository.CategoryRepository;
import com.mycompany.spring_mvc_project_final.repository.ProductRepository;
import com.mycompany.spring_mvc_project_final.service.CategoryService;
import com.mycompany.spring_mvc_project_final.service.ColorService;
import com.mycompany.spring_mvc_project_final.service.ProductDetailService;
import com.mycompany.spring_mvc_project_final.service.ProductService;
import com.mycompany.spring_mvc_project_final.service.ProductService;
import com.mycompany.spring_mvc_project_final.service.SizeService;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
    private ProductRepository productRepository;

    
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private CategoryRepository categoryRepository;
    
    @Autowired
    private SizeService sizeService;
    
    @Autowired
    private ColorService colorService;
    @Autowired
    private ProductDetailService productDetailService;
    
    @InitBinder
    public void initBinder(WebDataBinder webDataBinder) {
        StringTrimmerEditor stringTrimerEditor = new StringTrimmerEditor(true);
        webDataBinder.registerCustomEditor(String.class, stringTrimerEditor);
    }

    //list product
    @RequestMapping(value = {"/category"}, method = RequestMethod.GET)
    public String categoryList(Model model) {
        model.addAttribute("product", productService.getProducts());
        return "category";
    }
    
    // detail product
    @RequestMapping(value ="/detail/{id}", method = RequestMethod.GET)
    public String detail( @PathVariable("id")int id, Model model) {        
        model.addAttribute("product", productRepository.findById(id));
        model.addAttribute("categories",
                categoryService.getCategories());
        model.addAttribute("color", productService.getListColorDetails(id));
        model.addAttribute("size", productService.getListSizeDetails(id));
        

        return "detail";
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String searchCity(@RequestParam(name = "searchText") String name, Model model){
        List<ProductEntity> product = productRepository.findProductByName(name);
        model.addAttribute("product", product);
        return "category";
    }
}
    

