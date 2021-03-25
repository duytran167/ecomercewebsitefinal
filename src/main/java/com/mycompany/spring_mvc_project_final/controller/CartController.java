/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.entities.OrderEntity;
import com.mycompany.spring_mvc_project_final.service.ProductService;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author PC
 */
@Controller
@RequestMapping("/cart")
public class CartController {
    
    @Autowired
    private ProductService productService;
    
    @RequestMapping(value = {"/cart"}, method = RequestMethod.GET)
    public String cart(Model model) {
        
        return "cart";
    }
    
    
//    @RequestMapping(value = "checkout", method = RequestMethod.POST)
//public String viewCheckout(ModelMap mm, HttpSession session, @ModelAttribute("receipt") Receipt receipt) {
//        HashMap<Long, OrderEntity> cartItems = (HashMap<Long, OrderEntity>) session.getAttribute("myCartItems");
//        if (cartItems == null) {
//            cartItems = new HashMap<>();
//        }
//        receipt.setReceiptDate(new Timestamp(new Date().getTime()));
//        receipt.setReceiptStatus(true);
//        receiptService.create(receipt);
//        for (Map.Entry<Long, OrderEntity> entry : cartItems.entrySet()) {
//            ReceiptItem receiptItem = new ReceiptItem();
//            receiptItem.setReceipt(receipt);
//            receiptItem.setProduct(entry.getValue().getProduct());
//            receiptItem.setReceiptItemPrice(entry.getValue().getProduct().getProductPrice());
//            receiptItem.setReceiptItemSale(entry.getValue().getProduct().getProductSale());
//            receiptItem.setReceiptItemQuantity(entry.getValue().getQuantity());
//            receiptItem.setReceiptItemStatus(true);
//            receiptItemService.create(receiptItem);
//        }
//        cartItems = new HashMap<>();
//        session.setAttribute("myCartItems", cartItems);
//        session.setAttribute("myCartTotal", 0);
//        session.setAttribute("myCartNum", 0);
//        return "pages/success";
//}
    
}
