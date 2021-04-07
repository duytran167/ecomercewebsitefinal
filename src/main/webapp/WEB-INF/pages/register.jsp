<%-- 
    Document   : register
    Created on : Apr 2, 2021, 2:42:09 PM
    Author     : PC
--%>

<%-- 
    Document   : login
    Created on : Jun 20, 2019, 8:17:26 PM
    Author     : AnhLe
--%>

<%@ taglib uri="http://www.springframework.org/tags/form"
           prefix="mvc" %>
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
                    <div class="register-form">
                        <h3 class="billing-title text-center">Register</h3>
                        <p class="text-center mt-40 mb-30">Create your very own account </p>
                        
                        <mvc:form modelAttribute="users" action="register_profile" method="post" class="register-form" id="register-form" onsubmit ="return validateForm()" >
                            <div class="form-group">
                                
                                    <mvc:input name="fullName" class="common-input mt-20" type="text" path="fullName" id="fullName" placeholder="Full name*" onfocus="this.placeholder=''" onblur="this.placeholder = 'Full name*'"  cssErrorClass="formFieldError" />
                                    <mvc:errors path="fullName" />
                            </div>
                            <div class="form-group">
                                
                                
                                    <mvc:input name="username" class="common-input mt-20" type="text" path="username" id="username" placeholder="Username*" onfocus="this.placeholder=''" onblur="this.placeholder = 'Username*'"  cssErrorClass="formFieldError" />
                                    <mvc:errors path="username" />
                            </div>
                            <div class="form-group">
                                
                                
                                    <mvc:input name="email" class="common-input mt-20" type="text"   path="email" id="email" onfocus="this.placeholder=''" onblur="this.placeholder = 'Email*'" placeholder="Email*" cssErrorClass="formFieldError" />
                                    <mvc:errors path="email" />
                            </div>
                            <div class="form-group">
                                
                                    <mvc:input name="address" class="common-input mt-20" type="text"   path="address" id="address" placeholder="Address*" cssErrorClass="formFieldError" />
                                    <mvc:errors path="address" />
                            </div>
                            <div class="form-group">
                                
                                    <mvc:input name="phoneNumber" class="common-input mt-20" type="text"   path="phoneNumber" id="phoneNumber" placeholder="Phone Number*" cssErrorClass="formFieldError" />
                                    <mvc:errors path="phoneNumber" />
                            </div>
                            <div class="form-group">
                                
                                    <mvc:input name="password" class="common-input mt-20" type="password"   path="password" id="password" placeholder="Your password*" cssErrorClass="formFieldError" />
                                    <mvc:errors path="password" />
                            </div>
                            <div class="form-group">
                                
                                    <mvc:input name="passwordConfirm" class="common-input mt-20" type="password" path="passwordConfirm" id="passwordConfirm" placeholder="Repeat your password*" cssErrorClass="formFieldError" />
                                    <mvc:errors path="passwordConfirm" />
                            </div>    
                            <c:if test="${users.getPassword() != users.getPasswordConfirm()}">
                                <div class="form-group">
                                    <p style="color: red;">Password confirm incorrect, please try again!</p>    
                                </div>
                            </c:if>
                            <div class="form-group form-button">
                                <input type="submit" class="view-btn color-2 mt-20 w-100" value="Register" />
                                <a href="<c:url value="/" />" id="signup" class="form-submit ">Cancel</a>
                            </div>
                        </mvc:form>
                        
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

