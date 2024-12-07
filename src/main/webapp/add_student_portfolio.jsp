<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Student Portfolio</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #1565C0;
            --secondary-color: #f5f7fa;
            --accent-color: #64B5F6;
            --text-color: #333;
            --border-color: #ddd;
            --shadow-color: rgba(0, 0, 0, 0.1);
            --spacing: 1.5rem;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
        }

        .page-wrapper {
            display: flex;
            min-height: 100vh;
        }

        .content-wrapper {
            flex: 1;
            margin-left: 250px; /* Match your navbar width */
            padding: 2rem;
            transition: margin-left 0.3s ease;
        }

        .navbar.collapsed + .content-wrapper {
            margin-left: 80px;
        }

        .page-header {
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)),
                        url('https://images.unsplash.com/photo-1517694712202-14dd9538aa97?auto=format&fit=crop&w=2000&q=80');
            background-size: cover;
            background-position: center;
            color: white;
            padding: 3rem 2rem;
            border-radius: 20px;
            margin-bottom: 2rem;
            text-align: center;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
        }

        .page-header h1 {
            font-size: 2.5rem;
            margin-bottom: 1rem;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }

        .page-header p {
            font-size: 1.1rem;
            opacity: 0.9;
        }

        .form-container {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 8px 32px var(--shadow-color);
            padding: 2rem;
            animation: slideUp 0.5s ease-out;
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 2rem;
        }

        .form-section {
            background: white;
            padding: 2rem;
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s ease;
        }

        .form-section:hover {
            transform: translateY(-5px);
        }

        .form-section h3 {
            color: var(--primary-color);
            margin-bottom: 1.5rem;
            padding-bottom: 0.5rem;
            border-bottom: 2px solid var(--accent-color);
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            font-weight: 500;
            margin-bottom: 0.5rem;
            color: var(--text-color);
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 0.8rem;
            border: 2px solid var(--border-color);
            border-radius: 10px;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .form-group input:focus,
        .form-group textarea:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(21, 101, 192, 0.1);
            outline: none;
        }

        textarea {
            min-height: 120px;
            resize: vertical;
        }

        .form-actions {
            grid-column: 1 / -1;
            display: flex;
            justify-content: flex-end;
            gap: 1rem;
            margin-top: 2rem;
        }

        .btn {
            padding: 0.8rem 2rem;
            border: none;
            border-radius: 50px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .btn-primary {
            background: linear-gradient(45deg, var(--primary-color), var(--accent-color));
            color: white;
        }

        .btn-secondary {
            background: #f5f5f5;
            color: var(--text-color);
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .full-width {
            grid-column: 1 / -1;
        }

        @media (max-width: 1200px) {
            .form-grid {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 768px) {
            .content-wrapper {
                margin-left: 80px;
                padding: 1rem;
            }

            .page-header {
                padding: 2rem 1rem;
            }

            .page-header h1 {
                font-size: 2rem;
            }

            .form-container {
                padding: 1rem;
            }

            .form-actions {
                flex-direction: column;
            }

            .btn {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <%@ include file="stdhome.jsp" %>
    
    <div class="content-wrapper">
        <div class="page-header">
            <h1><i class="fas fa-plus-circle"></i> Add New Portfolio</h1>
            <p>Create your professional portfolio to showcase your skills and achievements</p>
        </div>

        <div class="form-container">
            <form action="${pageContext.request.contextPath}/save-student-portfolio" method="post" enctype="multipart/form-data" class="form-grid">
                <!-- Basic Information Section -->
                <div class="form-section">
                    <h3><i class="fas fa-user"></i> Basic Information</h3>
                    <div class="form-group">
                        <label for="studentName">Full Name</label>
                        <input type="text" id="studentName" name="studentName" required placeholder="Enter your full name"/>
                    </div>
                    <div class="form-group">
                        <label for="email">Email Address</label>
                        <input type="email" id="email" name="email" required placeholder="Enter your email"/>
                    </div>
                    <div class="form-group">
                        <label for="phoneNumber">Phone Number</label>
                        <input type="tel" id="phoneNumber" name="phoneNumber" required placeholder="Enter your phone number"/>
                    </div>
                </div>

                <!-- Profile Section -->
                <div class="form-section">
                    <h3><i class="fas fa-id-card"></i> Profile Details</h3>
                    <div class="form-group">
                        <label for="bio">Professional Bio</label>
                        <textarea id="bio" name="bio" required placeholder="Write a brief professional bio"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="profileImageUrl">Profile Image URL</label>
                        <input type="url" id="profileImageUrl" name="profileImageUrl" placeholder="Enter image URL"/>
                    </div>
                </div>

                <!-- Projects Section -->
                <div class="form-section full-width">
                    <h3><i class="fas fa-project-diagram"></i> Projects</h3>
                    <div class="form-group">
                        <label for="projectDetails">Project Details</label>
                        <textarea id="projectDetails" name="projectDetails" 
                                placeholder="Enter project details in JSON format: [{'title':'Project 1','description':'Description','link':'URL'}]"></textarea>
                    </div>
                </div>

                <!-- Skills & Achievements Section -->
                <div class="form-section">
                    <h3><i class="fas fa-tools"></i> Skills</h3>
                    <div class="form-group">
                        <label for="skills">Professional Skills</label>
                        <input type="text" id="skills" name="skills" placeholder="e.g., JavaScript, Python, React"/>
                    </div>
                </div>

                <div class="form-section">
                    <h3><i class="fas fa-trophy"></i> Achievements</h3>
                    <div class="form-group">
                        <label for="achievements">Notable Achievements</label>
                        <textarea id="achievements" name="achievements" placeholder="List your key achievements"></textarea>
                    </div>
                </div>

                <!-- Social Links Section -->
                <div class="form-section full-width">
                    <h3><i class="fas fa-link"></i> Social Links</h3>
                    <div class="form-group">
                        <label for="socialLinks">Social Media Links</label>
                        <textarea id="socialLinks" name="socialLinks" 
                                placeholder="Enter social links in JSON format: {'github':'URL','linkedin':'URL','twitter':'URL'}"></textarea>
                    </div>
                </div>

                <!-- Form Actions -->
                <div class="form-actions">
                    <button type="button" class="btn btn-secondary" onclick="history.back()">
                        <i class="fas fa-arrow-left"></i> Cancel
                    </button>
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save"></i> Save Portfolio
                    </button>
                </div>
            </form>
        </div>
    </div>

    <script>
        // Handle navbar toggle
        const contentWrapper = document.querySelector('.content-wrapper');
        const navbar = document.querySelector('.navbar');
        const toggleBtn = document.querySelector('.toggle-btn');

        if (toggleBtn) {
            toggleBtn.addEventListener('click', () => {
                contentWrapper.style.marginLeft = navbar.classList.contains('collapsed') ? '250px' : '80px';
            });
        }
    </script>
</body>
</html>