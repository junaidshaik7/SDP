<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Dashboard Grid Layout */
        .dashboard-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 25px;
            padding: 30px;
            max-width: 1400px;
            margin: 0 auto;
            margin-top: 20px;
        }

        /* Profile Card */
        .profile-card {
            background: rgba(255, 255, 255, 0.9);
            border-radius: 20px;
            padding: 30px;
            text-align: center;
            box-shadow: 0 8px 32px rgba(31, 38, 135, 0.1);
            backdrop-filter: blur(8px);
            border: 1px solid rgba(255, 255, 255, 0.4);
            transition: transform 0.3s ease;
        }

        .profile-card:hover {
            transform: translateY(-5px);
        }

        .profile-image {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            margin: 0 auto 20px;
            border: 4px solid #1976D2;
            padding: 3px;
        }

        .profile-name {
            font-size: 1.5rem;
            color: #1565C0;
            margin-bottom: 10px;
            font-weight: 600;
        }

        .profile-role {
            color: #546E7A;
            margin-bottom: 20px;
            font-size: 1.1rem;
        }

        /* Stats Grid */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
            margin-top: 20px;
        }

        .stat-item {
            background: rgba(25, 118, 210, 0.1);
            padding: 15px;
            border-radius: 12px;
            transition: all 0.3s ease;
        }

        .stat-item:hover {
            background: rgba(25, 118, 210, 0.15);
        }

        .stat-value {
            font-size: 1.8rem;
            color: #1565C0;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .stat-label {
            color: #546E7A;
            font-size: 0.9rem;
        }

        /* Progress Tracking */
        .progress-section {
            background: rgba(255, 255, 255, 0.9);
            border-radius: 20px;
            padding: 25px;
            box-shadow: 0 8px 32px rgba(31, 38, 135, 0.1);
            backdrop-filter: blur(8px);
            border: 1px solid rgba(255, 255, 255, 0.4);
        }

        .progress-title {
            color: #1565C0;
            font-size: 1.3rem;
            margin-bottom: 20px;
            font-weight: 600;
        }

        .progress-item {
            margin-bottom: 20px;
        }

        .progress-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 8px;
        }

        .progress-name {
            color: #37474F;
            font-weight: 500;
        }

        .progress-percentage {
            color: #1976D2;
            font-weight: 600;
        }

        .progress-bar {
            height: 8px;
            background: #E3F2FD;
            border-radius: 4px;
            overflow: hidden;
        }

        .progress-fill {
            height: 100%;
            background: linear-gradient(45deg, #1976D2, #42A5F5);
            border-radius: 4px;
            transition: width 0.3s ease;
        }

        /* Recent Activities */
        .activities-section {
            background: rgba(255, 255, 255, 0.9);
            border-radius: 20px;
            padding: 25px;
            box-shadow: 0 8px 32px rgba(31, 38, 135, 0.1);
            backdrop-filter: blur(8px);
            border: 1px solid rgba(255, 255, 255, 0.4);
        }

        .activity-item {
            display: flex;
            align-items: center;
            padding: 12px 0;
            border-bottom: 1px solid rgba(25, 118, 210, 0.1);
        }

        .activity-item:last-child {
            border-bottom: none;
        }

        .activity-icon {
            width: 40px;
            height: 40px;
            background: rgba(25, 118, 210, 0.1);
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
            color: #1976D2;
        }

        .activity-details {
            flex-grow: 1;
        }

        .activity-title {
            color: #37474F;
            font-weight: 500;
            margin-bottom: 4px;
        }

        .activity-time {
            color: #78909C;
            font-size: 0.9rem;
        }

        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .dashboard-container {
                grid-template-columns: 1fr;
                padding: 15px;
            }

            .profile-card {
                padding: 20px;
            }

            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
            }

            .stat-value {
                font-size: 1.5rem;
            }
        }

        /* Animation Classes */
        .fade-in {
            animation: fadeIn 0.5s ease-in;
        }

        .slide-up {
            animation: slideUp 0.5s ease-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes slideUp {
            from { transform: translateY(20px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
    </style>
</head>
<body>
<%@include file="stdhome.jsp" %>
    <div class="content">
        <div class="dashboard-container">
            <!-- Profile Card -->
            <div class="profile-card fade-in">
                <img src="https://cdn-icons-png.flaticon.com/512/3135/3135755.png" alt="Profile" class="profile-image">
                <h3 class="profile-name">Pravallika Byreddy</h3>
                <p class="profile-role">Computer Science Student</p>
                <div class="stats-grid">
                    <div class="stat-item">
                        <div class="stat-value">2</div>
                        <div class="stat-label">Projects</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-value">3</div>
                        <div class="stat-label">Achievements</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-value">4</div>
                        <div class="stat-label">Articles</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-value">3</div>
                        <div class="stat-label">Seminars</div>
                    </div>
                </div>
            </div>

            <!-- Progress Tracking -->
            <div class="progress-section slide-up">
                <h3 class="progress-title">Project Progress</h3>
                <div class="progress-item">
                    <div class="progress-header">
                        <span class="progress-name">Final Year Project</span>
                        <span class="progress-percentage">75%</span>
                    </div>
                    <div class="progress-bar">
                        <div class="progress-fill" style="width: 75%"></div>
                    </div>
                </div>
                <div class="progress-item">
                    <div class="progress-header">
                        <span class="progress-name">Research Paper</span>
                        <span class="progress-percentage">60%</span>
                    </div>
                    <div class="progress-bar">
                        <div class="progress-fill" style="width: 60%"></div>
                    </div>
                </div>
                <div class="progress-item">
                    <div class="progress-header">
                        <span class="progress-name">Web Development</span>
                        <span class="progress-percentage">90%</span>
                    </div>
                    <div class="progress-bar">
                        <div class="progress-fill" style="width: 90%"></div>
                    </div>
                </div>
            </div>

            <!-- Recent Activities -->
            <div class="activities-section slide-up">
                <h3 class="progress-title">Recent Activities</h3>
                <div class="activity-item">
                    <div class="activity-icon"><i class="fas fa-trophy"></i></div>
                    <div class="activity-details">
                        <p class="activity-title">Won Coding Competition</p>
                        <p class="activity-time">2 days ago</p>
                    </div>
                </div>
                <div class="activity-item">
                    <div class="activity-icon"><i class="fas fa-book"></i></div>
                    <div class="activity-details">
                        <p class="activity-title">Published Research Paper</p>
                        <p class="activity-time">1 week ago</p>
                    </div>
                </div>
                <div class="activity-item">
                    <div class="activity-icon"><i class="fas fa-graduation-cap"></i></div>
                    <div class="activity-details">
                        <p class="activity-title">Completed AI Course</p>
                        <p class="activity-time">1 month ago</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
