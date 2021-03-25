<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value="/resources/css/font-awesome.min.css"/>"/>
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>"/>

<header class="default-header">
    <div class="menutop-wrap">
        <div class="menu-top container">
            <div class="d-flex justify-content-between align-items-center">
                <ul class="list">
                    <li><a href="tel:+12312-3-1209">+12312-3-1209</a></li>
                    <li><a href="mailto:support@colorlib.com">support@colorlib.com</a></li>
                    <li><a>Hello : <span>${message}</span></a></li>
                </ul>
                <ul class="list">
                    <li><a href="<c:url value="/admin/home"/>">login</a></li>
                    <li><a href="<c:url value="/logout"/>">logout</a></li>
                    <li>
<!--                        <div class="cart">
                            <a href="#" > CART</a>
                            <span> <c:out value="${sessionScope.myCartNum}"/></span>
                        </div>
                        <ul class="sub-icon1 list">
                            <h3>Recently added items (<c:out value="${sessionScope.myCartNum}"/>)</h3>
                            <div class="shopping_cart">
                                <c:forEach var="map" items="${sessionScope.myCartItems}">
                                    <div class="cart_box">
                                        <div class="message">
                                            <div class="alert-close"> </div> 
                                            <div class="list_img"><img src="${pageContext.request.contextPath}/resources/pages/images/14.jpg" class="img-responsive" alt=""></div>
                                            <div class="list_desc"><h4><a href="#"><c:out value="${map.value.product.name}"/></a></h4><c:out value="${map.value.quantity}"/> x
                                                $<c:out value="${map.value.product.price}"/> = <span class="actual"> $<c:out value="${map.value.quantity * map.value.product.productPrice}"/></span></div>
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="total">
                                <div class="total_left">Total: </div>
                                <div class="total_right">$<c:out value="${sessionScope.myCartTotal}"/></div>
                                <div class="clearfix"> </div>
                            </div>
                            <div class="login_buttons">
                                <div class="check_button"><a href="checkout.html">Check out</a></div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="clearfix"></div>
                        </ul>
                    </li>-->

                </ul>
            </div>
        </div>					
    </div>
    <nav class="navbar navbar-expand-lg  navbar-light">
        <div class="container">
            <a class="navbar-brand" href="<c:url value="/home"/>">
                <img src="<c:url value="/resources/img/logo.png"/>" alt="">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end align-items-center" id="navbarSupportedContent">
                <ul class="navbar-nav">
                    <li><a href="<c:url value="/home"/>">Home</a></li>
                    <li><a href="<c:url value="/product/category"/>">Category</a></li>
                    <li><a href="#new">New</a></li>

                    <li><a href="#latest">About Us</a></li>
                    <!-- Dropdown -->
                    <li class="dropdown">
                        <a class="dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                            Pages
                        </a>
                        <div class="dropdown-menu">

                            <a class="dropdown-item" href="/product/detail">Single</a>
                            <a class="dropdown-item" href="<c:url value="/cart/cart"/>">Cart</a>
                            <a class="dropdown-item" href="<c:url value="/checkout/checkout"/>">Checkout</a>
                            <a class="dropdown-item" href="confermation.html">Confermation</a>
                            <a class="dropdown-item" href="login.html">Login</a>
                            <a class="dropdown-item" href="tracking.html">Tracking</a>
                            <a class="dropdown-item" href="generic.html">Generic</a>
                            <a class="dropdown-item" href="elements.html">Elements</a>
                        </div>
                    </li>									
                </ul>
            </div>					
        </div>
    </nav>
</header>
