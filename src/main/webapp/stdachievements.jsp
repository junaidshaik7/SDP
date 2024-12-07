<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Achievements</title>
    <style>
        .achievements-container {
            flex-grow: 1;
            margin-left: 250px;
            margin-top: 20px; /* Added margin-top */
            transition: 0.3s;
            padding: 2rem;
            box-sizing: border-box;
        }

        .achievements-container.expanded {
            margin-left: 80px;
        }

        .title {
            text-align: center;
            color: #d4547d;
            margin-bottom: 1rem;
            font-size: 1.8rem;
            font-weight: bold;
        }

        .description {
            text-align: center;
            color: #555;
            margin-bottom: 2rem;
            font-size: 1.2rem;
        }

        .buttons-container {
            display: flex;
            justify-content: center;
            gap: 1rem;
            margin-top: 1rem;
            margin-bottom: 2rem;
        }

        .action-button {
            padding: 0.75rem 2rem;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            background: rgba(255, 255, 255, 0.25);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.3);
            color: #d4547d;
        }

        .action-button:hover {
            transform: translateY(-2px);
            background: #f5f5f5; /* Subtle change for background */
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.15); /* Increased shadow */
        }

        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.5);
            display: none;
            justify-content: center;
            align-items: center;
            z-index: 1000;
            backdrop-filter: blur(5px);
        }

        .modal-container {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border-radius: 15px;
            padding: 2rem;
            width: 90%;
            max-width: 500px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.3);
            transform: translateY(-20px);
            opacity: 0;
            transition: all 0.3s ease;
        }

        .modal-overlay.active {
            display: flex;
        }

        .modal-overlay.active .modal-container {
            transform: translateY(0);
            opacity: 1;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: #333;
            font-weight: bold;
        }

        .form-group input {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            font-size: 1rem;
            background: rgba(255, 255, 255, 0.9);
            transition: all 0.3s ease;
        }

        .form-group input:focus {
            outline: none;
            border-color: #d4547d;
            box-shadow: 0 0 0 2px rgba(212, 84, 125, 0.2);
        }

        .form-buttons {
            display: flex;
            gap: 1rem;
            margin-top: 2rem;
        }

        .form-buttons button {
            flex: 1;
            padding: 0.75rem;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .submit-btn {
            background: #d4547d;
            color: white;
        }

        .cancel-btn {
            background: #e0e0e0;
            color: #333;
        }

        .form-buttons button:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        @media (max-width: 768px) {
            .achievements-container {
                margin-left: 80px;
                padding: 1rem;
            }

            .modal-container {
                width: 95%;
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <%@ include file="stdhome.jsp" %>
    
    <div class="achievements-container">
        <h1 class="title">Student Achievements</h1>
        <p class="description">Explore and add new achievements with ease.</p>
        
        <div class="buttons-container">
            <button class="action-button" onclick="openModal()">Add Achievement</button>
            <form method="get" action="viewallachievements" style="display: inline;">
                <button type="submit" class="action-button">View All Achievements</button>
            </form>
        </div>
    </div>

    <div class="modal-overlay" id="achievementModal">
        <div class="modal-container">
            <form method="post" action="insertstdachievements">
                <div class="form-group">
                    <label for="sachievementName">Achievement Title</label>
                    <input type="text" 
                           id="sachievementName" 
                           name="sachievementName" 
                           required 
                           placeholder="Enter achievement title">
                </div>

                <div class="form-group">
                    <label for="sachievementDescription">Achievement Description</label>
                    <input type="text" 
                           id="sachievementDescription" 
                           name="sachievementDescription" 
                           required 
                           placeholder="Describe your achievement">
                </div>

                <div class="form-group">
                    <label for="sdateachieved">Achievement Date</label>
                    <input type="date" 
                           id="sdateachieved" 
                           name="sdateachieved" 
                           required>
                </div>

                <div class="form-buttons">
                    <button type="button" class="cancel-btn" onclick="closeModal()">Cancel</button>
                    <button type="submit" class="submit-btn">Add Achievement</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const achievementsContainer = document.querySelector('.achievements-container');
            const navbar = document.querySelector('.navbar');
            
            if (navbar.classList.contains('collapsed')) {
                achievementsContainer.classList.add('expanded');
            }
            
            document.querySelector('.toggle-btn').addEventListener('click', () => {
                achievementsContainer.classList.toggle('expanded');
            });
        });

        function openModal() {
            document.getElementById('achievementModal').classList.add('active');
        }

        function closeModal() {
            document.getElementById('achievementModal').classList.remove('active');
        }

        // Close modal when clicking outside
        document.getElementById('achievementModal').addEventListener('click', (e) => {
            if (e.target.classList.contains('modal-overlay')) {
                closeModal();
            }
        });
    </script>
</body>
</html>
