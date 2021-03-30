<%-- 
    Document   : cart
    Created on : Mar 18, 2021, 6:47:45 PM
    Author     : PC
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
    <head>
        <!-- Mobile Specific Meta -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Favicon-->
        <link rel="shortcut icon" href="img/fav.png">
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
    </head>
    <body>
        <!-- Start Header Area -->
        <jsp:include page="include/menu1.jsp" />

        <!-- Start Header Area -->

        <!-- End Header Area -->

        <!-- Start Banner Area -->
        <section class="banner-area organic-breadcrumb">
            <div class="container">
                <div class="breadcrumb-banner d-flex flex-wrap align-items-center">
                    <div class="col-first">
                        <h1>Shopping Cart</h1>
                        <nav class="d-flex align-items-center justify-content-start">
                            <a href="index.html">Home<i class="fa fa-caret-right" aria-hidden="true"></i></a>
                            <a href="cart.html">Shopping Cart</a>
                        </nav>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Banner Area -->

        <!-- Start Cart Area -->
            <div class="container">
                <div class="cart-title">
                    <div class="row">
                        <div class="col-md-4">
                            <h6 class="ml-15">Product</h6>
                        </div>
                        <div class="col-md-2">
                            <h6>Price</h6>
                        </div>
                        <div class="col-md-2">
                            <h6>Quantity</h6>
                        </div>
                        <div class="col-md-2">
                            <h6>Total</h6>
                        </div>
                    </div>
                </div>
                
                
                <div class="cart-single-item">
                    <c:set var="totalCart" value="0"></c:set>
                <c:forEach var="cart" items="${cart}">
                    <c:set var="totalCart" value="${totalCart + cart.totalAmount}"></c:set>
                    <div class="row align-items-center">
                        <div class="col-md-4 col-12">
                            <div class="product-item d-flex align-items-center">
                                <img src="img/ci3.jpg" class="img-fluid" alt="">
                                <h6>${cart.product.name}</h6>
                            </div>
                        </div>
                        <div class="col-md-2 col-6">
                            <div class="price"><fmt:formatNumber type="currency"
                                                              value="${cart.product.price}"
                                                              currencySymbol="VND"/></div>
                        </div>
                        <div class="col-md-2 col-6">
                            <form action="${pageContext.request.contextPath}/order/update" method="post">
                            <div class="quantity-container d-flex align-items-center mt-15">
                                
                                <input type="hidden" name="id" value="${cart.product.id}">
                                <input type="text" class="quantity-amount" name="quantity" value="${cart.quantity}" id="quantity" >                               
                                <div class="arrow-btn d-inline-flex flex-column">
                                    <button class="increase arrow" type="button" title="Increase Quantity"><span class="lnr lnr-chevron-up"></span></button>
                                    <button class="decrease arrow" type="button" title="Decrease Quantity"><span class="lnr lnr-chevron-down"></span></button>
                                </div>
                                <input class=" info-border circle" type="submit" value="Update">
                                
                            </div>
                                </form>
                        </div>
                        <div class="col-md-2 col-12">
                            <div class="total"> <fmt:formatNumber type="currency"
                                                              value="${cart.totalAmount}"
                                                              currencySymbol="VND"/>
                            </div>
                            
                            
                        </div>
                            <div class="col-md-2 col-12">
                            <a href="${pageContext.request.contextPath}/order/remove/${cart.product.id}" class="genric-btn danger-border circle">Delete</a>
                        </div>
                    </div>
                </c:forEach>
                </div>
                <div class="cupon-area d-flex align-items-center justify-content-between flex-wrap">

                        <form action="${pageContext.request.contextPath}/product/category" >
                        <input type="hidden" name="action" value="shopping">
                        <input type="submit" class="view-btn color-2" value="Continue Shopping">
                    </form>
                    <div class="cuppon-wrap d-flex align-items-center flex-wrap">
                        <div class="cupon-code">
                            <input type="text">
                            <button class="view-btn color-2"><span>Apply</span></button>
                        </div>
                        <a href="#" class="view-btn color-2 have-btn"><span>Have a Coupon?</span></a>
                    </div>
                </div>
                <div class="subtotal-area d-flex align-items-center justify-content-end">
                    <div class="title text-uppercase">Subtotal</div>
                    <div class="subtotal"><fmt:formatNumber type="currency"
                                                              value="${totalCart}"
                                                              currencySymbol="VND"/></div>
                </div>
                <div class="shipping-area d-flex justify-content-end">
                    <div class="tile text-uppercase">Shipping</div>
                    <form action="${pageContext.request.contextPath}/order/checkout" method="get" class="d-inline-flex flex-column align-items-end">
                        <ul class="d-flex flex-column align-items-end">
                            
                            
                            <li class="filter-list">
                                <label for="local-delivery">Local Delivery:<span>$2.00</span></label>
                                <input class="pixel-radio" type="radio" id="local-delivery" name="brand">
                            </li>
                            <li class="calculate">Calculate Shipping</li>
                        </ul>
                        <input type="hidden" name="action" value="checkout">
                        <input class="view-btn color-2 mt-10" type="submit" value="Checkout">
                    </form>
                   

                </div>
            </div>

<!-- Start Most Search Product Area -->

<jsp:include page="include/footer.jsp"/>
<jsp:include page="include/js-page.jsp"/>  


</body>
</html>
