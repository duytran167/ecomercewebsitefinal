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
                <c:set var="total" value="${0}"></c:set>
                <c:set var="totalCart" value="${0}"></c:set>
                <c:forEach var="cart" items="${cart}">
                    <c:set var="total" value="${cart.quantity * cart.product.price}"></c:set>
                    <c:set var="ship" value="30000"></c:set>
                    <c:set var="totalCart" value="${totalCart + total }"></c:set>
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
                                              value="${total}"
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
                <div class="tile text-uppercase">Shipping:</div>
                <div class="d-inline-flex flex-column align-items-end">

                    <ul class="d-flex flex-column align-items-end">
                        <label for="local-delivery"><span>${ship}</span></label>
                    </ul>

                    <% if (session.getAttribute("users") != null) { %>
                    <td colspan="4">

                        <form action="${pageContext.request.contextPath}/order/checkout" method="get">
                        
                        <input class="view-btn color-2 mt-10" type="submit" value="checkout">
                        
                    </form>
                    </td> 
                    <% } else { %>
                    <td colspan="4">
                        <div class=" view-btn color-2 mt-10" data-toggle="modal" data-target="#myModal"><a>Checkout</a></div>
                    </td>
                    <div class="modal" id="myModal">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-body">
                                    <h3 style="text-align: center;">Please
                                        <a href="${pageContext.request.contextPath}/login">Login</a> or 
                                        <a href="${pageContext.request.contextPath}/register/register_log">Register</a> to get more offers!
                                    </h3>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <% }%>


            </div>
            </div>
    </div>

    <!-- Start Most Search Product Area -->

    <jsp:include page="include/footer.jsp"/>
    <jsp:include page="include/js-page.jsp"/>  


</body>
</html>
