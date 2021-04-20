<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <title>Home Page</title>
        <jsp:include page="include/css-page.jsp" />
    </head>
    <body>
        <!-- Start Header Area -->

        <jsp:include page="include/menu1.jsp" />
        <!-- End Header Area -->

        <!-- start banner Area -->
        <section class="banner-area relative" id="home">
            <div class="container-fluid">
                <div class="row fullscreen align-items-center justify-content-center">
                    <div class="col-lg-6 col-md-12 d-flex align-self-end img-right no-padding">
                        <img class="img-fluid" src="<c:url value="/resources/img/header-img.png"/>" alt="">
                    </div>
                    <div class="banner-content col-lg-6 col-md-12">
                        <h1 class="title-top"><span>Flat</span> 75%Off</h1>
                        <h1 class="text-uppercase">
                            It’s Happening <br>
                            this Season!
                        </h1>
                        <button class="primary-btn text-uppercase"><a href="#">Purchase Now</a></button>
                    </div>							
                </div>
            </div>
        </section>
        <!-- End banner Area -->

        <section class="men-product-area section-gap relative" id="new">
            <div class="overlay overlay-bg"></div>
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="menu-content pb-40">
                        <div class="title text-center">
                            <h1 class="text-white mb-10">NEW ARRIVAL</h1>
                            <p class="text-white">FROM STUDIO WITH LOVE.</p>
                        </div>
                    </div>
                </div>
                <div class="row">                    
                        <c:forEach var="p" items="${product}">
                            <div class="col-lg-3 col-md-6 single-product">
                                <div class="content">
                                    <div class="content-overlay"></div>
                                    <img class="content-image img-fluid d-block mx-auto" src="<c:url value="/resources/img/l8.jpg"/>" alt="">
                                    <div class="content-details fadeIn-bottom">
                                        <div class="bottom d-flex align-items-center justify-content-center">
                                            <a href="#"><span class="lnr lnr-heart"></span></a>
                                                    <a href="#"><span class="lnr lnr-layers"></span></a>
                                                   
                                                    <a href="<c:url value="/product/detail/${p.id}"/>"><span class="lnr lnr-frame-expand"></span></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="price">
                                    <h5 class="text-white">${p.name}</h5>
                                   
                                    <h3 class="text-white"><fmt:formatNumber type="currency"
                                                          value="${p.price}"
                                                          currencySymbol="VND"/></h3>
                                    
                                </div>
                            </div>
                        </c:forEach>
                     
                </div>
            </div>
        </section>

        <!-- Start women-product Area -->
        <section class="women-product-area section-gap" id="best">
            <div class="container">
                <div class="countdown-content pb-40">
                    <div class="title text-center">
                        <h1 class="mb-10">BEST PRICE</h1>
                        <p>Who are in extremely love with eco friendly system.</p>
                    </div>
                </div>
                <div class="row">
                    	<c:forEach var="p" items="${productsell}">
                            <div class="col-lg-3 col-md-6 single-product">
                                <div class="content">
                                    <div class="content-overlay"></div>
                                    <img class="content-image img-fluid d-block mx-auto" src="<c:url value="/resources/img/l8.jpg"/>" alt="">
                                    <div class="content-details fadeIn-bottom">
                                        <div class="bottom d-flex align-items-center justify-content-center">
                                            <a href="#"><span class="lnr lnr-heart"></span></a>
                                                    <a href="#"><span class="lnr lnr-layers"></span></a>
                                                    
                                                    <a href="<c:url value="/product/detail/${p.id}"/>"><span class="lnr lnr-frame-expand"></span></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="price">
                                    <h5>${p.name}</h5>
                                   
                                    <h3><fmt:formatNumber type="currency"
                                                          value="${p.price}"
                                                          currencySymbol="VND"/></h3>
                                    
                                </div>
                            </div>
                        </c:forEach>
                    						  
                    </div>	
                    																			
                </div>
            	
        </section>
        <section class="brand-area pb-100">
				<div class="container">
					<div class="row logo-wrap">
							<a class="col single-img" href="#">
                                                            <img  class="d-block mx-auto" src="<c:url value="/resources/img/br1.png"/>" alt="">
								
							</a>
							<a class="col single-img" href="#">
								 <img  class="d-block mx-auto" src="<c:url value="/resources/img/br2.png"/>" alt="">
							</a>
							<a class="col single-img" href="#">
								 <img  class="d-block mx-auto" src="<c:url value="/resources/img/br3.png"/>" alt="">
							</a>
							<a class="col single-img" href="#">
								 <img  class="d-block mx-auto" src="<c:url value="/resources/img/br4.png"/>" alt="">
							</a>
							<a class="col single-img" href="#">
								 <img  class="d-block mx-auto" src="<c:url value="/resources/img/br5.png"/>" alt="">
							</a>
					</div>	
				</div>	
			</section>

        <jsp:include page="include/footer.jsp"/>
        <jsp:include page="include/js-page.jsp"/>
    </body>
</html>
