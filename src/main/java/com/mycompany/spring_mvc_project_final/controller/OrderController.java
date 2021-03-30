package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.component.CartEntity;
import com.mycompany.spring_mvc_project_final.entities.ColorEntity;
import com.mycompany.spring_mvc_project_final.entities.OrderDetailEntity;
import com.mycompany.spring_mvc_project_final.entities.OrderEntity;
import com.mycompany.spring_mvc_project_final.entities.ProductEntity;
import com.mycompany.spring_mvc_project_final.repository.ColorRepository;
import com.mycompany.spring_mvc_project_final.repository.OrderDetailRepository;
import com.mycompany.spring_mvc_project_final.repository.OrderRepository;
import com.mycompany.spring_mvc_project_final.repository.ProductDetailRepository;
import com.mycompany.spring_mvc_project_final.repository.ProductRepository;
import com.mycompany.spring_mvc_project_final.repository.SizeRepository;
import com.mycompany.spring_mvc_project_final.service.CategoryService;
import com.mycompany.spring_mvc_project_final.service.ColorService;
import com.mycompany.spring_mvc_project_final.service.ImageService;
import com.mycompany.spring_mvc_project_final.service.OrderService;
import com.mycompany.spring_mvc_project_final.service.ProductDetailService;
import com.mycompany.spring_mvc_project_final.service.ProductService;
import com.mycompany.spring_mvc_project_final.service.SizeService;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author PC
 */
@Controller
@Scope(value = "session")
@RequestMapping("/order")
public class OrderController {
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
    private ProductRepository productRepository;
    @Autowired
    private ColorRepository colorRepository;
    @Autowired
    private SizeRepository sizeRepository;
    @Autowired
    CartEntity cart;
    
    
    @Autowired
    private ProductDetailRepository productDetailRepository;
    
    
    @Autowired
    private ProductService productService;

    //Add to cart
    @RequestMapping(value = "/addToCart/{id}", method = RequestMethod.GET)
    public String addToCarts(@PathVariable(value = "id") int id, Model model){
         ProductEntity product = (ProductEntity)productService.findProductById(id);
        cart.addItem(product);
        
        model.addAttribute("cart", cart.getOrderDetailList());
        
        return "cart"; //Return Cart.jsp
    }
    @RequestMapping(value = {"/cart"}, method = RequestMethod.GET)
    public String categoryList(Model model) {
        model.addAttribute("cart", cart.getOrderDetailList());
        return "cart";
    }

    //Remove product
    @RequestMapping(value = "/remove/{id}", method = RequestMethod.GET)
    public String removeItem(@PathVariable(value = "id") int id, Model model) {
        //Get Item
        ProductEntity product = (ProductEntity)productService.findProductById(id);
        
        //Remove Item
        cart.removeItem(product);
        
        //List lai trang Cart
        model.addAttribute("cart", cart.getOrderDetailList());
        return "cart"; 
        
    }
    
    //Update quantity
    @RequestMapping(value="/update", method = RequestMethod.POST)
    public String updateQuantity(Model model,@RequestParam(name= "id")int id,
            @RequestParam(name= "quantity")int quantity, ProductEntity product){
       List<OrderDetailEntity> orderDetailsList = cart.getOrderDetailsList();
       for(int i= 0; i<orderDetailsList.size();i++){
          if(orderDetailsList.get(i).getProduct().getId() == product.getId()){
              OrderDetailEntity orderDetail = orderDetailsList.get(i);
              orderDetail.setQuantity(quantity);
              orderDetailsList.set(i, orderDetail);
              cart.setOrderDetailsList(orderDetailsList);
          }
        }
       model.addAttribute("cart", cart.getOrderDetailList());
        return "cart";
    }
    
    
    
    //Checkout
    @RequestMapping(value = "/checkout", method = RequestMethod.GET)
    public String checkout(Model model){
        
        model.addAttribute("cart", cart.getOrderDetailList());
        
        model.addAttribute("orders", new OrderEntity()); //model.addAttribute ben modelAttribute ben checkout.jsp
        model.addAttribute("orderDetails", new OrderDetailEntity());
        return "checkout"; //Return Checkout.jsp
    }
    //Save checkout
    @RequestMapping(value = "/saveOrder", method = RequestMethod.POST) //update ben action ben editBook.jsp
    public String saveCheckout(OrderEntity orders,  Model model) {
        //Save vao bang Orders
        orders.setOrderDate(LocalDate.now());        
        OrderEntity newOrder = orderRepository.save(orders);
        
        //Save vao bang Order Details
        List<OrderDetailEntity> orderDetailsList = cart.getOrderDetailsList();
        for(OrderDetailEntity orderDetails : orderDetailsList){
            orderDetails.setOrders(newOrder);
            orderDetailsRepository.save(orderDetails);
        } 
        model.addAttribute("cart", cart.getOrderDetailList());
        return "confirmation"; //goi lai confirmation.jsp
    }

}