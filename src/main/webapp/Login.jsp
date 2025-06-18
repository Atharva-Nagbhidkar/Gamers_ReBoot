<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

<!-- Login Section -->
<section>
    <main>
        <div class="section-registration">
            <div class="container grid grid-two-cols">

                <!-- Animation -->
                <div class="registration-image">
                    <lottie-player
                        src="${pageContext.request.contextPath}/animations/login.json"
                        background="transparent"
                        speed="1"
                        style="width: 500px; height: 600px;"
                        loop
                        autoplay>
                    </lottie-player>
                </div>

                <!-- Login Form -->
                <div class="registration-form">
                    <h1 class="main-heading-rf"><span class="animated-username" >Log in</span> to your account</h1>

                    <form action="login" method="post">
                        <div>
                            <label>Email</label>
                            <input
                                type="text"
                                name="email"
                                placeholder="email"
                                id="email"
                                required
                                autocomplete="off"
                            />
                        </div>

                        <div>
                            <label>Password</label>
                            <input
                                type="password"
                                name="password"
                                placeholder="password"
                                id="password"
                                required
                                autocomplete="off"
                            />
                        </div>

                        <br />
                        <button type="submit" class="btn-submit">Login</button>
                        <br /><br /><br />

                        <div class="btn-submit">
                            <h4>
                                Don't have an account ?&nbsp;&nbsp;
                                <a href="/register">Sign Up</a>
                            </h4>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </main>
</section>

<jsp:include page="Footer.jsp" />
</body>
</html>