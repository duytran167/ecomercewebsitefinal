<%-- 
    Document   : payment
    Created on : Mar 31, 2021, 10:47:55 AM
    Author     : PC
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <title>Payment</title>
        <jsp:include page="include/css-page.jsp" />
        <style>
        .accordion {
            background-color: #eee;
            color: #444;
            cursor: pointer;
            padding: 18px;
            width: 100%;
            border: none;
            text-align: left;
            outline: none;
            font-size: 15px;
            transition: 0.4s;
        }

        .active, .accordion:hover {
            background-color: #ccc;
        }

        .panel {
            padding: 0 18px;
            background-color: white;
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.2s ease-out;
        }
    </style>
        

    <body>
        <!-- Start Header Area -->
        <jsp:include page="include/menu1.jsp" />
        <section class="banner-area organic-breadcrumb">
            <div class="container">
                <div class="breadcrumb-banner d-flex flex-wrap align-items-center">
                    <div class="col-first">
                        <h1>All Products</h1>
                        <nav class="d-flex align-items-center justify-content-start">
                            <a href="index.html">Home<i class="fa fa-caret-right" aria-hidden="true"></i></a>
                            <a href="category.html">Payment</a>
                        </nav>
                    </div>
                </div>
            </div>
        </section>

        <div class="site-wrap" style="background-color: whitesmoke;">
            <div class="site-section">
                <div class="container">
                    <div class="row">
                        <div class="col-md-5 mb-5 mb-md-0"> 
                            <!-- infor of product-->
                            <div class="p-3 p-lg-5 border">


                            <table class="table site-block-order-table mb-5">

                                <tbody>
                                    <tr>
                                        <td>Customer Name</td>
                                        <td>${users.username}</td>
                                    </tr>
                                    <tr>
                                        <td>Customer Address</td>
                                        <td>${users.address}</td>
                                    </tr>
                                    <tr>
                                        <td>Customer PhoneNumber</td>
                                        <td>${users.phoneNumber}</td>
                                    </tr>

                                    <c:set var="total" value="${0}"></c:set>
                                    <c:set var="totalCart" value="${0}"></c:set>
                                    <c:forEach var="cart" items="${cart.orderDetailsList}">
                                        <c:set var="total" value="${cart.quantity * cart.product.price}"></c:set>
                                        <c:set var="totalCart" value="${totalCart + total}"></c:set>
                                        <c:set var="totalShip" value="30000"></c:set>
                                        <c:set var="totalCartShip" value="${totalCart + totalShip}"></c:set>
                                            <tr>
                                                <td>Room Type</td>
                                                <td>${cart.product.name}</td>
                                        </tr>
                                        <tr>
                                            <td>Price</td>
                                            <td>${cart.product.price}</td>
                                        </tr>
                                        <tr>
                                            <td>Size</td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>Total</td>
                                            <td>${total}</td>
                                        </tr>
                                    </c:forEach>
                                    <tr>
                                        <td class="text-black font-weight-bold">Ship</td>
                                        <td class="text-black font-weight-bold">${totalShip}</td>
                                    </tr>
                                    <tr>
                                        <td class="text-black font-weight-bold"><strong>Order Total</strong></td>
                                        <td class="text-black font-weight-bold"><strong>${totalCartShip}</strong></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-md-5 mb-5 mb-md-0">
                        <div class="p-3 p-lg-5 border">
                            Payment Type
                            <form action="order" method="post" style="width: 100%;" >
                                <button class="accordion" type="button">Credit Card</button>
                                <div class="panel">
                                    <div class="form-group row">
                                        <div class="col-md-12">
                                            <label class="text-black">Card Name <span
                                                    class="text-danger">*</span></label>
                                            <input type="text" name="cardholdersName" class="form-control" value="${creditCart.cardholdersName}"/>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-md-12">
                                            <label class="text-black">Card Number <span
                                                    class="text-danger">*</span></label>
                                            <input type="text" name="creditCardNumber"  class="form-control" value="${creditCart.creditCardNumber}"/>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-md-6">
                                            <label for="phone" class="text-black">Exp <span class="text-danger">*</span></label>
                                            <input type="date" name="expirationDate"  class="form-control" value="${creditCart.expirationDate}"/>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="email" class="text-black">CVV<span class="text-danger">*</span></label>
                                            <input type="password" name="cvv"  class="form-control"/>
                                        </div>
                                    </div>

                                </div>
                                <div style="color: red;"></div>
                                <div class="checkbox">
                                    <label><input type="checkbox" value="">Cash On Delivery</label>
                                </div>
                        </div>
                        <input class="btn btn-primary genric-btn success  btn-block" type="submit" value="order">
                    </div>
                        </form>
                        
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="include/footer.jsp"/>
        <jsp:include page="include/js-page.jsp"/>
        <script>
            var acc = document.getElementsByClassName("accordion");
            var i;

            for (i = 0; i < acc.length; i++) {
                acc[i].addEventListener("click", function () {
                    this.classList.toggle("active");
                    var panel = this.nextElementSibling;
                    if (panel.style.maxHeight) {
                        panel.style.maxHeight = null;
                    } else {
                        panel.style.maxHeight = panel.scrollHeight + "px";
                    }
                });
            }
        </script>
    </body>
</html>
