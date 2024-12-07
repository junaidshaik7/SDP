<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Provide Feedback</title>
    <link rel="stylesheet" type="text/css" href="styles.css"> <!-- Link to CSS -->
    <style>
        body {
            min-height: 100vh;
            background-color: #f8f6ff;
            font-family: system-ui, -apple-system, sans-serif;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #4a4865;
            margin-bottom: 20px;
            font-size: 28px;
        }

        form {
            max-width: 600px;
            margin: 100px auto;
            background: white;
            padding: 24px;
            max-height:  400px;
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(138, 135, 165, 0.15);
        }

        label {
            display: block;
            font-size: 16px;
            color: #4a4865;
            margin-bottom: 8px;
        }

        select, textarea, button {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #e8e5ff;
            border-radius: 8px;
            font-size: 14px;
            font-family: inherit;
        }

        textarea {
            resize: vertical;
            min-height: 100px;
        }

        button {
            background-color: #6b5ecd;
            color: white;
            font-size: 16px;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #5d51b6;
        }

        .back-link {
            text-align: center;
            margin-top: 20px;
        }

        .back-link a {
            text-decoration: none;
            color: #6b5ecd;
            font-size: 14px;
            font-weight: 600;
        }

        .back-link a:hover {
            color: #5d51b6;
        }
    </style>
</head>
<body>
    <h1>Provide Feedback</h1>
    <%@ include file="mentordashboard.jsp" %>
    <form action="submitFeedback" method="post"> <!-- Replace with your servlet action -->
        <label for="student">Select Student:</label>
        <select name="studentId" id="student" required>
            <option value="">-- Select Student --</option>
            <c:forEach var="student" items="${students}">
                <option value="${student.id}">${student.name}</option>
            </c:forEach>
        </select>
        
        <label for="feedback">Your Feedback:</label>
        <textarea name="feedback" id="feedback" placeholder="Write your feedback here..." required></textarea>
        
        <button type="submit">Submit Feedback</button>
    </form>
    
    <div class="back-link">
        <a href="mentordashboard">Back to Dashboard</a>
    </div>
</body>
</html>
