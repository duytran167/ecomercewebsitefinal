/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.entities.UserEntity;
import com.mycompany.spring_mvc_project_final.repository.UserRepository;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserRepository userRepository;

//    @RequestMapping("/home")
//    public String viewHome(Model model) {
//        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//        String username = principal.toString();
//        if (principal instanceof UserDetails) {
//            username = ((UserDetails) principal).getUsername();
//        }
//        
//
//        model.addAttribute("message", "Hello User: " + username);
//        return "user/home2";
//    }
    
}
