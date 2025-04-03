<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TravelBookingSystem - Réservez votre prochain voyage</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #1e88e5;
            --accent-color: #ff6d00;
            --text-color: #333;
            --light-color: #fff;
            --hover-effect: all 0.3s ease;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            min-height: 100vh;
            color: var(--text-color);
            overflow-x: hidden;
        }
        
        /* Navbar Styling */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 5%;
            background-color: rgba(255, 255, 255, 0.95);
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
        }
        
        .logo {
            display: flex;
            align-items: center;
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--primary-color);
        }
        
        .logo i {
            margin-right: 0.5rem;
            color: var(--accent-color);
        }
        
        .nav-links {
            display: flex;
            list-style: none;
        }
        
        .nav-links li {
            margin: 0 1rem;
        }
        
        .nav-links a {
            text-decoration: none;
            color: var(--text-color);
            font-weight: 500;
            transition: var(--hover-effect);
            position: relative;
            padding: 0.5rem 0;
        }
        
        .nav-links a:after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            bottom: 0;
            left: 0;
            background-color: var(--primary-color);
            transition: var(--hover-effect);
        }
        
        .nav-links a:hover {
            color: var(--primary-color);
        }
        
        .nav-links a:hover:after {
            width: 100%;
        }
        
        .auth-buttons {
            display: flex;
        }
        
        .btn {
            padding: 0.6rem 1.2rem;
            border-radius: 50px;
            font-weight: 600;
            cursor: pointer;
            transition: var(--hover-effect);
            text-decoration: none;
            margin-left: 1rem;
        }
        
        .btn-outline {
            background: transparent;
            border: 2px solid var(--primary-color);
            color: var(--primary-color);
        }
        
        .btn-outline:hover {
            background: var(--primary-color);
            color: var(--light-color);
            transform: translateY(-3px);
        }
        
        .btn-filled {
            background: var(--accent-color);
            border: 2px solid var(--accent-color);
            color: var(--light-color);
        }
        
        .btn-filled:hover {
            background: #ff8f3c;
            border-color: #ff8f3c;
            transform: translateY(-3px);
            box-shadow: 0 4px 15px rgba(255, 109, 0, 0.3);
        }
        
        /* Hero Section */
        .hero {
            height: 100vh;
            display: flex;
            align-items: center;
            background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('https://images.unsplash.com/photo-1530521954074-e64f6810b32d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1950&q=80');
            background-size: cover;
            background-position: center;
            color: var(--light-color);
            padding: 0 5%;
        }
        
        .hero-content {
            max-width: 650px;
            margin-top: 5rem;
        }
        
        .hero h1 {
            font-size: 3.5rem;
            margin-bottom: 1.5rem;
            font-weight: 700;
            animation: fadeInUp 1s ease;
        }
        
        .hero p {
            font-size: 1.2rem;
            margin-bottom: 2rem;
            line-height: 1.6;
            animation: fadeInUp 1.2s ease;
        }
        
        /* Hamburger Menu */
        .menu-toggle {
            display: none;
            flex-direction: column;
            cursor: pointer;
        }
        
        .bar {
            width: 25px;
            height: 3px;
            background-color: var(--text-color);
            margin: 3px 0;
            transition: var(--hover-effect);
        }
        
        /* Animations */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        /* Responsive Design */
        @media (max-width: 991px) {
            .hero h1 {
                font-size: 2.5rem;
            }
        }
        
        @media (max-width: 768px) {
            .menu-toggle {
                display: flex;
                z-index: 1001;
            }
            
            .nav-links {
                position: fixed;
                top: 0;
                right: -100%;
                flex-direction: column;
                background-color: var(--light-color);
                width: 80%;
                height: 100vh;
                padding-top: 6rem;
                transition: var(--hover-effect);
                box-shadow: -5px 0 15px rgba(0, 0, 0, 0.1);
            }
            
            .nav-links.active {
                right: 0;
            }
            
            .nav-links li {
                margin: 1.5rem 0;
                text-align: center;
            }
            
            .auth-buttons {
                flex-direction: column;
                align-items: center;
                margin-top: 2rem;
            }
            
            .auth-buttons .btn {
                margin: 0.5rem 0;
                width: 80%;
                text-align: center;
            }
            
            .hero-content {
                max-width: 100%;
                text-align: center;
            }
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar">
        <div class="logo">
            <i class="fas fa-plane"></i>
            <span>Travel Booking System</span>
        </div>
        
        <ul class="nav-links">
            <li><a href="${pageContext.request.contextPath}/">Accueil</a></li>
            <li><a href="${pageContext.request.contextPath}/about">À propos de nous</a></li>
            <li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
        </ul>
        
        <div class="auth-buttons">
            <a href="${pageContext.request.contextPath}/login" class="btn btn-outline">Connexion</a>
            <a href="${pageContext.request.contextPath}/register" class="btn btn-filled">S'inscrire</a>
        </div>
        
        <div class="menu-toggle">
            <span class="bar"></span>
            <span class="bar"></span>
            <span class="bar"></span>
        </div>
    </nav>
    
    <!-- Hero Section -->
    <section class="hero">
        <div class="hero-content">
            <h1>Découvrez le monde avec nous</h1>
            <p>Bienvenue dans notre système de réservation de voyages - Réservez votre prochain voyage facilement et rapidement.</p>
            <a href="${pageContext.request.contextPath}/search" class="btn btn-filled">Commencer</a>
        </div>
    </section>
    
    <script>
        // Mobile menu toggle
        document.querySelector('.menu-toggle').addEventListener('click', function() {
            document.querySelector('.nav-links').classList.toggle('active');
            
            // Hamburger animation
            const bars = document.querySelectorAll('.bar');
            bars[0].style.transform = bars[0].style.transform === 'rotate(-45deg) translate(-5px, 6px)' ? '' : 'rotate(-45deg) translate(-5px, 6px)';
            bars[1].style.opacity = bars[1].style.opacity === '0' ? '1' : '0';
            bars[2].style.transform = bars[2].style.transform === 'rotate(45deg) translate(-5px, -6px)' ? '' : 'rotate(45deg) translate(-5px, -6px)';
        });
    </script>
</body>
</html>