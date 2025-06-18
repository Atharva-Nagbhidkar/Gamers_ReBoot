<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ include file="/navbar.jsp" %>
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

    <!-- Hero Section -->
    <section class="section-hero">
        <div class="container grid grid-two-cols">
            <div class="hero-content">
                <h1>
                    Welcome to Gamers ReBoot
                    <c:choose>
                        <c:when test="${not empty loggedInUser}">
                            <span class="animated-username">${loggedInUser.username}</span>
                        </c:when>
                        <c:otherwise>
                            Guest
                        </c:otherwise>
                    </c:choose>
                </h1>
                <p>"Your Ultimate Gaming Destination"</p>
                <p>
                    Gamers Stop is your ultimate destination for everything gaming.
                    Whether you’re a casual player or a hardcore enthusiast, we have something for everyone.
                    Our extensive collection features the latest releases, classic favorites,
                    and exclusive titles across all major platforms.
                </p>
                <div class="btn btn-group">
                    <a href="/about">
                        <button class="btn">About Us</button>
                    </a>
                    <a href="/store">
                        <button class="btn secondary-btn">Browse Games</button>
                    </a>
                </div>
            </div>
            <div class="hero-image">
                <lottie-player
                    src="${pageContext.request.contextPath}/animations/home.json"
                    background="transparent"
                    speed="1"
                    style="width: 600px; height: 400px;"
                    loop
                    autoplay>
                </lottie-player>
            </div>
        </div>
    </section>

    <!-- Featured Games Section -->
    <section class="section-history">
        <h2>Featured Games</h2>
        <div class="container horizontal-scroll">
            <c:forEach var="s" items="${service}">
                <div class="card">  
                    <div class="card-img" align="center">
                        <img src="/images/${s.filename}" alt="${s.game}" width="100" height="100" /><br><br>
                    </div>
                    <div class="card-img">
                        <h3>${s.game}</h3><br><br/>
                        <a href="/store">
                            <button class="btn">Learn More</button>
                        </a><br/><br/>
                    </div>
                </div>
            </c:forEach>
        </div>
    </section>

    <!-- Testimonials Section -->
    <section class="section-testimonials">
        <h2>What Our Customers Say</h2>
        <div class="container">
            <div class="testimonials-wrapper">
                <!-- Testimonial cards -->
                <div class="testimonial">
                    <p>"A wonderful experience, highly recommend!"</p>
                    <p>- Alice Johnson</p>
                </div>
                <div class="testimonial">
                    <p>"Exceptional service and quality."</p>
                    <p>- Bob Brown</p>
                </div>
                <div class="testimonial">
                    <p>"Will definitely return for future purchases."</p>
                    <p>- Mary Davis</p>
                </div>
                <div class="testimonial">
                    <p>"Five stars, couldn't be happier!"</p>
                    <p>- Steve Wilson</p>
                </div>
                <div class="testimonial">
                    <p>"Amazing products, great customer service!"</p>
                    <p>- Emma Clark</p>
                </div>
                <div class="testimonial">
                    <p>"Highly professional and friendly staff."</p>
                    <p>- Liam Martinez</p>
                </div>
                <div class="testimonial">
                    <p>"Absolutely love it, would buy again."</p>
                    <p>- Olivia Garcia</p>
                </div>
                <div class="testimonial">
                    <p>"Top-notch quality and fast delivery."</p>
                    <p>- Noah Rodriguez</p>
                </div>
                <div class="testimonial">
                    <p>"Exceeded my expectations in every way."</p>
                    <p>- Sophia Hernandez</p>
                </div>
            </div>
        </div>
    </section>
</body>
<jsp:include page="Footer.jsp" />
</html>