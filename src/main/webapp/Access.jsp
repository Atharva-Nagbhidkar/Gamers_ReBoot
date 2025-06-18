<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gamers ReBoot</title>
  <link rel="stylesheet" href="resources/css/style.css">
  <script src="${pageContext.request.contextPath}/js/lottie-player.js"></script>
</head>
<body>
	<section id="error-page">
	    <div class="content">
	        <h1 align="center" style="margin-top: 40px;"><span class="animated-username" >Access Denied</span></h1>
	        <p>You don't have privileges to access Admin Dashboard</p>
	        <div class="btns">
	            <a href="/">Return Home</a>
	        </div> 
	    </div>       
	</section>
</body>
</html>