<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Seminars</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
            background: linear-gradient(135deg, #f6f8fb 0%, #e5ebf4 100%);
            min-height: 100vh;
        }

        .content-wrapper {
            max-width: 800px;
            margin: 0 auto;
            padding: 2rem;
            display: flex;
            flex-direction: column;
            align-items: center;
            animation: fadeIn 0.5s ease-out;
        }

        .logo-container {
            text-align: center;
            margin-bottom: 2rem;
            animation: slideDown 0.5s ease-out;
        }

        .logo {
            width: 80px;
            height: 80px;
            margin-bottom: 1rem;
        }

        h3 {
            text-align: center;
            color: #2c5282;
            margin: 1rem 0;
            font-size: 2rem;
            font-weight: 600;
            position: relative;
            padding-bottom: 0.5rem;
        }

        h3::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 3px;
            background: #4299e1;
            border-radius: 2px;
        }

        .button-container {
            display: flex;
            justify-content: center;
            gap: 1rem;
            margin: 2rem 0;
            animation: fadeIn 0.5s ease-out 0.2s both;
        }

        .btn {
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            background: #4299e1;
            color: white;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(66, 153, 225, 0.2);
            background: #2b6cb0;
        }

        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            backdrop-filter: blur(5px);
            z-index: 1000;
            padding: 1rem;
        }

        .modal-content {
            position: relative;
            width: 100%;
            max-width: 500px;
            margin: 2rem auto;
            padding: 2rem;
            background: white;
            border-radius: 16px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            animation: modalSlideUp 0.3s ease-out;
        }

        .form-group {
            margin-bottom: 1.25rem;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            color: #2d3748;
            font-weight: 500;
        }

        input[type="text"],
        input[type="date"] {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            background: white;
            color: #2d3748;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="date"]:focus {
            outline: none;
            border-color: #4299e1;
            box-shadow: 0 0 0 3px rgba(66, 153, 225, 0.2);
        }

        .form-buttons {
            display: flex;
            justify-content: flex-end;
            gap: 1rem;
            margin-top: 1.5rem;
        }

        .close-btn {
            position: absolute;
            top: 1rem;
            right: 1rem;
            background: none;
            border: none;
            font-size: 1.5rem;
            color: #2d3748;
            cursor: pointer;
            padding: 0.25rem;
            line-height: 1;
            transition: transform 0.3s ease;
        }

        .close-btn:hover {
            transform: rotate(90deg);
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        @keyframes slideDown {
            from {
                transform: translateY(-20px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        @keyframes modalSlideUp {
            from {
                transform: translateY(20px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        @media (max-width: 768px) {
            .content-wrapper {
                padding: 1rem;
                margin-top: 60px;
            }

            .modal-content {
                margin: 1rem;
                padding: 1.5rem;
            }

            h3 {
                font-size: 1.5rem;
            }

            .logo {
                width: 60px;
                height: 60px;
            }
        }
    </style>
</head>
<body>
    <%@include file="stdhome.jsp" %>
    
    <div class="content-wrapper">
        <div class="logo-container">
            <svg class="logo" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M12 2L2 7L12 12L22 7L12 2Z" stroke="#4299e1" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M2 17L12 22L22 17" stroke="#4299e1" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M2 12L12 17L22 12" stroke="#4299e1" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
            <h3>Student Seminars</h3>
        </div>
        
        <div class="button-container">
            <button class="btn" onclick="openModal()">Add Seminar</button>
            <form method="get" action="viewallseminars" style="display: inline;">
                <button type="submit" class="btn">View All Seminars</button>
            </form>
        </div>

        <!-- Modal -->
        <div id="seminarModal" class="modal">
            <div class="modal-content">
                <button class="close-btn" onclick="closeModal()">&times;</button>
                <h3>Add New Seminar</h3>
                <form method="post" action="insertstdseminar">
                    <div class="form-group">
                        <label for="sseminartitle">Seminar Title</label>
                        <input type="text" id="sseminartitle" name="sseminartitle" 
                               placeholder="Enter seminar title" required/>
                    </div>
                    
                    <div class="form-group">
                        <label for="sseminarDescription">Seminar Description</label>
                        <input type="text" id="sseminarDescription" name="sseminarDescription" 
                               placeholder="Enter seminar description" required/>
                    </div>
                    
                    <div class="form-group">
                        <label for="sdateachieved">Seminar Date</label>
                        <input type="date" id="sdateachieved" name="sdateachieved" required/>
                    </div>
                    
                    <div class="form-buttons">
                        <button type="reset" class="btn">Clear</button>
                        <button type="submit" class="btn">Add Seminar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        function openModal() {
            document.getElementById('seminarModal').style.display = 'block';
            document.body.style.overflow = 'hidden';
        }

        function closeModal() {
            document.getElementById('seminarModal').style.display = 'none';
            document.body.style.overflow = 'auto';
        }

        window.onclick = function(event) {
            const modal = document.getElementById('seminarModal');
            if (event.target === modal) {
                closeModal();
            }
        }
    </script>
</body>
</html>