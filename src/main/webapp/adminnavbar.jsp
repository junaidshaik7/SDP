<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
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
            width: 30px;
            font-size: 1.2rem;
            text-align: center;
        }
        .navbar a span {
            margin-left: 10px;
            font-weight: 500;
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
        }
        h2 {
            margin-top: 20px;
            margin-left: 270px;
            color: #1565C0;
            text-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
        }
        .content {
            flex-grow: 1;
            padding: 40px;
            margin-left: 250px;
            transition: 0.3s;
        }
    </style>
</head>
<body>

<!-- Navbar Section -->
<nav class="navbar">
    <button class="toggle-btn">
        <i class="fas fa-chevron-left"></i>
    </button>
    <a href="adminhome"><i class="fas fa-home"></i><span>Home</span></a>
    <a href="stdreg"><i class="fas fa-user-plus"></i><span>Add Student</span></a>
    <a href="viewallstudents"><i class="fas fa-users"></i><span>View All Students</span></a>
    <a href="deletestudent"><i class="fas fa-user-minus"></i><span>Delete Student</span></a>
    <a href="viewallprojs"><i class="fas fa-folder-open"></i><span>View All Projects</span></a>
    <a href="viewprojectbyid"><i class="fas fa-search"></i><span>View Project By Name</span></a>
   <a href="mentorreg"><i class="fas fa-user-plus"></i><span>Add Mentor</span></a>
    <a href="/"><i class="fas fa-sign-out-alt"></i><span>Logout</span></a>
    
</nav>

<!-- Page Content -->


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
