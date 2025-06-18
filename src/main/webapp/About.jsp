<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <!-- Hero Section -->
    <section class="section-hero">
        <div class="container grid grid-two-cols">
            <div class="hero-content">
                <h1><span class="animated-username" >About</span> Gamers ReBoot</h1>
                <p>"Your Ultimate Gaming Destination"</p>
                <p>
                    Welcome to Gamers Stop, where we strive to provide gamers of all levels with the ultimate gaming experience.
                    Our platform offers a wide range of games, from classic favorites to the latest releases, across all major platforms.
                </p>
                <p>
                    Our mission is to create a vibrant and inclusive gaming community where players can connect, explore, and enjoy their favorite games together.
                    Whether you're a casual player looking for some fun or a hardcore enthusiast seeking new challenges, Gamer's Stop has something for everyone.
                </p>
                <p>
                    Join us today and embark on an exciting gaming adventure!
                </p>
                <c:choose>
                    <c:when test="${not empty loggedInUser}">
                        <p>
                            Welcome back, ${loggedInUser.username}!<br/><br/>
                            <a href="/store">
                                <button class="btn">Browse Games</button>
                            </a>
                        </p>
                    </c:when>
                    <c:otherwise>
                        <p>
                            Sign up or log in to unlock exclusive features and rewards!<br/><br/>
                            <a href="/register">
                                <button class="btn">Sign Up</button>
                            </a>
                        </p>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="hero-image">
                <lottie-player
                    src="${pageContext.request.contextPath}/animations/about.json"
                    background="transparent"
                    speed="1"
                    style="width: 550px; height: 550px;"
                    loop
                    autoplay>
                </lottie-player>
            </div>
        </div>
    </section>

    <!-- History Section -->
    <section class="section-history">
        <h2>Our History</h2>
        <div class="container">
            <p>
                Gamer's Stop was founded in 2023 by a team of passionate gamers who wanted to create a dedicated platform for gamers around the world.
                Since then, we have grown into one of the leading gaming communities, serving millions of players worldwide.
                Over the years, we have expanded our collection to include thousands of games across various genres, ensuring that there is something for every type of gamer.
                We are committed to staying at the forefront of the gaming industry, constantly updating our platform with the latest releases and innovations.
                Our journey has been marked by milestones and achievements, but our core values remain unchanged - to provide gamers with a safe, inclusive, and enjoyable gaming experience.
            </p>
        </div>

        <!-- Mission Section -->
        <h2>Our Mission</h2>
        <div class="container">
            <p>
                At Gamer's Stop, our mission is simple - to be the ultimate destination for gamers worldwide.
                We are dedicated to providing a diverse and inclusive gaming community where players of all backgrounds can come together to connect, compete, and have fun.
                We are committed to offering a wide range of games, from classic titles to the latest releases, ensuring that there is something for everyone.
                Our goal is to create a welcoming environment where players can explore new worlds, embark on epic adventures, and forge lasting friendships.
                Whether you're a casual player or a hardcore enthusiast, Gamer's Stop is here to support your gaming journey every step of the way.
            </p>
        </div>

        <!-- Team Section -->
        <h2>Meet the Team</h2>
        <div class="container">
            <div class="team-grid">
                <div class="team-member">
                    <img src="/images/team1.webp" alt="Team Member 1" height="100" width="100" />
                    <h3>John Doe</h3>
                    <p>Founder & CEO</p>
                </div>
                <div class="team-member">
                    <img src="/images/team2.png" alt="Team Member 2" />
                    <h3>Jane Smith</h3>
                    <p>Head of Operations</p>
                </div>
                <div class="team-member">
                    <img src="/images/team3.png" alt="Team Member 3" />
                    <h3>Mike Johnson</h3>
                    <p>Lead Developer</p>
                </div>
                <div class="team-member">
                    <img src="/images/team4.png" alt="Team Member 4" />
                    <h3>Sarah Williams</h3>
                    <p>Marketing Manager</p>
                </div>
            </div>
        </div>

        <!-- Contact Section -->
        <h2>Get in Touch</h2>
        <div class="btn btn-group">
            <p>
                Have questions or feedback? Contact us today!
                <a href="/contact">
                    <button class="btn secondary-btn">Contact Us</button>
                </a>
            </p>
        </div>
    </section>

    <jsp:include page="Footer.jsp" />
</body>
</html>