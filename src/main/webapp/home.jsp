<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Portfolio & Project Tracking</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            min-height: 100vh;
            background: url('https://images.unsplash.com/photo-1523240795612-9a054b0db644?auto=format&fit=crop&w=2000&q=80') center/cover no-repeat fixed;
            position: relative;
            overflow-x: hidden;
        }

        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.7);
            z-index: 0;
        }

        nav {
            padding: 1.5rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: rgba(0, 0, 0, 0.8);
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 100;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
        }

        .logo {
            font-size: 1.5rem;
            font-weight: bold;
            color: #00ff88;
            text-shadow: 0 0 10px rgba(0, 255, 136, 0.3);
        }

        .nav-buttons {
            display: flex;
            gap: 1rem;
        }

        .nav-btn {
            padding: 0.5rem 1.5rem;
            border: none;
            border-radius: 25px;
            background: rgba(0, 255, 136, 0.2);
            color: white;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
        }

        .nav-btn:hover {
            background: rgba(0, 255, 136, 0.4);
            transform: translateY(-2px);
        }

        main {
            padding: 8rem 2rem 4rem;
            text-align: center;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            position: relative;
            z-index: 1;
        }

        main h1 {
            font-size: 3.5rem;
            color: white;
            margin-bottom: 1.5rem;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }

        main p {
            color: rgba(255, 255, 255, 0.9);
            font-size: 1.3rem;
            max-width: 600px;
            margin: 0 auto;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
        }

        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.8);
            z-index: 1000;
        }

        .modal:target {
            display: flex;
        }

        .modal-content {
            position: relative;
            background: rgba(0, 0, 0, 0.9);
            padding: 2.5rem;
            border-radius: 20px;
            border: 1px solid rgba(0, 255, 136, 0.3);
            margin: auto;
            width: 90%;
            max-width: 400px;
            box-shadow: 0 0 20px rgba(0, 255, 136, 0.2);
        }

        .modal h2 {
            color: #00ff88;
            margin-bottom: 1.5rem;
            text-align: center;
            font-size: 1.8rem;
        }

        .modal-buttons {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .modal-buttons a {
            padding: 1rem;
            border: none;
            border-radius: 10px;
            background: rgba(0, 255, 136, 0.1);
            color: white;
            font-size: 1rem;
            text-decoration: none;
            text-align: center;
            transition: all 0.3s ease;
        }

        .modal-buttons a:hover {
            background: rgba(0, 255, 136, 0.2);
            transform: translateX(5px);
        }

        .close-btn {
            position: absolute;
            top: 1rem;
            right: 1rem;
            text-decoration: none;
            font-size: 1.5rem;
            color: #00ff88;
            transition: transform 0.3s ease;
            width: 30px;
            height: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
        }

        .close-btn:hover {
            transform: rotate(90deg);
            background: rgba(0, 255, 136, 0.1);
        }

        .features {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            margin-top: 4rem;
            width: 100%;
            max-width: 1200px;
        }

        .feature-card {
            background: rgba(0, 0, 0, 0.8);
            padding: 2rem;
            border-radius: 15px;
            color: white;
            text-align: left;
            border: 1px solid rgba(0, 255, 136, 0.2);
            transition: transform 0.3s ease;
        }

        .feature-card:hover {
            transform: translateY(-5px);
            border-color: rgba(0, 255, 136, 0.4);
        }

        .feature-card h3 {
            font-size: 1.3rem;
            margin-bottom: 1rem;
            color: #00ff88;
        }

        .feature-card p {
            font-size: 1rem;
            color: rgba(255, 255, 255, 0.8);
        }
    </style>
</head>
<body>
    <nav>
        <div class="logo">Portfolio Tracker</div>
        <div class="nav-buttons">
            <a href="#loginModal" class="nav-btn">Login</a>
            <a href="#signupModal" class="nav-btn">Sign Up</a>
        </div>
    </nav>

    <main>
        <h1>Student Portfolio & Project Tracking</h1>
        <p>Showcase your academic journey, track your projects, and build your professional portfolio all in one place.</p>
        
        <div class="features">
            <div class="feature-card">
                <h3>Portfolio Management</h3>
                <p>Create and maintain a professional portfolio of your academic achievements and projects.</p>
            </div>
            <div class="feature-card">
                <h3>Project Tracking</h3>
                <p>Monitor project milestones, deadlines, and collaboration with real-time updates.</p>
            </div>
            <div class="feature-card">
                <h3>Progress Analytics</h3>
                <p>Visualize your growth with detailed analytics and performance insights.</p>
            </div>
        </div>
    </main>

    <!-- Login Modal -->
    <div id="loginModal" class="modal">
        <div class="modal-content">
            <h2>Login</h2>
            <div class="modal-buttons">
                <a href="stdlogin">Student Login</a>
                <a href="adminlogin">Admin Login</a>
                 <a href="mentorlogin">Mentor Login</a>
            </div>
            <a href="#" class="close-btn">&times;</a>
        </div>
    </div>

    <!-- Signup Modal -->
    <div id="signupModal" class="modal">
        <div class="modal-content">
            <h2>Sign Up</h2>
            <div class="modal-buttons">
                <a href="stdreg">Student Sign Up</a>
              
            </div>
            <a href="#" class="close-btn">&times;</a>
        </div>
    </div>
</body>
</html>