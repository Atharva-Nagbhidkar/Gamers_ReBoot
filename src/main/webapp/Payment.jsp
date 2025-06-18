<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gamers ReBoot</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
	<div class="toast" id="toast">${toastMessage}</div>
    <script>
        window.onload = function () {
            var toast = document.getElementById("toast");
            if (toast.textContent.trim().length > 0) {
                toast.classList.add("show");
                setTimeout(function () {
                    toast.classList.remove("show");
                }, 3000);
            }
        };
    </script>
	
	<div class="payment-container">
	    <h2>Payment Gateway</h2>
	
	    <form action="payment" method="post">
	        <label>Card Number:</label>
	        <input type="text" name="cardNumber" placeholder="4242 4242 4242 4242" required />
	
	        <label>Card Holder Name:</label>
	        <input type="text" name="cardName" placeholder="Elbert Oliver" required />
	
	        <label>Expiry Date:</label>
	        <input type="month" name="expiry" required />
	
	        <label>CVV:</label>
	        <input type="password" name="cvv" placeholder="257" required />
	
	        <button type="submit">
	            Pay $<fmt:formatNumber value="${totalPrice}" type="number" minFractionDigits="2" maxFractionDigits="2" />
	        </button>
	    </form>
	</div>
</body>
</html>