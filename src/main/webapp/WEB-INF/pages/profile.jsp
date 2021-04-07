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
        <title>User Profile</title>
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
                            <table id="table">
                                <thead>
                                    <tr>
                                        <th>order ID</th>
                                        <th>Booking Date</th>
                                        <th>Status</th>
                                        <th>Cancel Booking</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="order" items="${orderList}">
                                        <tr>
                                            <td>${order.id}</td>
                                            <td>${order.orderdate}</td>
                                            <c:if test="${order.status == 'PENDING'}">   
                                                <td style="color: #218838;">${order.status}</td>
                                            </c:if>
                                            <c:if test="${booking.status == 'Cancelled'}">   
                                                <td style="color: #FF6347;">${order.status}</td>
                                            </c:if>
                                            <c:if test="${booking.status == 'Processed'}">   
                                                <td style="color: mediumaquamarine;">${order.status}</td>
                                            </c:if>
                                            <td><a href="${pageContext.request.contextPath}/cancel-booking/${order.id}">Cancel</a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table><br><br>                         
                            <h3>Order Details</h3>
                            <c:forEach var="orderDetails" items="${orderDetailsList}">
                                <div class="card" style="width:400px">
                                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                                        
                                        <div class="carousel-caption">
                                            <h3 style="color: tomato;"><strong>${orderDetails.product_detail.product.name}</strong></h3>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <ul>
                                            <li>Size: <strong>${orderDetails.product_detail.size.name}</strong></li>
                                            <li>Color: <strong>${orderDetails.product_detail.color.name}</strong></li>
<!--                                            <li>Quantity: <strong>${bookingDetails.checkOutDateFormatted}</strong></li>-->
                                        </ul> 
                                    </div>
                                    <div class="card-footer">
                                        <h4 style="text-align: center;"><strong>${orderDetails.product_detail.product.price} VND</strong></h4>
                                    </div>
                                </div><br>
                            </c:forEach>
                            </div>

                        </c:if>
                        <c:if test="${orderDetails.size()==0}">
                            <h4 style="text-align: center; padding-top: 3em;">You don't have booking.</h4>
                        </c:if>
                    </form>
        
        <jsp:include page="include/footer.jsp"/>
        <jsp:include page="include/js-page.jsp"/>
    </body>
</html>
