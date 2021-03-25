<%-- 
    Document   : cart
    Created on : Mar 18, 2021, 6:47:45 PM
    Author     : PC
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <div class="col-md-6">
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


            <div class="container">
                <div class="content">
                    <div class="shopping_cart">
                        <c:forEach var="map" items="${sessionScope.myCartItems}">
                            <div class="cart_box">
                                <div class="message">
                                    <div class="list_img"><img src="${pageContext.request.contextPath}/resources/pages/images/pi1.jpg" class="img-responsive" alt=""></div>
                                    <div class="list_close"><a href="${pageContext.request.contextPath}/cart/remove/${map.value.product.productId}.html">Remove item</a></div> 
                                    <div class="list_desc"><h4><a href="#"><c:out value="${map.value.product.productName}"/></a></h4><c:out value="${map.value.quantity}"/> x
                                        $<c:out value="${map.value.product.productPrice}"/> = <span class="actual">  $<c:out value="${map.value.quantity * map.value.product.productPrice}"/></span></div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>



                </div>
                <div class="clearfix"></div>


                <div class="cupon-area d-flex align-items-center justify-content-between flex-wrap">
                    <a href="#" class="view-btn color-2"><span>Update Cart</span></a>
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
                    <div class="subtotal">$<c:out value="${sessionScope.myCartTotal}"/></div>
                </div>
                <div class="shipping-area d-flex justify-content-end">
                    
                    <form action="#" class="d-inline-flex flex-column align-items-end">
                        <ul class="d-flex flex-column align-items-end">

                            
                            <div class="total">
                                

                                <div class="total_right" type="currency">Shipping: 30000 VND </div>
                                <div class="clearfix"> </div>
                                <div class="total_right">Pay: $<c:out value="${sessionScope.myCartTotal + (sessionScope.myCartTotal + 30000)}"/></div>
                                <div class="clearfix"> </div>
                            </div>
                        </ul>


                        <button class="view-btn color-2 mt-10"><span><a href="<c:url value="/checkout/checkout"/>">Check Out</span></button>
                    </form>

                </div>
            </div>
        </div>
        <!-- End Cart Area -->

        <!-- Start Most Search Product Area -->
        <section class="section-half">
            <div class="container">
                <div class="organic-section-title text-center">
                    <h3>Most Searched Products</h3>
                </div>
                <div class="row mt-30">
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="#"><img src="<c:url value='/resources/img/r1.jpg'/>" alt=""></a>
                            <div class="desc">
                                <a href="#" class="title">Pixelstore fresh Blueberry</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $240.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="#"><img src="<c:url value='/resources/img/r2.jpg'/>" alt=""></a>
                            <div class="desc">
                                <a href="#" class="title">Pixelstore fresh Cabbage</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $189.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="#"><img src="<c:url value='/resources/img/r3.jpg'/>" alt=""></a>
                            <div class="desc">
                                <a href="#" class="title">Pixelstore fresh Raspberry</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $189.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="#"><img src="<c:url value='/resources/img/r4.jpg'/>" alt=""></a>
                            <div class="desc">
                                <a href="#" class="title">Pixelstore fresh Kiwi</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $189.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="#"><img src="<c:url value='/resources/img/r5.jpg'/>" alt=""></a>
                            <div class="desc">
                                <a href="#" class="title">Pixelstore Bell Pepper</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $120.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="#"><img src="<c:url value='/resources/img/r6.jpg'/>" alt=""></a>
                            <div class="desc">
                                <a href="#" class="title">Pixelstore fresh Blackberry</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $120.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="#"><img src="<c:url value='/resources/img/r7.jpg'/>" alt=""></a>
                            <div class="desc">
                                <a href="#" class="title">Pixelstore fresh Brocoli</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $120.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="#"><img src="<c:url value='/resources/img/r8.jpg'/>" alt=""></a>
                            <div class="desc">
                                <a href="#" class="title">Pixelstore fresh Carrot</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $120.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="#"><img src="<c:url value='/resources/img/r9.jpg'/>" alt=""></a>
                            <div class="desc">
                                <a href="#" class="title">Pixelstore fresh Strawberry</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $240.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="#"><img src="<c:url value='/resources/img/r10.jpg'/>" alt=""></a>
                            <div class="desc">
                                <a href="#" class="title">Prixma MG2 Light Inkjet</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $240.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="#"><img src="<c:url value='/resources/img/r11.jpg'/>" alt=""></a>
                            <div class="desc">
                                <a href="#" class="title">Pixelstore fresh Cherry</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $240.00 <del>$340.00</del></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="#"><img src="<c:url value='/resources/img/r12.jpg'/>" alt=""></a>
                            <div class="desc">
                                <a href="#" class="title">Pixelstore fresh Beans</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $240.00 <del>$340.00</del></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="include/footer.jsp"/>
        <jsp:include page="include/js-page.jsp"/>  


    </body>
</html>
