<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gamers ReBoot - Admin</title>
    <link rel="stylesheet" href="resources/css/style.css">
</head>
<body>
    <header>
        <div class="container">
            <div class="logo-brand">
                <nav>
                    <ul>
                        <li><a href="/adminuser">Back</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </header>
    <section>
        <main>
            <div class="section-registration">
                <div class="container grid grid-two-cols">
                    <div class="registration-form">
                        <h1 class="main-heading-rf">Update User Data</h1>
                        <form action="adminupdate" method="post">
                            <div>
                                <label>Username</label>
                                <input
                                    type="text"
                                    name="username"
                                    placeholder="username"
                                    id="username"
                                    required
                                    autoComplete="off"
                                    value="${user.username}"
                                />
                            </div>
                            
                            <div>
                                <label>Email</label>
                                <input
                                    type="email"
                                    name="email"
                                    placeholder="email"
                                    id="email"
                                    required
                                    autoComplete="off"
                                    value="${user.email}"
                                    readonly
                                />
                            </div>

                            <div>
                                <label>Phone</label>
                                <input
                                    type="tel"
                                    name="phone"
                                    placeholder="phone"
                                    id="phone"
                                    required
                                    autoComplete="off"
                                    value="${user.phone}"
                                />
                            </div>

                            <div>
                                <button type="submit" class="btn">Update</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </main>
    </section>
</body>
</html>