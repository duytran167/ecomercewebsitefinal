<%-- 
    Document   : singleproduct
    Created on : Mar 7, 2021, 12:39:27 PM
    Author     : PC
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
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
        <title>Single Product</title>

        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
        <!--
        CSS
        ============================================= -->

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
                        <h1>Single Product Page</h1>
                        <nav class="d-flex align-items-center justify-content-start">
                            <a href="index.html">Home<i class="fa fa-caret-right" aria-hidden="true"></i></a>
                            <a href="single.html">Single Product Page</a>
                        </nav>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Banner Area -->

        <!-- Start Product Details -->
        <div class="container">
           
            <div class="product-quick-view">
                <div class="row align-items-center">
                    <div class="col-lg-6">
                        <div class="quick-view-carousel-details">
                            <div class="item" style="background: url(img/q1.jpg);">

                            </div>
                            <div class="item" style="background: url(img/q1.jpg);">

                            </div>
                            <div class="item" style="background: url(img/q1.jpg);">

                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="quick-view-content">
                            <div class="top">
                                <h3 class="head">${products.name}</h3>
                                <div class="price d-flex align-items-center"><span class="lnr lnr-tag"></span> <span class="ml-10">${products.product_detail.price}</span></div>
                                <div class="category">Category: <span>${products.category.name}</span></div>
                                <div class="available">Status <span>${products.status}</span></div>
                            </div>
                            <div class="middle">
                                <p class="content">${products.description}</p>
                            </div>
                            <div >
                                <div class="quantity-container d-flex align-items-center mt-15">
                                    Quantity:
                                    <input type="text" class="quantity-amount ml-15" value="1" />
                                    <div class="arrow-btn d-inline-flex flex-column">
                                        <button class="increase arrow" type="button" title="Increase Quantity"><span class="lnr lnr-chevron-up"></span></button>
                                        <button class="decrease arrow" type="button" title="Decrease Quantity"><span class="lnr lnr-chevron-down"></span></button>
                                    </div>

                                </div>
                                <div class="d-flex mt-20">
                                    <a href="#" class="view-btn color-2"><span>Add to Cart</span></a>
                                    <a href="#" class="like-btn"><span class="lnr lnr-layers"></span></a>
                                    <a href="#" class="like-btn"><span class="lnr lnr-heart"></span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                              
        </div>


        <!-- End Product Details -->

        <!-- Start Most Search Product Area -->
        <section class="pt-100 pb-100">
            <div class="container">
                <div class="organic-section-title text-center">
                    <h3>Most Searched Products</h3>
                </div>
                <div class="row mt-30">
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="02-11-product-details.html"><img src="img/r1.jpg" alt=""></a>
                            <div class="desc">
                                <a href="02-11-product-details.html" class="title">Pixelstore fresh Blueberry</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $240.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="02-11-product-details.html"><img src="img/r2.jpg" alt=""></a>
                            <div class="desc">
                                <a href="02-11-product-details.html" class="title">Pixelstore fresh Cabbage</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $189.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="02-11-product-details.html"><img src="img/r3.jpg" alt=""></a>
                            <div class="desc">
                                <a href="02-11-product-details.html" class="title">Pixelstore fresh Raspberry</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $189.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="02-11-product-details.html"><img src="img/r4.jpg" alt=""></a>
                            <div class="desc">
                                <a href="02-11-product-details.html" class="title">Pixelstore fresh Kiwi</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $189.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="02-11-product-details.html"><img src="img/r5.jpg" alt=""></a>
                            <div class="desc">
                                <a href="02-11-product-details.html" class="title">Pixelstore Bell Pepper</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $120.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="02-11-product-details.html"><img src="img/r6.jpg" alt=""></a>
                            <div class="desc">
                                <a href="02-11-product-details.html" class="title">Pixelstore fresh Blackberry</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $120.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="02-11-product-details.html"><img src="img/r7.jpg" alt=""></a>
                            <div class="desc">
                                <a href="02-11-product-details.html" class="title">Pixelstore fresh Brocoli</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $120.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="02-11-product-details.html"><img src="img/r8.jpg" alt=""></a>
                            <div class="desc">
                                <a href="02-11-product-details.html" class="title">Pixelstore fresh Carrot</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $120.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="02-11-product-details.html"><img src="img/r9.jpg" alt=""></a>
                            <div class="desc">
                                <a href="02-11-product-details.html" class="title">Pixelstore fresh Strawberry</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $240.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="02-11-product-details.html"><img src="img/r10.jpg" alt=""></a>
                            <div class="desc">
                                <a href="02-11-product-details.html" class="title">Prixma MG2 Light Inkjet</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $240.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="02-11-product-details.html"><img src="img/r11.jpg" alt=""></a>
                            <div class="desc">
                                <a href="02-11-product-details.html" class="title">Pixelstore fresh Cherry</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $240.00 <del>$340.00</del></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="02-11-product-details.html"><img src="img/r12.jpg" alt=""></a>
                            <div class="desc">
                                <a href="02-11-product-details.html" class="title">Pixelstore fresh Beans</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $240.00 <del>$340.00</del></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Most Search Product Area -->
        <!-- start footer Area -->      
        <jsp:include page="include/footer.jsp"/>
        <jsp:include page="include/js-page.jsp"/>   
        <!-- End footer Area -->      
        <!-- Modal Quick Product View -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="container relative">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <div class="product-quick-view">
                        <div class="row align-items-center">
                            <div class="col-lg-6">
                                <div class="quick-view-carousel">
                                    <div class="item" style="background: url(img/organic-food/q1.jpg);">

                                    </div>
                                    <div class="item" style="background: url(img/organic-food/q1.jpg);">

                                    </div>
                                    <div class="item" style="background: url(img/organic-food/q1.jpg);">

                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="quick-view-content">
                                    <div class="top">
                                        <h3 class="head">Mill Oil 1000W Heater, White</h3>
                                        <div class="price d-flex align-items-center"><span class="lnr lnr-tag"></span> <span class="ml-10">$149.99</span></div>
                                        <div class="category">Category: <span>Household</span></div>
                                        <div class="available">Availibility: <span>In Stock</span></div>
                                    </div>
                                    <div class="middle">
                                        <p class="content">Mill Oil is an innovative oil filled radiator with the most modern technology. If you are looking for something that can make your interior look awesome, and at the same time give you the pleasant warm feeling during the winter.</p>
                                        <a href="#" class="view-full">View full Details <span class="lnr lnr-arrow-right"></span></a>
                                    </div>
                                    <div class="bottom">
                                        <div class="color-picker d-flex align-items-center">Color:
                                            <span class="single-pick"></span>
                                            <span class="single-pick"></span>
                                            <span class="single-pick"></span>
                                            <span class="single-pick"></span>
                                            <span class="single-pick"></span>
                                        </div>
                                        <div class="quantity-container d-flex align-items-center mt-15">
                                            Quantity:
                                            <input type="text" class="quantity-amount ml-15" value="1" />
                                            <div class="arrow-btn d-inline-flex flex-column">
                                                <button class="increase arrow" type="button" title="Increase Quantity"><span class="lnr lnr-chevron-up"></span></button>
                                                <button class="decrease arrow" type="button" title="Decrease Quantity"><span class="lnr lnr-chevron-down"></span></button>
                                            </div>

                                        </div>
                                        <div class="d-flex mt-20">
                                            <a href="#" class="view-btn color-2"><span>Add to Cart</span></a>
                                            <a href="#" class="like-btn"><span class="lnr lnr-layers"></span></a>
                                            <a href="#" class="like-btn"><span class="lnr lnr-heart"></span></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>  
          

    </body>
</html>
