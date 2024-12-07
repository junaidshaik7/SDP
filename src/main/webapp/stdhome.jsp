<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
    <title>Student Project Management</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            display: flex;
            background: linear-gradient(135deg, #E3F2FD 0%, #90CAF9 100%);
            min-height: 100vh;
            overflow-x: hidden;
        }
        
        .navbar {
            width: 250px;
            background: rgba(25, 118, 210, 0.05);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            height: 100vh;
            position: fixed;
            left: 0;
            display: flex;
            flex-direction: column;
            padding: 20px 0;
            transition: 0.3s;
            border-right: 1px solid rgba(25, 118, 210, 0.2);
            box-shadow: 2px 0 20px rgba(0, 0, 0, 0.05);
        }

        .navbar.collapsed {
            width: 80px;
        }

        .logo-section {
            display: flex;
            align-items: center;
            padding: 0 20px;
            margin-bottom: 30px;
        }

        .logo-section img {
            width: 40px;
            height: 40px;
            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.1));
        }

        .logo-section span {
            margin-left: 10px;
            font-size: 1.2rem;
            font-weight: 600;
            color: #1565C0;
            text-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
        }

        .navbar.collapsed .logo-section span {
            display: none;
        }

        .navbar a {
            padding: 15px 20px;
            text-decoration: none;
            color: #1976D2;
            display: flex;
            align-items: center;
            transition: all 0.3s;
            margin: 4px 10px;
            border-radius: 10px;
        }

        .navbar a:hover {
            background: rgba(25, 118, 210, 0.1);
            transform: translateX(5px);
            color: #1565C0;
        }

        .navbar a i {
            width: 40px;
            font-size: 1.2rem;
            text-align: center;
        }

        .navbar a span {
            margin-left: 10px;
            transition: 0.3s;
            font-weight: 500;
        }

        .navbar.collapsed a span {
            display: none;
        }

        .toggle-btn {
            position: absolute;
            right: -15px;
            top: 20px;
            background: rgba(255, 255, 255, 0.95);
            border: none;
            width: 30px;
            height: 30px;
            border-radius: 50%;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #1976D2;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
            transition: 0.3s;
        }

        .toggle-btn:hover {
            background: #fff;
            transform: scale(1.1);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
        }

        .toggle-btn i {
            transition: 0.3s;
        }

        .navbar.collapsed .toggle-btn i {
            transform: rotate(180deg);
        }
        
        .content {
            flex-grow: 1;
            padding: 40px;
            margin-left: 250px;
            transition: 0.3s;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
        }

        .content.expanded {
            margin-left: 80px;
        }
        
        h2 {
            color: #1565C0;
            margin-bottom: 25px;
            font-size: 2.5rem;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            background: linear-gradient(45deg, #1565C0, #42A5F5);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            letter-spacing: 0.5px;
        }

        p {
            color: #37474F;
            line-height: 1.8;
            font-size: 1.2rem;
            max-width: 800px;
            margin: 0 auto;
            padding: 25px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 15px;
            backdrop-filter: blur(5px);
            -webkit-backdrop-filter: blur(5px);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        @media (max-width: 768px) {
            .navbar {
                width: 80px;
            }

            .navbar .logo-section span,
            .navbar a span {
                display: none;
            }

            .content {
                margin-left: 80px;
                padding: 20px;
            }

            .toggle-btn {
                display: none;
            }

            h2 {
                font-size: 2rem;
            }

            p {
                font-size: 1.1rem;
                padding: 15px;
            }
        }
    </style>
</head>
<body>




    
    <nav class="navbar">
        <button class="toggle-btn">
            <i class="fas fa-chevron-left"></i>
        </button>
        <div class="logo-section">
            <img src="https://cdn-icons-png.flaticon.com/512/3135/3135755.png" alt="Logo">
            <span>Student Portal</span>
        </div>
        <a href="stdhome"><i class="fas fa-home"></i><span>Home</span></a>
        <a href="stddashboard"><i class="fas fa-dashboard"></i><span>Dashboard</span></a>
        <a href="stdprojects"><i class="fas fa-project-diagram"></i><span>Projects</span></a>
        <a href="stdachievements"><i class="fas fa-trophy"></i><span>Achievements</span></a>
        <a href="stdarticles"><i class="fas fa-newspaper"></i><span>Articles</span></a>
        <a href="student-portfolios"><i class="fas fa-user-circle"></i><span>Portfolio</span></a>
        <a href="stdprofile"><i class="fas fa-id-card"></i><span>Profile</span></a>
        <a href="viewallperks"><i class="fas fa-gift"></i><span>Perks</span></a>
        <a href="stdseminar"><i class="fas fa-chalkboard-teacher"></i><span>Seminar</span></a>
        <a href="stdprojecttracking"><i class="fas fa-tasks"></i><span>Project Tracking</span></a>
        <a href="/"><i class="fas fa-sign-out-alt"></i><span>Logout</span></a>
    </nav>
    
    

    <script>
        const navbar = document.querySelector('.navbar');
        const content = document.querySelector('.content');
        const toggleBtn = document.querySelector('.toggle-btn');

        toggleBtn.addEventListener('click', () => {
            navbar.classList.toggle('collapsed');
            content.classList.toggle('expanded');
        });
    </script>
</body>
</html>