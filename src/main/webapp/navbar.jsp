<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gamers ReBoot</title>
</head>
<body>
    <header>
        <div class="container">
            <div class="logo-brand">
                <nav>
                    <ul>
                        <li><a href="/">Home</a></li>
                        <li><a href="/about">About</a></li>
                        <li><a href="/contact">Contact</a></li>
                        <li><a href="/store">Store</a></li>

                        <c:choose>
                            <c:when test="${not empty loggedInUser}">
                                <li><a href="/cart">My Cart</a></li>
                                <li><a href="/logout">Logout</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="/login">Login</a></li>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${not empty loggedInUser and loggedInUser.isadmin == 'true'}">
                                <li><a href="/admin">Admin Dashboard</a></li>
                            </c:when>
                        </c:choose>
                    </ul>
                </nav>
            </div>
        </div>
    </header>
</body>
</html>