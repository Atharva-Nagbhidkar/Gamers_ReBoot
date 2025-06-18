# 🎮 Gamers ReBoot

**Gamers ReBoot** is a full-stack web application built using Spring Boot. The platform offers a secure, feature-rich experience for users to browse and buy games, with a gamer-themed UI and robust backend architecture.

---

## 🚀 Features

### 🔐 Authentication & Authorisation

- **User Registration & Login**: Users can sign up and log in securely.
- **JWT Authentication**: User sessions are managed using JSON Web Tokens (JWT).
- **Role-Based Access**: Admin and user roles with restricted access where appropriate.
- **Spring Security**: Ensures strong authentication and authorisation mechanisms.

### 🛒 Shopping & Payment

- **Cart Functionality**: Users can add, remove, and view games in a shopping cart.
- **Dummy Payment Gateway**: Simulated checkout process to complete purchases.

### 🎨 UI & UX Enhancements

- **RGB Gradient Styling**: A gamer-centric UI with vibrant visuals.
- **Toast Messages**: Real-time feedback for actions like login, cart updates, and errors.

### 📄 MVC Architecture

- **Spring MVC with JSP Views**: Follows the Model-View-Controller pattern using JSP for server-side rendering.
- **Structured Navigation**: Clean routing and logical component separation.

### 🗃️ Admin Panel

- **Game Management**: Admins can add, edit, and delete game entries.
- **Access Control**: Unauthorised users attempting admin access are blocked.
- **User Overview**: Admins can monitor user activity and control data.

---

## 🛠️ Tech Stack

- **Backend**: Spring Boot, Spring Security, JWT, Hibernate (JPA)
- **Frontend**: JSP, HTML, CSS, JavaScript
- **Database**: MySQL
- **Build Tool**: Maven

---

## ⚙️ Getting Started

To get a local copy up and running, follow these simple steps:

### ✅ Prerequisites

- Java 17+
- Maven
- MySQL

### 📦 Installation

1. Clone the repo:
   ```bash
   git clone https://github.com/Atharva-Nagbhidkar/Gamers_ReBoot.git
   cd Gamers_ReBoot
   ```
2. Build and run the application:
   ```bash
   mvn spring-boot:run
   ```

---

## 🌐 Usage

1. Open your browser and go to:  
   `http://localhost:8080`

2. Register as a new user or log in.

3. Explore the features:  
   - Browse and add games to your cart  
   - Proceed to dummy checkout  
   - Admins can manage game listings and users

---

## 📄 License

This project is licensed under the [MIT License](./LICENSE).  
© 2025 [Atharva Nagbhidkar](https://github.com/Atharva-Nagbhidkar)