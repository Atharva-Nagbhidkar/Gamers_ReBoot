<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gamers ReBoot - Admin</title>
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

    <section id="error-page">
	    <div class="content">
	        <h1 align="center" style="margin-top: 40px;"><span class="animated-username" >Welcome Admin</span></h1>
	        <p>This is Admin Dashboard. You can access the following: </p>
	        <div class="btns">
	            <a href="/adminuser">User Data</a>
	            <a href="/admincontact">Contact Data</a>
	            <a href="/">Return Home</a>
	        </div> 
	    </div>
	    </section><br><br>

    <c:choose>
        <c:when test="${not empty users}">
            <section class="admin-users-section">
                <h1 align="center">User Data</h1>
                <div class="container admin-users">
                    <table>
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="cu" items="${users}">
                                <tr>
                                    <td>${cu.username}</td>
                                    <td>${cu.email}</td>
                                    <td>${cu.phone}</td>
                                    <td><a class="btn" href="adminedit?email=${cu.email}">Edit</a></td>
                                    <td><a class="btn" href="admindelete?email=${cu.email}">Delete</a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </section>
        </c:when>
        <c:otherwise>
            <h2 align="center">No users found</h2>
        </c:otherwise>
    </c:choose>

</body>
</html>