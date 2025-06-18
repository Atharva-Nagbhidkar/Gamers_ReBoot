<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/navbar.jsp" %>
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
                    <!-- Left side animation -->
                    <div class="registration-image">
                        <lottie-player
                            src="${pageContext.request.contextPath}/animations/register.json"
                            background="transparent"
                            speed="1"
                            style="width: 450px; height: 450px;"
                            autoplay>
                        </lottie-player>
                    </div>

                    <!-- Right side registration form -->
                    <div class="registration-form">
                        <h1 class="main-heading-rf"><span class="animated-username" >Create</span> a new account</h1>

                        <form action="register" method="post">
                            <div>
                                <label>Username</label>
                                <input
                                    type="text"
                                    name="username"
                                    placeholder="username"
                                    required
                                    autocomplete="off" />
                            </div>

                            <div>
                                <label>Email</label>
                                <input
                                    type="email"
                                    name="email"
                                    placeholder="email"
                                    required
                                    autocomplete="off" />
                            </div>

                            <div>
                                <label>Phone</label>
                                <input
                                    type="number"
                                    name="phone"
                                    placeholder="phone"
                                    required
                                    autocomplete="off" />
                            </div>

                            <div>
                                <label>Password</label>
                                <input
                                    type="password"
                                    name="password"
                                    placeholder="password"
                                    required
                                    autocomplete="off" />
                            </div>

                            <br />
                            <button type="submit" class="btn-submit">Sign Up</button>
                        </form>
                    </div>
                </div>
            </div>
        </main>
    </section>

    <jsp:include page="Footer.jsp" />
</body>
</html>