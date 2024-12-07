<%-- <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Assign Project to Student</title>
    <link rel="stylesheet" type="text/css" href="styles.css"> <!-- Link to your CSS file -->
</head>
<body>
    <h1>Assign Project to Student</h1>
    
    <form action="assignprojecttostudent" method="post">
        <div>
            <label for="mentorId">Mentor ID:</label>
            <input type="text" id="mentorId" name="mentorId" value="${sessionScope.mentor.id}" readonly>
        </div>
        <div>
            <label for="studentId">Student ID:</label>
            <input type="text" id="studentId" name="studentId" required>
        </div>
        <div>
            <label for="projectId">Project ID:</label>
            <input type="text" id="projectId" name="projectId" required>
        </div>
        <button type="submit">Assign Project</button>
    </form>
    
    <br><br>
    <a href="mentordashboard">Back to Dashboard</a>
</body>
</html>
 --%>
 
 
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Assign Project</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        * {
            /* Replace the existing CSS with these updated styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: system-ui, -apple-system, sans-serif;
}

body {
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: #f8f6ff;
    padding: 20px;
}

.form-container {
    background: white;
    border-radius: 24px;
    padding: 40px;
    width: 100%;
    max-width: 600px;
    box-shadow: 0 4px 20px rgba(138, 135, 165, 0.15);
}

h3 {
    color: #4a4865;
    font-size: 24px;
    margin-bottom: 32px;
    text-align: center;
    font-weight: 600;
}

h3 u {
    text-decoration: none;
}

table {
    width: 100%;
}

td {
    padding: 10px;
    vertical-align: top;
}

label {
    color: #6b6885;
    font-size: 14px;
    font-weight: 500;
    display: block;
    margin-bottom: 8px;
}

input[type="text"],
input[type="email"],
input[type="password"],
input[type="number"],
input[type="date"],
select {
    width: 100%;
    padding: 12px 16px;
    border: 1px solid #e8e5ff;
    border-radius: 12px;
    background: #fcfbff;
    color: #4a4865;
    font-size: 16px;
    transition: all 0.3s ease;
}

input[type="text"]::placeholder,
input[type="email"]::placeholder,
input[type="password"]::placeholder,
input[type="number"]::placeholder {
    color: #a8a5c1;
}

input[type="text"]:focus,
input[type="email"]:focus,
input[type="password"]:focus,
input[type="number"]:focus,
input[type="date"]:focus,
select:focus {
    outline: none;
    border-color: #6b5ecd;
    background: white;
    box-shadow: 0 0 0 4px rgba(107, 94, 205, 0.1);
}

.radio-group {
    display: flex;
    gap: 20px;
    padding: 8px 0;
}

.radio-group label {
    display: flex;
    align-items: center;
    gap: 5px;
    cursor: pointer;
    margin-bottom: 0;
}

input[type="radio"] {
    accent-color: #6b5ecd;
    cursor: pointer;
}

select {
    cursor: pointer;
}

option {
    color: #4a4865;
    background: white;
}

.button-container {
    text-align: center;
    padding-top: 32px;
}

input[type="submit"],
input[type="reset"] {
    padding: 12px 24px;
    margin: 0 10px;
    border: none;
    border-radius: 12px;
    font-weight: 600;
    font-size: 16px;
    cursor: pointer;
    transition: all 0.3s ease;
}

input[type="submit"] {
    background: #6b5ecd;
    color: white;
}

input[type="reset"] {
    background: white;
    color: #6b5ecd;
    border: 1px solid #e8e5ff;
}

input[type="submit"]:hover {
    transform: translateY(-2px);
    background: #5d51b6;
    box-shadow: 0 4px 12px rgba(107, 94, 205, 0.2);
}

input[type="reset"]:hover {
    background: #fcfbff;
    border-color: #6b5ecd;
}

@media (max-width: 768px) {
    .form-container {
        padding: 24px;
    }

    td {
        display: block;
        width: 100%;
    }

    .radio-group {
        flex-direction: column;
        gap: 10px;
    }

   
.button-container {
    text-align: center;
    padding-top: 32px;
}

input[type="submit"],
input[type="reset"] {
    padding: 12px 24px;
    margin: 0 10px;
    border: none;
    border-radius: 12px;
    font-weight: 600;
    font-size: 16px;
    cursor: pointer;
    transition: all 0.3s ease;
}

input[type="submit"] {
    background: #6b5ecd;
    color: white;
}

input[type="reset"] {
    background: white;
    color: #6b5ecd;
    border: 1px solid #e8e5ff;
}

input[type="submit"]:hover {
    transform: translateY(-2px);
    background: #5d51b6;
    box-shadow: 0 4px 12px rgba(107, 94, 205, 0.2);
}
    input[type="submit"],
    input[type="reset"] {
        width: 100%;
        margin: 10px 0;
    }
    
}
    </style>
</head>
<body>
<%@include file="mentordashboard.jsp" %>
    <div class="form-container">
        <h3><u>Assign Project</u></h3>
      
        <form action="assignprojecttostudent" method="post">
        <div>
            <label for="mentorId">Mentor ID:</label>
            <input type="text" id="mentorId" name="mentorId" value="${sessionScope.mentor.id}" readonly>
        </div>
        <div>
            <label for="studentId">Student ID:</label>
            <input type="text" id="studentId" name="studentId" required>
        </div>
        <div>
            <label for="projectId">Project ID:</label>
            <input type="text" id="projectId" name="projectId" required>
        </div>
        <br>
        <button  type="submit">Assign Project</button>
    </form>
    </div>
</body>
</html>