/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.entities.UserEntity;
import com.mycompany.spring_mvc_project_final.enums.Role;
import com.mycompany.spring_mvc_project_final.enums.UserStatus;
import com.mycompany.spring_mvc_project_final.repository.UserRepository;
import com.mycompany.spring_mvc_project_final.service.UserService;
import com.mycompany.spring_mvc_project_final.service.UserServiceImpl;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author PC
 */
@RequestMapping("/register")
@Controller
public class RegisterController {
    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private UserServiceImpl userService;
    
    

    @Autowired
    private JavaMailSender javaMailSender;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
//    Register
    @RequestMapping(value = "/register_profile", method = RequestMethod.POST)
    public String showRegisterForm(@Valid @ModelAttribute("users") UserEntity users, BindingResult result,
            HttpServletRequest request, HttpSession session) {
        List<UserEntity> usersList = userRepository.getAllUsers();
        
        users.setNoopPassword(users.getPassword());
        
        if (result.hasErrors()) {
            return "register";
        }
        for (int i = 0; i < usersList.size(); i++) {
            if (!(users.getPassword().equals(users.getPasswordConfirm()))) {
                return "register";
            }
            if (users.getEmail().equals(usersList.get(i).getEmail())) {
                return "register";
            }
            if (users.getUsername().equals(usersList.get(i).getUsername())) {

                return "register";
            }
        }
        users.setPassword(bCryptPasswordEncoder.encode(users.getPassword()));

        
        users.setEnabled(true);
        users.setRole(Role.ROLE_USER);
        userRepository.save(users);
        session.setAttribute("users", users);
       // send mail
        SimpleMailMessage msg = new SimpleMailMessage();
        msg.setTo(users.getEmail());
        msg.setSubject("Shopping Web");
        msg.setText("Congratulations! You have successfully registered for an account.");
        javaMailSender.send(msg);
        
        return "redirect:/";
//        model.addAttribute("users", new UserEntity());
//        return "register"; //return register.jsp
    }


    @RequestMapping(value = "/register_log", method = RequestMethod.GET)
    public String createNewUser(Model model) {
        model.addAttribute("users", new UserEntity());
       return "register"; //return register.jsp
        

//        List<UserEntity> usersList = userRepository.getAllUsers();
//        
//        users.setNoopPassword(users.getPassword());
//        
//        if (result.hasErrors()) {
//            return "register";
//        }
//        for (int i = 0; i < usersList.size(); i++) {
//            if (!(users.getPassword().equals(users.getPasswordConfirm()))) {
//                return "register";
//            }
//            if (users.getEmail().equals(usersList.get(i).getEmail())) {
//                return "register";
//            }
//            if (users.getUsername().equals(usersList.get(i).getUsername())) {
//
//                return "register";
//            }
//        }
//        users.setPassword(bCryptPasswordEncoder.encode(users.getPassword()));
//
//        users.setRole("ROLE_USER");
//        users.setEnabled(true);
//        userRepository.save(users);
//        session.setAttribute("user", users);
        

//        send mail
//        SimpleMailMessage msg = new SimpleMailMessage();
//        msg.setTo(user.getEmail());
//        msg.setSubject("Shopping Web");
//        msg.setText("Congratulations! You have successfully registered for an account.");
//        javaMailSender.send(msg);

        //return "homepage/home";
//        return "redirect:/";
    }
    
}
