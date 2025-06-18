<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/navbar.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gamers ReBoot</title>
    <link rel="stylesheet" href="resources/css/style.css">
	<script src="${pageContext.request.contextPath}/js/lottie-player.js"></script></head>
<body>
    <!-- Toast container -->
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

    <section>
        <main>
            <div class="section-registration">
                <div class="container grid grid-two-cols">
                    <div class="registration-image">
                        <lottie-player
                            src="${pageContext.request.contextPath}/animations/contact.json"
                            background="transparent"
                            speed="1"
                            style="width: 500px; height: 300px;"
                            autoplay>
                        </lottie-player>
                    </div>
                    <div class="registration-form">
                        <h1 class="main-heading-rf">Share your <span class="animated-username" >feedback</span></h1>
                        <form action="contact" method="post">

                            <div>
                                <label>Username</label>
                                <input
                                    type="text"
                                    name="username"
                                    placeholder="username"
                                    required
                                    autocomplete="off"
                                    value="${not empty loggedInUser ? loggedInUser.username : ''}"
                                />
                            </div>

                            <div>
                                <label>Email</label>
                                <input
                                    type="text"
                                    name="email"
                                    placeholder="email"
                                    id="email"
                                    required
                                    autocomplete="off"
                                    value="${not empty loggedInUser ? loggedInUser.email : ''}"
                                />
                            </div>

                            <div>
                                <label for="message">Message</label>
                                <textarea
                                    cols="54"
                                    rows="7"
                                    name="message"
                                    id="message"
                                    placeholder="Enter your message"
                                    required
                                    autocomplete="off"
                                ></textarea>
                            </div>

                            <br />
                            <button type="submit" class="btn-submit">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </main>
    </section>

    <jsp:include page="Footer.jsp" />
</body>
</html>