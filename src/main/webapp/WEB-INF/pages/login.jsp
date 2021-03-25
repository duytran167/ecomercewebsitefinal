<%-- 
    Document   : login
    Created on : Jun 20, 2019, 8:17:26 PM
    Author     : AnhLe
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
        <!-- Start My Account -->
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="login-form">
                        <h3 class="billing-title text-center">Login</h3>
                        <!-- /login?error=true -->
                        <c:if test="${message != null && message != ''}">
                            <p style="color: red">${message}</p>
                        </c:if>
                        <p class="text-center mt-80 mb-40">Welcome back! Sign in to your account </p>
                        <form action="<c:url value="j_spring_security_check"/>" method="post">
                            <input name="username" type="email" placeholder="Username or Email*" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Username or Email*'" required class="common-input mt-20">
                            <input name="password" type="password" placeholder="Password*" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password*'" required class="common-input mt-20">
                            <button type="submit" value="login" class="view-btn color-2 mt-20 w-100"><span>Login</span></button>
                            <div class="mt-20 d-flex align-items-center justify-content-between">
                                <div class="d-flex align-items-center"><input type="checkbox" class="pixel-checkbox" id="login-1"><label for="login-1">Remember me</label></div>
                                <a href="#">Lost your password?</a>
                            </div>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </form>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="register-form">
                        <h3 class="billing-title text-center">Register</h3>
                        <p class="text-center mt-40 mb-30">Create your very own account </p>
                        <form action="#">
                            <input type="text" placeholder="Full name*" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Full name*'" required class="common-input mt-20">
                            <input type="email" placeholder="Email address*" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email address*'" required class="common-input mt-20">
                            <input type="text" placeholder="Phone number*" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Phone number*'" required class="common-input mt-20">
                            <input type="text" placeholder="Username*" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Username*'" required class="common-input mt-20">
                            <input type="password" placeholder="Password*" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password*'" required class="common-input mt-20">
                            <button class="view-btn color-2 mt-20 w-100"><span>Register</span></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- End My Account -->
        
        
               
        <!-- End Most Search Product Area -->
        <!-- Footer--->
        <jsp:include page="include/footer.jsp"/>
        <jsp:include page="include/js-page.jsp"/>
    </body>
</html>
