<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="stdhome.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Portfolios</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        .portfolio-content {
            margin-left: 250px;
            padding: 20px;
            transition: margin-left 0.3s;
        }

        .navbar.collapsed + .portfolio-content {
            margin-left: 80px;
        }

        .hero {
            background: url('https://images.unsplash.com/photo-1517694712202-14dd9538aa97?auto=format&fit=crop&w=2000&q=80') no-repeat center center/cover;
            min-height: 60vh;
            min-width: 150vh;
            display: flex;
            align-items: center;
            position: relative;
            margin-top: 50px;
            border-radius: 15px;
            overflow: hidden;
            margin-bottom: 2rem;
        }

        .hero::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.6);
        }

        .hero-content {
            position: relative;
            z-index: 1;
            color: white;
            padding: 2rem;
            width: 100%;
            text-align: center;
        }

        .section-title {
            text-align: center;
            font-size: 2rem;
            margin-bottom: 2rem;
            color: #1565C0;
        }

        .portfolio-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            padding: 0 20px;
        }

        .card {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
            padding: 1.5rem;
            margin-bottom: 2rem;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card-title {
            color: #1565C0;
            font-size: 1.5rem;
            margin-bottom: 1rem;
            padding-bottom: 0.5rem;
            border-bottom: 2px solid #1565C0;
        }

        .info-item {
            margin-bottom: 1rem;
        }

        .info-label {
            font-weight: 600;
            color: #1565C0;
            margin-bottom: 0.5rem;
        }

        .info-value {
            color: #333;
        }

        .project-card {
            background: white;
            border-radius: 10px;
            padding: 1rem;
            margin-bottom: 1rem;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
        }

        .skill-tag {
            display: inline-block;
            background: #e3f2fd;
            color: #1565C0;
            padding: 0.5rem 1rem;
            border-radius: 20px;
            margin: 0.25rem;
        }

        .btn {
            background: #1565C0;
            color: white;
            padding: 0.8rem 2rem;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1rem;
            transition: background 0.3s;
            text-decoration: none;
            display: inline-block;
        }

        .btn:hover {
            background: #1976D2;
        }

        .action-buttons {
            display: flex;
            gap: 1rem;
            margin-top: 1rem;
        }

        @media (max-width: 768px) {
            .portfolio-content {
                margin-left: 80px;
                padding: 10px;
            }
        }
        form {
    display: flex;
    flex-direction: column;
    gap: 1rem;
}

.input-field {
    width: 100%;
    padding: 0.8rem;
    border: 1px solid #ddd;
    border-radius: 8px;
    font-size: 1rem;
    transition: border-color 0.3s;
}

.input-field:focus {
    outline: none;
    border-color: #1565C0;
    box-shadow: 0 0 5px rgba(21, 101, 192, 0.2);
}

textarea {
    resize: none;
}

.card form button {
    align-self: flex-start;
    background: #1565C0;
    color: white;
    padding: 0.8rem 2rem;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    transition: background 0.3s;
}

.card form button:hover {
    background: #1976D2;
}
        
    </style>
</head>
<body>
    <div class="portfolio-content">
        <section class="hero">
            <div class="hero-content">
                <h1>Student Portfolios</h1>
                <p>Showcase of Student Achievements and Projects</p>
                <!-- <a href="add-student-portfolio" class="btn">Add New Portfolio</a> -->
            </div>
        </section>

        <c:forEach var="portfolio" items="${portfolios}">
            <!-- Basic Info Card -->
            <div class="card">
                <h2 class="card-title">Basic Information</h2>
                <div class="info-item">
                    <div class="info-label">ID</div>
                    <div class="info-value">${portfolio.id}</div>
                </div>
                <div class="info-item">
                    <div class="info-label">Name</div>
                    <div class="info-value">${portfolio.studentName}</div>
                </div>
                <div class="info-item">
                    <div class="info-label">Email</div>
                    <div class="info-value">${portfolio.email}</div>
                </div>
            </div>

            <!-- Projects Card -->
            <div class="card">
                <h2 class="card-title">Projects</h2>
                <c:forEach var="project" items="${portfolio.projectDetails}">
                    <div class="project-card">
                        <div class="info-label">Project Title</div>
                        <div class="info-value">${project}</div>
                    </div>
                </c:forEach>
            </div>

            <!-- Skills Card -->
            <div class="card">
                <h2 class="card-title">Skills</h2>
                <div class="skills-container">
                    <c:forEach var="skill" items="${portfolio.skills}">
                        <span class="skill-tag">${skill}</span>
                        
                    </c:forEach>
                </div>
            </div>

            <!-- Additional Information Card -->
            <div class="card">
                <h2 class="card-title">Additional Information</h2>
                <div class="info-item">
                    <div class="info-label">Phone Number</div>
                    <div class="info-value">${portfolio.phoneNumber}</div>
                </div>
                <div class="info-item">
                    <div class="info-label">Bio</div>
                    <div class="info-value">${portfolio.bio}</div>
                </div>
                <div class="info-item">
                    <div class="info-label">Social Links</div>
                    <div class="info-value">${portfolio.socialLinks}</div>
                </div>
                <div class="info-item">
                    <div class="info-label">Achievements</div>
                    <div class="info-value">${portfolio.achievements}</div>
                </div>
            </div>
            
                    <!-- Contact Form Section -->
<div class="card">
    <h2 class="card-title">Contact Us</h2>
    <form action="submit-contact" method="post">
        <div class="info-item">
            <label for="contactName" class="info-label">Name</label>
            <input type="text" id="contactName" name="name" class="input-field" placeholder="Your Name" required>
        </div>
        <div class="info-item">
            <label for="contactEmail" class="info-label">Email</label>
            <input type="email" id="contactEmail" name="email" class="input-field" placeholder="Your Email" required>
        </div>
        <div class="info-item">
            <label for="contactMessage" class="info-label">Message</label>
            <textarea id="contactMessage" name="message" rows="4" class="input-field" placeholder="Your Message" required></textarea>
        </div>
        <button type="submit" class="btn">
            <i class="fas fa-paper-plane"></i> Submit
        </button>
    </form>
</div>

            <!-- Action Buttons -->
            <div class="action-buttons">
                <a href="edit-student-portfolio?id=${portfolio.id}" class="btn">
                    <i class="fas fa-edit"></i> Edit
                </a>
                <a href="delete-student-portfolio?id=${portfolio.id}" 
                   onclick="return confirm('Are you sure you want to delete this portfolio?')" 
                   class="btn">
                    <i class="fas fa-trash"></i> Delete
                </a>
            </div>
        </c:forEach>
        

        

       
      
        
    </div>

    <script>
        const portfolioContent = document.querySelector('.portfolio-content');
        const navbar = document.querySelector('.navbar');
        const toggleBtn = document.querySelector('.toggle-btn');

        toggleBtn.addEventListener('click', () => {
            portfolioContent.style.marginLeft = navbar.classList.contains('collapsed') ? '250px' : '80px';
        });
    </script>
</body>
</html>