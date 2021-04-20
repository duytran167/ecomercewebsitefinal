/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.entities.CreditCardEntity;
import com.mycompany.spring_mvc_project_final.entities.OrderDetailEntity;
import com.mycompany.spring_mvc_project_final.entities.OrderEntity;
import com.mycompany.spring_mvc_project_final.entities.UserEntity;
import com.mycompany.spring_mvc_project_final.enums.OrderStatus;
import com.mycompany.spring_mvc_project_final.repository.ColorRepository;
import com.mycompany.spring_mvc_project_final.repository.CreditCardRepository;
import com.mycompany.spring_mvc_project_final.repository.OrderDetailRepository;
import com.mycompany.spring_mvc_project_final.repository.OrderRepository;
import com.mycompany.spring_mvc_project_final.repository.ProductRepository;
import com.mycompany.spring_mvc_project_final.repository.SizeRepository;
import com.mycompany.spring_mvc_project_final.repository.UserRepository;
import com.mycompany.spring_mvc_project_final.service.CategoryService;
import com.mycompany.spring_mvc_project_final.service.ColorService;
import com.mycompany.spring_mvc_project_final.service.ImageService;
import com.mycompany.spring_mvc_project_final.service.OrderService;
import com.mycompany.spring_mvc_project_final.service.ProductDetailService;
import com.mycompany.spring_mvc_project_final.service.SizeService;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller

public class UserController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ImageService imageService;
    @Autowired
    private SizeService sizeService;
    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private ColorService colorService;
    @Autowired
    private ProductDetailService productDetailService;
    @Autowired
    OrderDetailRepository orderDetailsRepository;
    @Autowired
    CreditCardRepository creditCardRepository;
    @Autowired
    UserRepository userRepository;
    
  

    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private ColorRepository colorRepository;
    @Autowired
    private SizeRepository sizeRepository;

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
    @RequestMapping(value = "/account/{id}", method = RequestMethod.GET)
    public String showProfilePage(Model model,
            @PathVariable(value = "id") int id) {

        UserEntity users = userRepository.findById(id);
        CreditCardEntity creditCard = creditCardRepository.findById(id);
        List<OrderEntity> orderList = orderRepository.findOrderByUserId(id);
        List<OrderDetailEntity> orderDetailsList = orderDetailsRepository.findOrderDetailsByOrderId(id);
        
        //BookingEntity booking = bookingRepo.getTotalBookingDetailsPrice(id);

        //model.addAttribute("booking", booking);
        model.addAttribute("users", users);
        model.addAttribute("creditCard", creditCard);
        model.addAttribute("orderList", orderList);
        model.addAttribute("orderDetailsList", orderDetailsList);
        
        model.addAttribute("creditCards", new CreditCardEntity());

        return "profile";
    }

    //Save
    @RequestMapping(value = "/update-account/{id}", method = RequestMethod.POST)
    public String updateProfile(@PathVariable(value = "id") int id,
            UserEntity users, BindingResult result, HttpSession session) {

        if (result.hasErrors()) {
            users.setId(id);
            return "profile/accountPage";
        }

        users.getPassword();
        users.getNoopPassword();
        users.getRole();
        users.setEnabled(true);
        userRepository.save(users);

        session.setAttribute("users", users);

        return "redirect:/account/" + id;
    }
     // add new credit card
    @RequestMapping(value = "/add-creditCard/{id}", method = RequestMethod.POST)
    public String createNewCreditCard(@PathVariable(value = "id") int id,
            @Valid @ModelAttribute("creditCards") CreditCardEntity creditCard,
            BindingResult result, HttpSession session) {

        creditCard.setId(id);
        creditCardRepository.save(creditCard);
        //session.setAttribute("creditCard", creditCard);

        return "redirect:/";
    }
    
    //Edit 
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String showEditForm(@PathVariable(value = "id") int id, Model model) {
        CreditCardEntity creditCard = creditCardRepository.findById(id);

        model.addAttribute("creditCard", creditCard);

        return "editCreditCard";
    }

    //update credit card
    @RequestMapping(value = "/update-creditCard/{id}", method = RequestMethod.POST)
    public String updateCreditCard(@PathVariable(value = "id") int id,
            CreditCardEntity creditCard, BindingResult result, HttpSession session) {

        if (result.hasErrors()) {
            creditCard.setId(id);
            return "profile/creditCardPage";
        }

        creditCard.setId(id);
        creditCardRepository.save(creditCard);

        //session.setAttribute("creditCard", creditCard);
        return "redirect:/account/" + id;
    }

    //cancel booking
    @RequestMapping(value = "/cancel-booking/{id}", method = RequestMethod.GET)
    public String cancelBooking(@PathVariable(value = "id") int id, HttpSession session) {

        OrderEntity order = orderRepository.findById(id);
        order.setStatus(OrderStatus.CANCLED);
        orderRepository.save(order);

        return "redirect:/";
    }
    
}
