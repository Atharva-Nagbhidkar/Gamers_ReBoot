<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/navbar.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gamers ReBoot</title>
    <link rel="stylesheet" href="resources/css/style.css">
</head>
<body>
	<section class="section-services">
	    <h1 align="center"><span class="animated-username" >ReBoot</span> Store</h1>
	    <div class="container">
	        <div class="grid grid-three-cols">
	            <c:forEach var="s" items="${service}">
	                <div class="card">
	                    <div class="card-img">
	                        <img src="/images/${s.filename}" alt="${s.game}" width="100" height="100" />
	                    </div>
	                    <div class="card-details">
	                        <h2>${s.game}</h2>
	                        <p class="para">Publisher: <strong>${s.publisher}</strong></p>
	                        <p class="para">Genre: <strong>${s.genre}</strong></p>
	                        <p class="para">Price: <strong>${s.price}</strong></p>
	                        <br><br>
	                        <form action="cartedit" method="post" align="center">
	                            <input type="hidden" name="game" value="${s.game}" />
	                            <button type="submit" class="btn-submit">Buy Now</button>
	                        </form>
	                    </div>
	                </div>
	            </c:forEach>
	        </div>
	    </div>
	</section>
</body>
</html>