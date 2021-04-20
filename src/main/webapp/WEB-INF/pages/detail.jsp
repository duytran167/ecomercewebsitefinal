<%-- 
    Document   : singleproduct
    Created on : Mar 7, 2021, 12:39:27 PM
    Author     : PC
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form"
           prefix="mvc" %>

<!DOCTYPE html>
<html>
    <head>

        <!-- Mobile Specific Meta -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Favicon-->
        <link rel="shortcut icon" href="img/fav.png">
        <!-- Author Meta -->
        <meta name="author" content="CodePixar">
        <!-- Meta Description -->
        <meta name="description" content="NOI VUI VE">
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
                        <img class="content-image img-fluid d-block mx-auto" src="<c:url value="/resources/img/l8.jpg"/>" alt="">
                    </div>
                    <div class="col-lg-6">
                        <form action="${pageContext.request.contextPath}/order/addToCart" method="get">
                        <div class="quick-view-content">
                            <div class="top">
                                <div class="search_item" style="display: none;">
                                    <input type="text" name="productId" value="${product.id}">
                                </div>
                                <h3 class="head">${product.name}</h3>
                                <div class="price d-flex align-items-center"><span class="lnr lnr-tag"></span> <span class="ml-10"><fmt:formatNumber type="currency"
                                                  value="${product.price}" 
                                                  currencySymbol="VND"/></span></div>
                                <div class="search_item" style="display: none;">
                                    <input type="text" name="price" value="${product.price}">
                                </div>
                                <div class="category">Category: <span>${product.category.name}</span></div>
                                <div class="available"><span>${product.status}</span></div>
                                <div class="sorting row product-options">
                                    <div class="col-lg-3">
                                        <h5>Color</h5>
                                        <select class="input-select" name="colorId">
                                            <c:forEach items="${color}" var="c">
                                                <c:if test="${product_detail.product.color.id == c.id}">
                                                    <option  value="${c.id}" selected="">${c.name}</option>
                                                </c:if>
                                                <c:if test="${product_detail.product.color.id != c.id}">
                                                    <option  value="${c.id}">${c.name}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-lg-3">
                                        <h5>Size</h5>
                                        <select class="input-select" name="sizeId">
                                            <c:forEach items="${size}" var="s">
                                                <c:if test="${product_detail.product.size.id == s.id}">
                                                    <option  value="${s.id}" selected="">${s.name}</option>
                                                </c:if>
                                                <c:if test="${product_detail.product.size.id != s.id}">
                                                    <option value="${s.id}">${s.name}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="middle">
                                <p class="content">${product.description}</p>
                            </div>
                            <div>
                                <div class="quantity-container d-flex align-items-center mt-15">
                                    Quantity:
                                    <input type="text" class="quantity-amount ml-15" value="1" />
                                    <div class="arrow-btn d-inline-flex flex-column">
                                        <button class="increase arrow" type="button" title="Increase Quantity"><span class="lnr lnr-chevron-up"></span></button>
                                        <button class="decrease arrow" type="button" title="Decrease Quantity"><span class="lnr lnr-chevron-down"></span></button>
                                    </div>
                                </div>
                                <div class="d-flex mt-20">
                                    <button class="view-btn color-2" type="submit"><a><span>Add to Cart</span></a> </button>
                                    <a href="#" class="like-btn"><span class="lnr lnr-layers"></span></a>
                                    <a href="#" class="like-btn"><span class="lnr lnr-heart"></span></a>
                                </div>
                            </div>
                        </div>
                    </form>
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
                            <a href="02-11-product-details.html"><img src="<c:url value="/resources/img/r1.jpg"/>" alt=""></a>
                            <div class="desc">
                                <a href="02-11-product-details.html" class="title">Pixelstore fresh Blueberry</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $240.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="02-11-product-details.html"><img src="<c:url value="/resources/img/r2.jpg"/>" alt=""></a>
                            <div class="desc">
                                <a href="02-11-product-details.html" class="title">Pixelstore fresh Cabbage</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $189.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="02-11-product-details.html"><img src="<c:url value="/resources/img/r3.jpg"/>" alt=""></a>
                            <div class="desc">
                                <a href="02-11-product-details.html" class="title">Pixelstore fresh Raspberry</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $189.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="02-11-product-details.html"><img src="<c:url value="/resources/img/r4.jpg"/>" alt=""></a>
                            <div class="desc">
                                <a href="02-11-product-details.html" class="title">Pixelstore fresh Kiwi</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $189.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="02-11-product-details.html"><img src="<c:url value="/resources/img/r5.jpg"/>" alt=""></a>
                            <div class="desc">
                                <a href="02-11-product-details.html" class="title">Pixelstore Bell Pepper</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $120.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="02-11-product-details.html"><img src="<c:url value="/resources/img/r6.jpg"/>" alt=""></a>
                            <div class="desc">
                                <a href="02-11-product-details.html" class="title">Pixelstore fresh Blackberry</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $120.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="02-11-product-details.html"><img src="<c:url value="/resources/img/r7.jpg"/>" alt=""></a>
                            <div class="desc">
                                <a href="02-11-product-details.html" class="title">Pixelstore fresh Brocoli</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $120.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="02-11-product-details.html"><img src="<c:url value="/resources/img/r8.jpg"/>" alt=""></a>
                            <div class="desc">
                                <a href="02-11-product-details.html" class="title">Pixelstore fresh Carrot</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $120.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="02-11-product-details.html"><img src="<c:url value="/resources/img/r9.jpg"/>" alt=""></a>
                            <div class="desc">
                                <a href="02-11-product-details.html" class="title">Pixelstore fresh Strawberry</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $240.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="02-11-product-details.html"><img src="<c:url value="/resources/img/r10.jpg"/>" alt=""></a>
                            <div class="desc">
                                <a href="02-11-product-details.html" class="title">Prixma MG2 Light Inkjet</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $240.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="02-11-product-details.html"><img src="<c:url value="/resources/img/r11.jpg"/>" alt=""></a>
                            <div class="desc">
                                <a href="02-11-product-details.html" class="title">Pixelstore fresh Cherry</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $240.00 <del>$340.00</del></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="02-11-product-details.html"><img src="<c:url value="/resources/img/r12.jpg"/>" alt=""></a>
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



    </body>
</html>
