<%-- 
    Document   : category
    Created on : Feb 25, 2021, 10:00:09 AM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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

    <body>
        <!-- Start Header Area -->
        <jsp:include page="include/menu1.jsp" />
        <!-- End Header Area -->
        <!-- Start Banner Area -->
        <section class="banner-area organic-breadcrumb">
            <div class="container">
                <div class="breadcrumb-banner d-flex flex-wrap align-items-center">
                    <div class="col-first">
                        <h1>Shop Category page</h1>
                        <nav class="d-flex align-items-center justify-content-start">
                            <a href="index.html">Home<i class="fa fa-caret-right" aria-hidden="true"></i></a>
                            <a href="category.html">Fashon Category</a>
                        </nav>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Banner Area -->
        <div class="container">

            <div class="row">

                <div class="col-xl-9 col-lg-8 col-md-7">
                    <!-- Start Filter Bar -->
                    <div class="filter-bar d-flex flex-wrap align-items-center">
                        <a href="#" class="grid-btn active"><i class="fa fa-th" aria-hidden="true"></i></a>
                        <a href="#" class="list-btn"><i class="fa fa-th-list" aria-hidden="true"></i></a>
                        <div class="sorting">
                            <select>
                                <option value="1">Default sorting</option>
                                <option value="1">Default sorting</option>
                                <option value="1">Default sorting</option>
                            </select>
                        </div>
                        <div class="sorting mr-auto">
                            <select>
                                <option value="1">Show 12</option>
                                <option value="1">Show 12</option>
                                <option value="1">Show 12</option>
                            </select>
                        </div>
                        <div class="pagination">
                            <a href="#" class="prev-arrow"><i class="fa fa-long-arrow-left" aria-hidden="true"></i></a>
                            <a href="#" class="active">1</a>
                            <a href="#">2</a>
                            <a href="#">3</a>
                            <a href="#" class="dot-dot"><i class="fa fa-ellipsis-h" aria-hidden="true"></i></a>
                            <a href="#">6</a>
                            <a href="#" class="next-arrow"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
                        </div>
                    </div>
                    <!-- End Filter Bar -->
                    <!-- Start Best Seller -->
                    <section class="lattest-product-area pb-40 category-list">
                        <div class="row">
                            <c:if test="${products != null && fn:length(products)>0}">
                                <c:forEach var="p" items="${products}">
                                    <div class="col-xl-4 col-lg-6 col-md-12 col-sm-6 single-product">
                                        <div class="content">
                                            <div class="content-overlay"></div>
                                            <img class="content-image img-fluid d-block mx-auto" src="${pageContext.request.contextPath }/img/l5.jpg" alt="">
                                            <div class="content-details fadeIn-bottom">
                                                <div class="bottom d-flex align-items-center justify-content-center">
                                                    <a href="#"><span class="lnr lnr-heart"></span></a>
                                                    <a href="#"><span class="lnr lnr-layers"></span></a>
                                                    <a href="#"><span class="lnr lnr-cart"></span></a>
                                                    <a href="#" data-toggle="modal" data-target="#exampleModal"><span class="lnr lnr-frame-expand"></span></a>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="price">
                                            <h5>${p.name}</h5>

                                            <h3>${p.product_detail.price}</h3>
                                        </div>
                                        <td>
                                            <button onclick="location.href = '<c:url value="/product/detail/${p.id}"/>'"
                                                    class="btn btn-warning">
                                                Detail
                                            </button>

                                        </td>
                                    </div>
                                </c:forEach>
                            </c:if> 

                        </div>
                    </section>
                    <!-- End Best Seller -->
                    <!-- Start Filter Bar -->
                    <div class="filter-bar d-flex flex-wrap align-items-center">
                        <div class="sorting mr-auto">
                            <select>
                                <option value="1">Show 12</option>
                                <option value="1">Show 12</option>
                                <option value="1">Show 12</option>
                            </select>
                        </div>
                        <div class="pagination">
                            <a href="#" class="prev-arrow"><i class="fa fa-long-arrow-left" aria-hidden="true"></i></a>
                            <a href="#" class="active">1</a>
                            <a href="#">2</a>
                            <a href="#">3</a>
                            <a href="#" class="dot-dot"><i class="fa fa-ellipsis-h" aria-hidden="true"></i></a>
                            <a href="#">6</a>
                            <a href="#" class="next-arrow"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
                        </div>
                    </div>
                    <!-- End Filter Bar -->
                </div>
                <div class="col-xl-3 col-lg-4 col-md-5">
                    <div class="sidebar-categories">
                        <div class="head">Browse Categories</div>
                        <ul class="main-categories">
                            <li class="main-nav-list"><a data-toggle="collapse" href="#fruitsVegetable" aria-expanded="false" aria-controls="fruitsVegetable"><span class="lnr lnr-arrow-right"></span>Fruits and Vegetables<span class="number">(53)</span></a>
                                <ul class="collapse" id="fruitsVegetable" data-toggle="collapse" aria-expanded="false" aria-controls="fruitsVegetable">
                                    <li class="main-nav-list child"><a href="#">Frozen Fish<span class="number">(13)</span></a></li>
                                    <li class="main-nav-list child"><a href="#">Dried Fish<span class="number">(09)</span></a></li>
                                    <li class="main-nav-list child"><a href="#">Fresh Fish<span class="number">(17)</span></a></li>
                                    <li class="main-nav-list child"><a href="#">Meat Alternatives<span class="number">(01)</span></a></li>
                                    <li class="main-nav-list child"><a href="#">Meat<span class="number">(11)</span></a></li>
                                </ul>
                            </li>

                            <li class="main-nav-list"><a data-toggle="collapse" href="#meatFish" aria-expanded="false" aria-controls="meatFish"><span class="lnr lnr-arrow-right"></span>Meat and Fish<span class="number">(53)</span></a>
                                <ul class="collapse" id="meatFish" data-toggle="collapse" aria-expanded="false" aria-controls="meatFish">
                                    <li class="main-nav-list child"><a href="#">Frozen Fish<span class="number">(13)</span></a></li>
                                    <li class="main-nav-list child"><a href="#">Dried Fish<span class="number">(09)</span></a></li>
                                    <li class="main-nav-list child"><a href="#">Fresh Fish<span class="number">(17)</span></a></li>
                                    <li class="main-nav-list child"><a href="#">Meat Alternatives<span class="number">(01)</span></a></li>
                                    <li class="main-nav-list child"><a href="#">Meat<span class="number">(11)</span></a></li>
                                </ul>
                            </li>
                            <li class="main-nav-list"><a data-toggle="collapse" href="#cooking" aria-expanded="false" aria-controls="cooking"><span class="lnr lnr-arrow-right"></span>Cooking<span class="number">(53)</span></a>
                                <ul class="collapse" id="cooking" data-toggle="collapse" aria-expanded="false" aria-controls="cooking">
                                    <li class="main-nav-list child"><a href="#">Frozen Fish<span class="number">(13)</span></a></li>
                                    <li class="main-nav-list child"><a href="#">Dried Fish<span class="number">(09)</span></a></li>
                                    <li class="main-nav-list child"><a href="#">Fresh Fish<span class="number">(17)</span></a></li>
                                    <li class="main-nav-list child"><a href="#">Meat Alternatives<span class="number">(01)</span></a></li>
                                    <li class="main-nav-list child"><a href="#">Meat<span class="number">(11)</span></a></li>
                                </ul>
                            </li>
                            <li class="main-nav-list"><a data-toggle="collapse" href="#beverages" aria-expanded="false" aria-controls="beverages"><span class="lnr lnr-arrow-right"></span>Beverages<span class="number">(24)</span></a>
                                <ul class="collapse" id="beverages" data-toggle="collapse" aria-expanded="false" aria-controls="beverages">
                                    <li class="main-nav-list child"><a href="#">Frozen Fish<span class="number">(13)</span></a></li>
                                    <li class="main-nav-list child"><a href="#">Dried Fish<span class="number">(09)</span></a></li>
                                    <li class="main-nav-list child"><a href="#">Fresh Fish<span class="number">(17)</span></a></li>
                                    <li class="main-nav-list child"><a href="#">Meat Alternatives<span class="number">(01)</span></a></li>
                                    <li class="main-nav-list child"><a href="#">Meat<span class="number">(11)</span></a></li>
                                </ul>
                            </li>
                            <li class="main-nav-list"><a data-toggle="collapse" href="#homeClean" aria-expanded="false" aria-controls="homeClean"><span class="lnr lnr-arrow-right"></span>Home and Cleaning<span class="number">(53)</span></a>
                                <ul class="collapse" id="homeClean" data-toggle="collapse" aria-expanded="false" aria-controls="homeClean">
                                    <li class="main-nav-list child"><a href="#">Frozen Fish<span class="number">(13)</span></a></li>
                                    <li class="main-nav-list child"><a href="#">Dried Fish<span class="number">(09)</span></a></li>
                                    <li class="main-nav-list child"><a href="#">Fresh Fish<span class="number">(17)</span></a></li>
                                    <li class="main-nav-list child"><a href="#">Meat Alternatives<span class="number">(01)</span></a></li>
                                    <li class="main-nav-list child"><a href="#">Meat<span class="number">(11)</span></a></li>
                                </ul>
                            </li>
                            <li class="main-nav-list"><a href="#">Pest Control<span class="number">(24)</span></a></li>
                            <li class="main-nav-list"><a data-toggle="collapse" href="#officeProduct" aria-expanded="false" aria-controls="officeProduct"><span class="lnr lnr-arrow-right"></span>Office Products<span class="number">(77)</span></a>
                                <ul class="collapse" id="officeProduct" data-toggle="collapse" aria-expanded="false" aria-controls="officeProduct">
                                    <li class="main-nav-list child"><a href="#">Frozen Fish<span class="number">(13)</span></a></li>
                                    <li class="main-nav-list child"><a href="#">Dried Fish<span class="number">(09)</span></a></li>
                                    <li class="main-nav-list child"><a href="#">Fresh Fish<span class="number">(17)</span></a></li>
                                    <li class="main-nav-list child"><a href="#">Meat Alternatives<span class="number">(01)</span></a></li>
                                    <li class="main-nav-list child"><a href="#">Meat<span class="number">(11)</span></a></li>
                                </ul>
                            </li>
                            <li class="main-nav-list"><a data-toggle="collapse" href="#beauttyProduct" aria-expanded="false" aria-controls="beauttyProduct"><span class="lnr lnr-arrow-right"></span>Beauty Products<span class="number">(65)</span></a>
                                <ul class="collapse" id="beauttyProduct" data-toggle="collapse" aria-expanded="false" aria-controls="beauttyProduct">
                                    <li class="main-nav-list child"><a href="#">Frozen Fish<span class="number">(13)</span></a></li>
                                    <li class="main-nav-list child"><a href="#">Dried Fish<span class="number">(09)</span></a></li>
                                    <li class="main-nav-list child"><a href="#">Fresh Fish<span class="number">(17)</span></a></li>
                                    <li class="main-nav-list child"><a href="#">Meat Alternatives<span class="number">(01)</span></a></li>
                                    <li class="main-nav-list child"><a href="#">Meat<span class="number">(11)</span></a></li>
                                </ul>
                            </li>
                            <li class="main-nav-list"><a data-toggle="collapse" href="#healthProduct" aria-expanded="false" aria-controls="healthProduct"><span class="lnr lnr-arrow-right"></span>Health Products<span class="number">(29)</span></a>
                                <ul class="collapse" id="healthProduct" data-toggle="collapse" aria-expanded="false" aria-controls="healthProduct">
                                    <li class="main-nav-list child"><a href="#">Frozen Fish<span class="number">(13)</span></a></li>
                                    <li class="main-nav-list child"><a href="#">Dried Fish<span class="number">(09)</span></a></li>
                                    <li class="main-nav-list child"><a href="#">Fresh Fish<span class="number">(17)</span></a></li>
                                    <li class="main-nav-list child"><a href="#">Meat Alternatives<span class="number">(01)</span></a></li>
                                    <li class="main-nav-list child"><a href="#">Meat<span class="number">(11)</span></a></li>
                                </ul>
                            </li>
                            <li class="main-nav-list"><a href="#">Pet Care<span class="number">(29)</span></a></li>
                            <li class="main-nav-list"><a data-toggle="collapse" href="#homeAppliance" aria-expanded="false" aria-controls="homeAppliance"><span class="lnr lnr-arrow-right"></span>Home Appliances<span class="number">(15)</span></a>
                                <ul class="collapse" id="homeAppliance" data-toggle="collapse" aria-expanded="false" aria-controls="homeAppliance">
                                    <li class="main-nav-list child"><a href="#">Frozen Fish<span class="number">(13)</span></a></li>
                                    <li class="main-nav-list child"><a href="#">Dried Fish<span class="number">(09)</span></a></li>
                                    <li class="main-nav-list child"><a href="#">Fresh Fish<span class="number">(17)</span></a></li>
                                    <li class="main-nav-list child"><a href="#">Meat Alternatives<span class="number">(01)</span></a></li>
                                    <li class="main-nav-list child"><a href="#">Meat<span class="number">(11)</span></a></li>
                                </ul>
                            </li>
                            <li class="main-nav-list"><a class="border-bottom-0" data-toggle="collapse" href="#babyCare" aria-expanded="false" aria-controls="babyCare"><span class="lnr lnr-arrow-right"></span>Baby Care<span class="number">(48)</span></a>
                                <ul class="collapse" id="babyCare" data-toggle="collapse" aria-expanded="false" aria-controls="babyCare">
                                    <li class="main-nav-list child"><a href="#">Frozen Fish<span class="number">(13)</span></a></li>
                                    <li class="main-nav-list child"><a href="#">Dried Fish<span class="number">(09)</span></a></li>
                                    <li class="main-nav-list child"><a href="#">Fresh Fish<span class="number">(17)</span></a></li>
                                    <li class="main-nav-list child"><a href="#">Meat Alternatives<span class="number">(01)</span></a></li>
                                    <li class="main-nav-list child"><a href="#" class="border-bottom-0">Meat<span class="number">(11)</span></a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="sidebar-filter mt-50">
                        <div class="top-filter-head">Product Filters</div>
                        <div class="common-filter">
                            <div class="head">Active Filters</div>
                            <ul>
                                <li class="filter-list"><i class="fa fa-window-close" aria-hidden="true"></i>Gionee (29)</li>
                                <li class="filter-list"><i class="fa fa-window-close" aria-hidden="true"></i>Black with red (09)</li>
                            </ul>
                        </div>
                        <div class="common-filter">
                            <div class="head">Brands</div>
                            <form action="#">
                                <ul>
                                    <li class="filter-list"><input class="pixel-radio" type="radio" id="apple" name="brand"><label for="apple">Apple<span>(29)</span></label></li>
                                    <li class="filter-list"><input class="pixel-radio" type="radio" id="asus" name="brand"><label for="asus">Asus<span>(29)</span></label></li>
                                    <li class="filter-list"><input class="pixel-radio" type="radio" id="gionee" name="brand"><label for="gionee">Gionee<span>(19)</span></label></li>
                                    <li class="filter-list"><input class="pixel-radio" type="radio" id="micromax" name="brand"><label for="micromax">Micromax<span>(19)</span></label></li>
                                    <li class="filter-list"><input class="pixel-radio" type="radio" id="samsung" name="brand"><label for="samsung">Samsung<span>(19)</span></label></li>
                                </ul>
                            </form>
                        </div>
                        <div class="common-filter">
                            <div class="head">Color</div>
                            <form action="#">
                                <ul>
                                    <li class="filter-list"><input class="pixel-radio" type="radio" id="black" name="color"><label for="black">Black<span>(29)</span></label></li>
                                    <li class="filter-list"><input class="pixel-radio" type="radio" id="balckleather" name="color"><label for="balckleather">Black Leather<span>(29)</span></label></li>
                                    <li class="filter-list"><input class="pixel-radio" type="radio" id="blackred" name="color"><label for="blackred">Black with red<span>(19)</span></label></li>
                                    <li class="filter-list"><input class="pixel-radio" type="radio" id="gold" name="color"><label for="gold">Gold<span>(19)</span></label></li>
                                    <li class="filter-list"><input class="pixel-radio" type="radio" id="spacegrey" name="color"><label for="spacegrey">Spacegrey<span>(19)</span></label></li>
                                </ul>
                            </form>
                        </div>
                        <div class="common-filter">
                            <div class="head">Price</div>
                            <div class="price-range-area">
                                <div id="price-range"></div>
                                <div class="value-wrapper d-flex">
                                    <div class="price">Price:</div>
                                    <span>$</span><div id="lower-value"></div> <div class="to">to</div> 
                                    <span>$</span><div id="upper-value"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Start Most Search Product Area -->
        <section class="section-half">
            <div class="container">
                <div class="organic-section-title text-center">
                    <h3>Most Searched Products</h3>
                </div>
                <div class="row mt-30">
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="#"><img src="img/r1.jpg" alt=""></a>
                            <div class="desc">
                                <a href="#" class="title">Pixelstore fresh Blueberry</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $240.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="#"><img src="img/r2.jpg" alt=""></a>
                            <div class="desc">
                                <a href="#" class="title">Pixelstore fresh Cabbage</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $189.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="#"><img src="img/r3.jpg" alt=""></a>
                            <div class="desc">
                                <a href="#" class="title">Pixelstore fresh Raspberry</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $189.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="#"><img src="img/r4.jpg" alt=""></a>
                            <div class="desc">
                                <a href="#" class="title">Pixelstore fresh Kiwi</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $189.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="#"><img src="img/r5.jpg" alt=""></a>
                            <div class="desc">
                                <a href="#" class="title">Pixelstore Bell Pepper</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $120.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="#"><img src="img/r6.jpg" alt=""></a>
                            <div class="desc">
                                <a href="#" class="title">Pixelstore fresh Blackberry</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $120.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="#"><img src="img/r7.jpg" alt=""></a>
                            <div class="desc">
                                <a href="#" class="title">Pixelstore fresh Brocoli</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $120.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="#"><img src="img/r8.jpg" alt=""></a>
                            <div class="desc">
                                <a href="#" class="title">Pixelstore fresh Carrot</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $120.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="#"><img src="img/r9.jpg" alt=""></a>
                            <div class="desc">
                                <a href="#" class="title">Pixelstore fresh Strawberry</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $240.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="#"><img src="img/r10.jpg" alt=""></a>
                            <div class="desc">
                                <a href="#" class="title">Prixma MG2 Light Inkjet</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $240.00</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="#"><img src="img/r11.jpg" alt=""></a>
                            <div class="desc">
                                <a href="#" class="title">Pixelstore fresh Cherry</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $240.00 <del>$340.00</del></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-search-product d-flex">
                            <a href="#"><img src="img/r12.jpg" alt=""></a>
                            <div class="desc">
                                <a href="#" class="title">Pixelstore fresh Beans</a>
                                <div class="price"><span class="lnr lnr-tag"></span> $240.00 <del>$340.00</del></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Most Search Product Area -->
        <!-- Footer--->
        <jsp:include page="include/footer.jsp"/>
        <jsp:include page="include/js-page.jsp"/>

    </body>
</html>
