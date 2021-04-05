<%-- 
    Document   : checkout
    Created on : Feb 25, 2021, 12:11:26 PM
    Author     : PC
--%>
<%@ taglib uri="http://www.springframework.org/tags/form"
           prefix="mvc" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
    <head>
        <!-- Mobile Specific Meta -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Favicon-->
        <link rel="shortcut icon" href="<c:url value="/resources/img/fav.png"/>">
        <!-- Author Meta -->
        <meta name="author" content="CodePixar">
        <!-- Meta Description -->
        <meta name="description" content="">
        <!-- Meta Keyword -->
        <meta name="keywords" content="">
        <!-- meta character set -->
        <meta charset="UTF-8">
        <!-- Site Title -->
        <title>Shop</title>
        <jsp:include page="include/css-page.jsp" />

    <body>
        <!-- Start Header Area -->
        <jsp:include page="include/menu1.jsp" />
        <!-- End Header Area -->
        <!-- Start Banner Area -->
        <section class="banner-area organic-breadcrumb">
            <div class="container">
                <div class="breadcrumb-banner d-flex flex-wrap align-items-center">
                    <div class="col-first">
                        <h1>Product Checkout</h1>
                        <nav class="d-flex align-items-center justify-content-start">
                            <a href="index.html">Home<i class="fa fa-caret-right" aria-hidden="true"></i></a>
                            <a href="checkout.html">

                            </a>
                        </nav>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Banner Area -->
        <!-- Start Checkout Area -->
        <div class="container">
            <div class="checkput-login">
                <div class="top-title">
                    <p>Returning Customer? <a data-toggle="collapse" href="#checkout-login" aria-expanded="false" aria-controls="checkout-login">Click here to login</a></p>
                </div>
                <div class="collapse" id="checkout-login">
                    <div class="checkout-login-collapse d-flex flex-column">
                        <p>If you have shopped with us before, please enter your details in the boxes below. If you are a new customer, please proceed to the Billing & Shipping section.</p>
                        <form action="#" class="d-block">
                            <div class="row">
                                <div class="col-lg-4">
                                    <input type="text" placeholder="Username or Email*" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Username or Email*'" required class="common-input mt-10">

                                </div>
                                <div class="col-lg-4">
                                    <input type="password" placeholder="Password*" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password*'" required class="common-input mt-10">
                                </div>
                            </div>
                            <div class="d-flex align-items-center flex-wrap">
                                <button class="view-btn color-2 mt-20 mr-20"><span>Login</span></button>
                                <div class="mt-20">
                                    <input type="checkbox" class="pixel-checkbox" id="login-1">
                                    <label for="login-1">Remember me</label>
                                </div>
                            </div>
                        </form>
                        <a href="#" class="mt-10">Lost your password?</a>
                    </div>
                </div>
            </div>
            <div class="checkput-login mt-20">
                <div class="top-title">
                    <p>Have a coupon? <a data-toggle="collapse" href="#checkout-cupon" aria-expanded="false" aria-controls="checkout-cupon">Click here to enter your code</a></p>
                </div>
                <div class="collapse" id="checkout-cupon">
                    <div class="checkout-login-collapse d-flex flex-column">
                        <form action="#" class="d-block">
                            <div class="row">
                                <div class="col-lg-8">
                                    <input type="text" placeholder="Enter coupon code" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter coupon code'" required class="common-input mt-10">
                                </div>
                            </div>
                            <button class="view-btn color-2 mt-20"><span>Apply Coupon</span></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Checkout Area -->
        <!-- Start Billing Details Form -->
        <div class="container">
            <mvc:form modelAttribute="user" action="payment" method="post" style="width: 100%;" >
                <div class="row">
                    <div class="col-lg-8 col-md-6">
                        <h3 class="billing-title mt-20 mb-10">Billing Details</h3>
                        
                            <div class="row">
                                <div class="col-lg-12">

                                    <mvc:input value="${users.fullName}" class="single-input" onblur="this.placeholder = 'Full name*'" type="text" placeholder="Full name*" path="fullName" required="true" />
                                </div>

                                <div class="col-lg-6">
                                    <mvc:input value="${users.phoneNumber}" class="single-input" placeholder="Phone number*" onfocus="this.placeholder = ''" type="text" onblur="this.placeholder = 'Phone number*'" path="phoneNumber" required="true" />

                                </div>
                                    
                                <div class="col-lg-6">
                                    <mvc:input value="${users.email}" class="single-input" type="email" placeholder="Email Address*" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email Address*'" path="email" required="true" />

                                </div>

                                <div class="col-lg-12">
                                    <mvc:input class="single-input" type="text"  placeholder="Address line 01*" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Address line 01*'" path="address" required="true" />

                                </div>
                            </div>
                                    <h3 class="billing-title mt-20 mb-10">Description</h3>
                        
                        <mvc:input type="text" class="single-textarea" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Order Notes'" path="description"  />
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="order-wrapper mt-50">
                            <h3 class="billing-title mb-10">Your Order</h3>
                            <div class="order-list">
                                <c:set var="total" value="${0}" ></c:set>
                                <c:set var="totalCart" value="${0}"></c:set>
                                <c:forEach var="cart" items="${cart}" begin="0" end="0">
                                    <c:set var="total" value="${cart.quantity * cart.product.price}"></c:set>
                                    <c:set var="ship" value="30000"></c:set>
                                    <c:set var="totalCart" value="${totalCart + total }"></c:set>
                                    <c:set var="totalCartShip" value="${totalCart + total + ship}"></c:set>
                                        <div class="list-row d-flex justify-content-between">
                                            <div><h6>Product</h6></div>
                                            <div><h6>Price</h6></div>
                                        </div>


                                        <div class="list-row d-flex justify-content-between">
                                            <div>${cart.product.name}</div>
                                        <div>${cart.quantity}</div>
                                        <div><fmt:formatNumber type="currency"
                                                          value="${total}"
                                                          currencySymbol="VND"/></div>
                                    </div>
                                </c:forEach>
                                <div class="list-row d-flex justify-content-between">
                                    <h6>Subtotal</h6>
                                    <div><fmt:formatNumber type="currency"
                                                      value="${totalCart}"
                                                      currencySymbol="VND"/></div>
                                </div>

                                <div class="list-row d-flex justify-content-between">
                                    <h6>Shipping</h6>
                                    <div> <fmt:formatNumber type="currency"
                                                      value="${ship}"
                                                      currencySymbol="VND"/></div>
                                </div>
                                <div class="list-row d-flex justify-content-between">
                                    <h6>Total</h6>
                                    <div class="total"><fmt:formatNumber type="currency"
                                                      value="${totalCartShip}"
                                                      currencySymbol="VND"/></div>
                                </div>
                                <input class="view-btn color-2 w-100 mt-20" type="submit" value="Continue">
                            </div>
                        </div>

                    </div>
                </div>
            </mvc:form>
        </div>
        <!-- End Billing Details Form -->
        <!-- Footer--->
        <jsp:include page="include/footer.jsp"/>
        <jsp:include page="include/js-page.jsp"/>

    </body>
</html>
