<%-- 
    Document   : newjsp
    Created on : Apr 5, 2021, 12:05:07 AM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <script src='https://kit.fontawesome.com/a076d05399.js'></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <title>User Profile</title>
        <style>
            #table {
                border-collapse: collapse;
                width: 80%;
            }
            td, th {
                padding: 6px;
            }
            tr,td{
                color: white;
                font-family: cursive;
                font-size: 20px;        
            }
        </style>
        <jsp:include page="include/css-page.jsp" />

    </head>
    <body>
        <!-- Start Header Area -->
        <jsp:include page="include/menu1.jsp" />
        <!-- End Header Area -->
        <!-- Start Banner Area -->
        <section class="banner-area organic-breadcrumb">
            <div class="container">
                <div class="breadcrumb-banner d-flex flex-wrap align-items-center">
                    <div class="col-first">
                        <h1>Shopping Cart</h1>
                        <nav class="d-flex align-items-center justify-content-start">
                            <a href="index.html">Home<i class="fa fa-caret-right" aria-hidden="true"></i></a>
                            <a href="cart.html">User</a>
                        </nav>
                    </div>
                </div>
            </div>
        </section>
        <div class="container fill_height">
            <div class="row fill_height">
                <div class="col fill_height">
                    <!-- Search Tabs -->
                    <div class="search_tabs_container">
                        <div class="search_tabs d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
                            <div class="search_tab active d-flex flex-row align-items-center justify-content-lg-center justify-content-start"><img src="https://img.icons8.com/fluent/40/000000/settings.png" alt="My AQccount"/>my account</div>
                            <div class="search_tab d-flex flex-row align-items-center justify-content-lg-center justify-content-start"><img src="https://img.icons8.com/officel/40/000000/mastercard-credit-card.png" alt="My Credit Card"/>my credit card</div>
                            <div class="search_tab d-flex flex-row align-items-center justify-content-lg-center justify-content-start"><img src="https://img.icons8.com/officel/40/000000/booking.png" alt="My Booking"/>my booking</div>
                        </div>		
                    </div>
        <div class="search_panel active" style=" height: 100%;border-style: outset;background-color: #d8c2d1;">
            <!--- user profile--->
                        <mvc:form modelAttribute="users" action="${pageContext.request.contextPath}/update-account/${users.id}" method="post" 
                                  id="search_form_1" class="search_panel_content d-flex flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
                            <table>
                                <tbody>    
                                <h2> Profile User</h2>
                                    <tr>
                                        <td><h4 class="mb-20">Username:</h4></td>
                                        <td style="width: 21em;"><mvc:input path="username" class="destination search_input single-input info-border" required="true"/></td>
                                    </tr>
                                    <tr>
                                        <td><h4 class="mb-20">Email:</h4></td>
                                        <td><mvc:input path="email" class="destination search_input single-input info-border"  required="true"/></td>
                                    </tr>
                                    <tr>
                                        <td><h4 class="mb-20">Phone:</h4></td>
                                        <td><mvc:input path="phoneNumber" class="destination search_input single-input info-border" required="true"/></td>
                                    </tr>
                                    <tr>
                                        <td><h4 class="mb-20">Address:</h4></td>
                                        <td><mvc:input path="address" class="destination search_input single-input info-border" required="true"/></td>
                                    </tr>
                                    
                                    
                                    <mvc:input path="noopPassword" type="hidden"/>
                                    <mvc:input path="role" type="hidden"/>
                                </tbody>

                            </table>
                            <mvc:input path="password" type="hidden"/>
                            <input type="submit" value="Save" class="genric-btn info-border">
                        </mvc:form>
                    </div>
        
        <!-- user credit card--->
        <div class="search_panel" style="height: 100%; border-style: outset;background-color: #d8c2d1;">
                    <% if (request.getAttribute("creditCard") == null) { %>
                    <mvc:form modelAttribute="creditCards" action="${pageContext.request.contextPath}/add-creditCard/${users.id}" method="post" 
                              id="search_form_2" class="search_panel_content d-flex flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
                        <table>
                            <tbody>
                                <tr>
                                    <td>Credit Card Type</td>
                                    <td><mvc:select path="creditCardType" class="search_input">
                                            <mvc:option value="Visa" />
                                            <mvc:option value="MasterCard" />
                                        </mvc:select></td>
                                </tr>
                                <tr>
                                    <td>Credit Card Number</td>
                                    <td><mvc:input path="creditCardNumber" class="destination search_input single-input info-border" required="true"/></td>
                                </tr>
                                <tr>
                                    <td>Cardholders Name</td>
                                    <td><mvc:input path="cardholdersName" class="destination search_input single-input info-border" required="true"/></td>
                                </tr>
                                <tr>
                                    <td>Expiration</td>
                                    <td><mvc:input path="expirationDate" type="date" class="destination search_input single-input info-border" required="true"/></td>
                                </tr>
                                <tr>
                                    <td>Surplus</td>
                                    <td><mvc:input path="surplus" type="text" class="destination search_input single-input info-border" required="true"/></td>
                                </tr>
                                <tr>
                                    <td>CVV</td>
                                    <td><mvc:input path="cvv" type="password" class="destination search_input single-input info-border" required="true"/></td>
                                </tr>
                            </tbody>
                        </table>
                        <input type="submit" value="Save" class="button search_button">
                    </mvc:form>
                    <% } else { %>
                    <mvc:form modelAttribute="creditCard" action="${pageContext.request.contextPath}/update-creditCard/${users.id}" method="post" 
                              id="search_form_2" class="search_panel_content d-flex flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
                        <table>
                            <tbody>
                                <h2> Credit Card User</h2>
                                <tr>
                                    <td><h4 class="mb-20">Credit Card Type:</h4></td>
                                    <td style="padding-left: 2em;"><p>${creditCard.creditCardType}</p></td>
                                </tr>
                                <tr>
                                    <td><h4 class="mb-20">Credit Card Number:</h4></td>
                                    <td style="padding-left: 2em;"><p>${creditCard.creditCardNumber}</p></td>
                                </tr>
                                <tr>
                                    <td><h4 class="mb-20">Cardholders Name:</h4></td>
                                    <td style="padding-left: 2em;"><p>${creditCard.cardholdersName}</p></td>
                                </tr>
                                <tr>
                                    <td><h4 class="mb-20">Expiration:</h4></td>
                                    <td style="padding-left: 2em;"><p>${creditCard.expirationDate}</p></td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="genric-btn success circle arrow" data-toggle="modal" data-target="#myModal1">
                            <a style=""> Edit </a>
                        </div>
                        <div class="modal fade" id="myModal1" role="dialog">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title">Edit Credit Card</h4>
                                    </div>
                                    <div class="modal-body"  style="background-color: #d8c2d1;">
                                        <table>
                                            <tbody>   
                                                <tr>
                                                    <td><h4 class="mb-20">Credit Card Type:</h4></td>
                                                    <td style="padding-left: 2em;">
                                                        <mvc:select path="creditCardType" class="search_input">
                                                            <mvc:option value="Visa" />
                                                            <mvc:option value="MasterCard" />
                                                        </mvc:select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Credit Card Number:</td>
                                                    <td style="padding-left: 2em;">
                                                        <mvc:input path="creditCardNumber" type="text" style="color: black;"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Cardholders Name:</td>
                                                    <td style="padding-left: 2em;">
                                                        <mvc:input path="cardholdersName" type="text" style="color: black;"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Expiration:</td>
                                                    <td style="padding-left: 2em;">
                                                        <mvc:input path="expirationDate" type="date" style="color: black;"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center; padding-left: 50%;"><input type="submit" value="Update" class="button search_button"></td>
                                                </tr> 
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </mvc:form>
                    <% }%>
                </div>
                <!--- order info--->
                <div class="search_panel" style="background-color: #d8c2d1;; height: 100%; padding-bottom: 3em;">
                    <form method="post" id="search_form_3" class="search_panel_content d-flex flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
                        <h2>My Order</h2>
                        
                        <c:if test="${orderList.size()>0}">
                            <table id="table"  >
                                <thead>
                                    <tr>
                                <div class="col-md-6">
                                        <th>Order ID</th>
                                        </div>
                                <div class="col-md-6">
                                        <th>Order Date</th>
                                        </div>
                                <div class="col-md-6">
                                        <th>Status</th>
                                        </div>
                                <div class="col-md-6">
                                        <th>Cancel Order</th>
                                        </div>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="order" items="${orderList}">
                                        <tr>
                                            <td>${order.id}</td>
                                            <td>${order.orderDate}</td>
                                            <c:if test="${order.status == 'PENDING'}">   
                                                <td style="color: #218838;">${order.status}</td>
                                            </c:if>
                                            <c:if test="${order.status == 'CANCLED'}">   
                                                <td style="color: #FF6347;">${order.status}</td>
                                            </c:if>
                                            <c:if test="${order.status == 'Processed'}">   
                                                <td style="color: mediumaquamarine;">${order.status}</td>
                                            </c:if>
                                            <td><a class="genric-btn danger" href="${pageContext.request.contextPath}/cancel-booking/${order.id}">Cancel</a></td>
                                        </tr>
                                    </c:forEach>
                                        
                                </tbody>
                            </table><br><br>                         
                            <h3>Order Details</h3>
                            <c:forEach var="orderDetails" items="${orderDetailsList}">
                                <div class="card" style="width:400px">
                                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                                        
                                        <div class="carousel-caption">
                                           
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <ul>
                                            <c:forEach var="order" items="${orderList}">
                                                <td>${order.id}</td>
                                                
                                                </c:forEach>
                                            <h3 style="color: tomato;">Name:<strong>${orderDetails.productDetail.product.name}</strong></h3>
                                            <li>Size: <strong>${orderDetails.productDetail.size.name}</strong></li>
                                            <li>Color: <strong>${orderDetails.productDetail.color.name}</strong></li>
                                           <li>Quantity: <strong>${orderDetails.quantity}</strong></li>
                                        </ul> 
                                    </div>
                                    <div class="card-footer">
                                        <h4 style="text-align: center;"><strong>${orderDetails.productDetail.product.price} VND</strong></h4>
                                    </div>
                                </div><br>
                            </c:forEach>
                            </div>
                        </c:if>
                        <c:if test="${orderDetails.size()==0}">
                            <h4 style="text-align: center; padding-top: 3em;">You don't have order.</h4>
                        </c:if>
                    </form>

                </div>
            </div>
        </div>	
    </div>
        <jsp:include page="include/footer.jsp"/>
        <jsp:include page="include/js-page.jsp"/>
    </body>
</html>
