package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.component.CartEntity;
import com.mycompany.spring_mvc_project_final.entities.ColorEntity;
import com.mycompany.spring_mvc_project_final.entities.CreditCardEntity;
import com.mycompany.spring_mvc_project_final.entities.OrderDetailEntity;
import com.mycompany.spring_mvc_project_final.entities.OrderEntity;
import com.mycompany.spring_mvc_project_final.entities.ProductDetailEntity;
import com.mycompany.spring_mvc_project_final.entities.ProductEntity;
import com.mycompany.spring_mvc_project_final.entities.SizeEntity;
import com.mycompany.spring_mvc_project_final.entities.UserEntity;
import com.mycompany.spring_mvc_project_final.repository.ColorRepository;
import com.mycompany.spring_mvc_project_final.repository.CreditCardRepository;
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
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.annotation.Scope;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
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
    CreditCardRepository creditCardRepository;

    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private ColorRepository colorRepository;
    @Autowired
    private SizeRepository sizeRepository;
    @Autowired
    CartEntity cart;
    @Autowired
    private JavaMailSender javaMailSender;

    @Autowired
    private ProductDetailRepository productDetailRepository;

    @Autowired
    private ProductService productService;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
    }

    //Add to cart
    @RequestMapping(value = "/addToCart", method = RequestMethod.GET)
    public String addToCarts(@RequestParam(name = "productId") int id, Model model) {
        //@RequestParam(name = "colorId") int color,@RequestParam(name = "sizeId") int size,
        
        ProductEntity product = (ProductEntity) productRepository.findById(id);
        ProductDetailEntity product_Detail = (ProductDetailEntity) productDetailRepository.findById(id);
        //ColorEntity color_pro = (ColorEntity) colorRepository.findById(color);
        //SizeEntity size_pro =(SizeEntity)sizeRepository.findById(size);
        cart.addItem(product, product_Detail);
        //cart.addItem(product,color_pro,size_pro);

        model.addAttribute("cart", cart.getOrderDetailList());
        //model.addAttribute("color", color_pro);
        //model.addAttribute("size", size_pro);

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
        ProductEntity product = (ProductEntity) productRepository.findById(id);

        //Remove Item
        cart.removeItem(product);

        //List lai trang Cart
        model.addAttribute("cart", cart.getOrderDetailList());
        return "cart";

    }

    //Update quantity
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updateQuantity(Model model, @RequestParam(name = "id") int id,
            @RequestParam(name = "quantity") int quantity, ProductEntity product) {
        List<OrderDetailEntity> orderDetailsList = cart.getOrderDetailsList();
        for (int i = 0; i < orderDetailsList.size(); i++) {
            if (orderDetailsList.get(i).getProduct_Detail().getProduct().getId() == product.getId()) {
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
    public String checkout(UserEntity user, Model model) {
        model.addAttribute("cart", cart.getOrderDetailList());
        model.addAttribute("user", new UserEntity());
        model.addAttribute("orders", new OrderEntity()); //model.addAttribute ben modelAttribute ben checkout.jsp
//        model.addAttribute("orderDetails", new OrderDetailEntity());
        return "checkout"; //Return Checkout.jsp
    }

    @RequestMapping(value = "/payment", method = RequestMethod.POST)
    public String payment(UserEntity user,OrderEntity orders, Model model) {
        model.addAttribute("cart", cart.getOrderDetailList());
        model.addAttribute("creditCart", new CreditCardEntity());
        model.addAttribute("user",user);
        return "payment";
    }

    //Save checkout
    @RequestMapping(value = "/saveOrder", method = RequestMethod.POST) //update ben action ben editBook.jsp
    public String saveCheckout(OrderEntity orders, Model model) {
        //Save vao bang Orders
        orders.setOrderDate(LocalDate.now());
        OrderEntity newOrder = orderRepository.save(orders);

        //Save vao bang Order Details
        List<OrderDetailEntity> orderDetailsList = cart.getOrderDetailsList();
        for (OrderDetailEntity orderDetails : orderDetailsList) {
            orderDetails.setOrders(newOrder);
            orderDetailsRepository.save(orderDetails);
        }
        model.addAttribute("cart", cart.getOrderDetailList());
        return "confirmation"; //goi lai confirmation.jsp
    }

    @Transactional(rollbackOn = Exception.class)
    @RequestMapping(value = "/order", method = RequestMethod.POST)
    public String saveOrder(OrderEntity order, @RequestParam(name = "cardholdersName") String cardholdersName,
            @RequestParam(name = "creditCardNumber") String creditCardNumber,
            @RequestParam(name = "expirationDate") Date expirationDate,
            @RequestParam(name = "cvv") String cvv, Model model, HttpSession session) {
        UserEntity users = (UserEntity) session.getAttribute("users");

        CreditCardEntity creditCard = creditCardRepository.findByCreditCardNumber(creditCardNumber);
        if (creditCardNumber == "") {
            order.setOrderDate(LocalDate.now());

            order.setUsers(users);
            OrderEntity newOrder = orderRepository.save(order);
            // Save vào bảng OrderDetails
            List<OrderDetailEntity> orderDetailsList = cart.getOrderDetailsList();
            for (OrderDetailEntity orderDetails : orderDetailsList) {
                orderDetails.setOrders(newOrder);
                //find product for order
                int id = orderDetails.getProduct_Detail().getProduct().getId();
                ProductEntity product = productRepository.findById(id);
                double price = product.getPrice() * orderDetails.getQuantity();
                orderDetails.setPrice(price);
                //
                orderDetails.getProduct_Detail().setProduct(product);
                //them color va size
                orderDetails.setPaymentMethod("Payment at the Shopping Web");
                SimpleMailMessage msg = new SimpleMailMessage();
                msg.setTo(users.getEmail());
                msg.setSubject("Shopping Web");
                msg.setText("Congratulations! You have successfully order."
                        + "\n Your Order Details "
                        + "\n        Product Name: " + orderDetails.getProduct_Detail().getProduct().getName()
                        + "\n        Quantity: " + orderDetails.getQuantity()
                        + "\n        Price: " + orderDetails.getPrice()
                        + "\n        Size: " + orderDetails.getProduct_Detail().getSize()
                        + "\n        Color: " + orderDetails.getProduct_Detail().getColor()
                        + "\n Thanks for choosing us!");
                javaMailSender.send(msg);
                orderDetailsRepository.save(orderDetails);
                cart.setOrderDetailsList(new ArrayList<OrderDetailEntity>());

            }

            return "confirmation";
        } else {
            LocalDate expiration = LocalDate.parse(new SimpleDateFormat("yyyy-MM-dd").format(expirationDate));
            if (creditCard.getCardholdersName().equals(cardholdersName) && creditCard.getExpirationDate().equals(expirationDate)
                    && creditCard.getCvv().equals(cvv)) {

                return "payment";
            } else {
                double moneyBooking = cart.getTotal();
                double surplus = creditCard.getSurplus();

                if (moneyBooking <= surplus) {
                    double balance = surplus - moneyBooking;
                    creditCard.setSurplus(balance);
                    creditCardRepository.save(creditCard);

                } else {
                    if (moneyBooking > surplus) {
                        String erroMessage = "Bạn không đủ tiền";
                        model.addAttribute("erroMesseger", erroMessage);
                        model.addAttribute("creditCard", creditCard);
                        model.addAttribute("users", users);
                        model.addAttribute("cart", cart);
                        return "payment";
                    }
                }

                order.setOrderDate(LocalDate.now());
//                order.setStatus("Pending");

                order.setUsers(users);
//                order.setCreditCard(user.getCreditCard());
                OrderEntity newOrder = orderRepository.save(order);

                //Save vao bang Order Details
                List<OrderDetailEntity> orderDetailsList = cart.getOrderDetailsList();
                for (OrderDetailEntity orderDetails : orderDetailsList) {
                    orderDetails.setOrders(newOrder);
                    //find pro for order
                    int id = orderDetails.getProduct_Detail().getProduct().getId();
                ProductEntity product = productRepository.findById(id);
                double price = product.getPrice() * orderDetails.getQuantity();
                orderDetails.setPrice(price);
                    //
                    orderDetails.getProduct_Detail().setProduct(product);

                    orderDetails.setPaymentMethod("payment online");
                    SimpleMailMessage msg = new SimpleMailMessage();
                    msg.setTo(users.getEmail());
                    msg.setSubject("Shopping Web");
                    msg.setText("Congratulations! You have successfully order."
                            + "\n Your Order Details "
                        + "\n        Product Name: " + orderDetails.getProduct_Detail().getProduct().getName()
                        + "\n        Quantity: " + orderDetails.getQuantity()
                        + "\n        Price: " + orderDetails.getPrice()
                        + "\n        Size: " + orderDetails.getProduct_Detail().getSize()
                        + "\n        Color: " + orderDetails.getProduct_Detail().getColor()
                        + "\n Thanks for choosing us!");
                    javaMailSender.send(msg);
                    orderDetailsRepository.save(orderDetails);
                    cart.setOrderDetailsList(new ArrayList<OrderDetailEntity>());
                }
                return "confirmation";
            }
        }
    }
}
