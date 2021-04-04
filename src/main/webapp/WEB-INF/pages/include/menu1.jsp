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
                    
                </ul>
                <ul class="list">
                    <% if (session.getAttribute("users") != null) { %>
                            <div class="user_box ml-auto">
                                <li> <div class="user_box_login user_box_link"><a href="${pageContext.request.contextPath}/account/${users.id}">${users.username}</a></div></li>
                                <li>  <div class="user_box_register user_box_link"><a href="<c:url value="/logout" />">logout</a></li>
                            </div>
                            <% } else { %>
                            <div class="user_box ml-auto">
                                <li><div class="user_box_login user_box_link"><a href="${pageContext.request.contextPath}/login">login</a></div></li>
                               <li> <div class="user_box_register user_box_link"><a href="${pageContext.request.contextPath}/register/register_log">register</a></div></li>
                            </div>
                            <% }%>
                   


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
                            <a class="dropdown-item" href="<c:url value="/order/cart"/>">Cart</a>
                            <a class="dropdown-item" href="<c:url value="/checkout/checkout"/>">Checkout</a>
                            <a class="dropdown-item" href="confermation.html">Confermation</a>
                            <a class="dropdown-item" href="login.html">Login</a>
                            <a class="dropdown-item" href="tracking.html">Tracking</a>
                            
                        </div>
                    </li>									
                </ul>
            </div>					
        </div>
    </nav>
</header>
