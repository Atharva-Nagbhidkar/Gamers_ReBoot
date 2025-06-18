<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gamers ReBoot</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<a href="/store" class="close-btn" title="Back to Store">X</a>
	<c:if test="${not empty toastMessage}">
	    <div class="toast show" id="toast">${toastMessage}</div>
	</c:if>
	
	<script>
	    window.onload = function () {
	        var toast = document.getElementById("toast");
	        if (toast) {
	            setTimeout(function () {
	                toast.classList.remove("show");
	            }, 1000);
	        }
	    };
	</script>
	
	<c:choose>
	    <c:when test="${not empty cart}">
	        <section class="admin-users-section">
	                <h1 align="center" style="margin-top: 50px;"><span class="animated-username" >ReBoot</span> Cart</h1>
	            <div class="container admin-users">
	                <table>
	                    <tbody>
	                        <c:forEach var="ct" items="${cart}">
	                            <tr>
	                            	<td><img src="/images/${ct.filename}" alt="${ct.game}" width="80" height="110" /></td>
	                                <td><h3 align="left">${ct.game}</h3>
	                                	<p align="left">${ct.genre}</p>
	                                	<p>&nbsp;</p>
	                                	<p align="left">
	                                		<a class="btn" href="cartdelete?id=${ct.id}">Remove</a>
	                                	</p>
	                                </td>
	                                <td>${ct.publisher}</td>
	                                <td></td>
	                                <td><p><strong>${ct.price}</strong></p></td>
	                            </tr>
	                        </c:forEach>
	                        <tr>
						        <td></td>
						        <td></td>
						        <td></td>
						        <td><strong><h3>Total:</h3></strong></td>
						        <td><strong><h3>$ <fmt:formatNumber value="${totalPrice}" type="number" minFractionDigits="2" maxFractionDigits="2" /></h3></strong></td>
						    </tr>
	                    </tbody>
	                    <tfoot>						    
						</tfoot>
	                </table>
	            </div>
	        </section>
	        <form action="payment" method="post" align="center">
               <input type="hidden" name="username" value="${loggedInUser.username}" />
               <div class="btns" align="center">
		            <a href="/payment">Checkout</a>
	            </div> 
           </form>
	    </c:when>
	    <c:otherwise>
	        <section id="error-page">
		    <div class="content">
		        <h1 align="center" style="margin-top: 40px;"><span class="animated-username" style="margin-top: 50px;">Cart Empty</span></h1>
		        <p>Shop now from our exciting collection of games !!</p>
		        <div class="btns">
		            <a href="/store">Shop Now</a>
		        </div> 
		    </div>       
		</section>
	    </c:otherwise>
	</c:choose>
</body>
</html>