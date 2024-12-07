<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="stdhome.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Portfolio</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        .portfolio-content {
            margin-left: 250px; /* Match navbar width */
            padding: 20px;
            transition: margin-left 0.3s;
        }

        .navbar.collapsed + .portfolio-content {
            margin-left: 80px;
        }

        /* Hero Section */
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

        .hero h1 {
            font-size: 2.5rem;
            margin-bottom: 1rem;
        }

        .hero p {
            font-size: 1.2rem;
            margin-bottom: 2rem;
            background: none;
            box-shadow: none;
            color: white;
        }

        /* Projects Section */
        .projects {
            padding: 50px 0;
        }

        .section-title {
            text-align: center;
            font-size: 2rem;
            margin-bottom: 2rem;
            color: #1565C0;
        }

        .projects-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            padding: 0 20px;
        }

        .project-card {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
        }

        .project-card:hover {
            transform: translateY(-5px);
        }

        .project-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .project-info {
            padding: 1.5rem;
        }

        /* Skills Section */
        .skills {
            padding: 50px 0;
            background-color: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            margin: 20px;
        }

        .skills-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 2rem;
            padding: 0 20px;
        }

        .skill-card {
            background: white;
            padding: 1.5rem;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .skill-card i {
            font-size: 2rem;
            color: #1565C0;
            margin-bottom: 1rem;
        }

        /* Education Timeline */
        .education {
            padding: 50px 0;
        }

        .timeline {
            max-width: 800px;
            margin: 0 auto;
            position: relative;
            padding: 20px;
        }

        .timeline-item {
            background: white;
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        /* Contact Form */
        .contact {
            padding: 50px 0;
        }

        .contact-form {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 2rem;
            border-radius: 15px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: #333;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 0.8rem;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 1rem;
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
        }

        .btn:hover {
            background: #1976D2;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .portfolio-content {
                margin-left: 80px;
                padding: 10px;
            }

            .hero h1 {
                font-size: 2rem;
            }

            .projects-grid,
            .skills-grid {
                grid-template-columns: 1fr;
            }

            .contact-form {
                margin: 0 20px;
            }
        }
    </style>
</head>
<body>
    <div class="portfolio-content">
        <section class="hero">
            <div class="hero-content">
                <h1>Hi, I'm <%= session.getAttribute("studentName") != null ? session.getAttribute("studentName") : "ABHIRAM RAMISETTY" %></h1>
                <p>Computer Science Student | Web Developer | Problem Solver</p>
                <a href="#contact" class="btn">Get in Touch</a>
            </div>
        </section>

        <section class="projects" id="projects">
            <h2 class="section-title">My Projects</h2>
            <div class="projects-grid">
                <div class="project-card">
                    <img src="https://images.unsplash.com/photo-1517694712202-14dd9538aa97?auto=format&fit=crop&w=800&q=80" alt="Project 1">
                    <div class="project-info">
                        <h3>E-Learning Platform</h3>
                        <p>A full-stack web application for online learning.</p>
                        <div class="project-links">
                            <a href="#"><i class="fab fa-github"></i> GitHub</a>
                            <a href="#"><i class="fas fa-external-link-alt"></i> Live Demo</a>
                        </div>
                    </div>
                </div>
                <div class="project-card">
                    <img src="https://images.unsplash.com/photo-1551650975-87deedd944c3?auto=format&fit=crop&w=800&q=80" alt="Project 2">
                    <div class="project-info">
                        <h3>AI Image Recognition</h3>
                        <p>Machine learning project for image classification.</p>
                        <div class="project-links">
                            <a href="#"><i class="fab fa-github"></i> GitHub</a>
                            <a href="#"><i class="fas fa-external-link-alt"></i> Live Demo</a>
                        </div>
                    </div>
                </div>
                <div class="project-card">
                    <img src="https://images.unsplash.com/photo-1460925895917-afdab827c52f?auto=format&fit=crop&w=800&q=80" alt="Project 3">
                    <div class="project-info">
                        <h3>Smart Home Dashboard</h3>
                        <p>IoT project for home automation control.</p>
                        <div class="project-links">
                            <a href="#"><i class="fab fa-github"></i> GitHub</a>
                            <a href="#"><i class="fas fa-external-link-alt"></i> Live Demo</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="skills" id="skills">
            <h2 class="section-title">Skills</h2>
            <div class="skills-grid">
                <div class="skill-card">
                    <i class="fab fa-html5"></i>
                    <h3>HTML5</h3>
                </div>
                <div class="skill-card">
                    <i class="fab fa-css3-alt"></i>
                    <h3>CSS3</h3>
                </div>
                <div class="skill-card">
                    <i class="fab fa-js"></i>
                    <h3>JavaScript</h3>
                </div>
                <div class="skill-card">
                    <i class="fab fa-react"></i>
                    <h3>React</h3>
                </div>
                <div class="skill-card">
                    <i class="fab fa-python"></i>
                    <h3>Python</h3>
                </div>
                <div class="skill-card">
                    <i class="fas fa-database"></i>
                    <h3>SQL</h3>
                </div>
            </div>
        </section>

        <section class="education" id="education">
            <h2 class="section-title">Education</h2>
            <div class="timeline">
                <div class="timeline-item">
                    <h3>Bachelor of Engineering</h3>
                    <p>KL University</p>
                    <p>2024 - Present</p>
                </div>
                <div class="timeline-item">
                    <h3>Intermediate </h3>
                    <p>Sri Chaitanya Junior College</p>
                    <p>2020 - 2022</p>
                </div>
                <div class="timeline-item">
                    <h3>High School </h3>
                    <p>Vijeta High School</p>
                    <p>2018 - 2022</p>
                </div>
            </div>
        </section>

        <section class="contact" id="contact">
            <h2 class="section-title">Contact Me</h2>
            <form class="contact-form" action="contact" method="POST">
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" id="name" name="name" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="message">Message</label>
                    <textarea id="message" name="message" rows="5" required></textarea>
                </div>
                <button type="submit" class="btn">Send Message</button>
            </form>
        </section>
    </div>

    <script>
        // Update portfolio content margin when navbar is toggled
        const portfolioContent = document.querySelector('.portfolio-content');
        const navbar = document.querySelector('.navbar');
        const toggleBtn = document.querySelector('.toggle-btn');

        toggleBtn.addEventListener('click', () => {
            portfolioContent.style.marginLeft = navbar.classList.contains('collapsed') ? '250px' : '80px';
        });
    </script>
</body>
</html>