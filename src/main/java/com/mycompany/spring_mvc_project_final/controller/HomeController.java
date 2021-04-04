/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.controller;


import com.mycompany.spring_mvc_project_final.entities.UserEntity;
import com.mycompany.spring_mvc_project_final.enums.Role;

import com.mycompany.spring_mvc_project_final.repository.UserRepository;
import com.mycompany.spring_mvc_project_final.service.ProductDetailService;
import com.mycompany.spring_mvc_project_final.service.ProductService;


import java.util.Date;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("name")
public class HomeController {
    
    @Autowired
    private ProductService productService;

    @Autowired
    private ProductDetailService productDetailService;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    private UserRepository userRepository;
    
    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
    public String welcomePage(Model model, @ModelAttribute("created_date") Date created_date, 
            @ModelAttribute("price") String price ) {
        
        model.addAttribute("product", productService.getNewProducts(created_date));
        model.addAttribute("productsell", productService.getProductsMostSell(price));
        
//        List<String> roles = SecurityUtils.getRolesOfUser();
//        if (!CollectionUtils.isEmpty(roles) && (roles.contains("ROLE_ADMIN")
//                || roles.contains("ROLE_SELLER") || roles.contains("ROLE_MANAGER"))) {
//            return "redirect:/admin/home";
//        }
        return "home2";
    }
    //Login
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String showLoginPage(ModelMap model) {
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@RequestParam(name = "email") String email,
            @RequestParam(name = "noopPassword") String noopPassword,
            HttpSession session,Model model) {

        UserEntity users = userRepository.findByEmail(email);

        if (users.getNoopPassword().equals(noopPassword) && users.getRole().equals(Role.ROLE_USER)) {
            session.setAttribute("users", users);
            return "redirect:/";
        } else {
            String erroMessage = "Account or password is incorrect";
                model.addAttribute("erroMesseger", erroMessage);
            return "login";
        }
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.removeAttribute("users");
        return "redirect:/";
    }

//    @RequestMapping("/login")
//    public String loginPage(Model model, @RequestParam(value = "error", required = false) boolean error) {
//        if (error) {
//            model.addAttribute("message", "Login Fail!!!");
//        }
//        return "login";
//    }
    
    
    
    @RequestMapping("/403")
    public String accessDenied(Model model) {
        return "403Page";
    }
    
    
}
