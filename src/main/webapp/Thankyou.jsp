<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gamers ReBoot</title>
    <link rel="stylesheet" href="resources/css/style.css">
    <script src="${pageContext.request.contextPath}/js/lottie-player.js"></script>
</head>
<body>	
	<section id="thankyou-page">
	    <div class="content" style="display: flex; flex-direction: column; align-items: center; justify-content: center; text-align: center;">
	        <lottie-player
	            src="${pageContext.request.contextPath}/animations/thankyou.json"
	            background="transparent"
	            speed="1"
	            style="width: 200px; height: 200px;"
	            autoplay>
	        </lottie-player>
	
	        <h4 class="header">Thanks for shopping!</h4>
	        <p>Your purchase was successful. We hope you enjoy your new games!</p>
	        <p>Please share your feedback to help us improve.</p>
	
	        <div class="btns">
	            <a href="/" class="btn">Continue Shopping</a>
	            <a href="/contact" class="btn">Share Feedback</a>
	        </div> 
	    </div>       
	</section>
</body>
</html>