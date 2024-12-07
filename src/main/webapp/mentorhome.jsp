<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mentor Home</title>
    <link rel="stylesheet" type="text/css" href="styles.css"> <!-- Link to your CSS file -->
</head>
<body>
    <h1>Welcome to Mentor Portal</h1>
    <div>
        <h2>Mentor Home</h2>
        <p>Welcome, ${sessionScope.mentor.name}!</p> <!-- Assuming mentor name is stored in session -->
        <ul>
            <li><a href="mentordashboard">Go to Dashboard</a></li>
            <li><a href="assignproject">Assign Projects to Students</a></li>
            <li><a href="updateprofile">Update Profile</a></li>
            <li><a href="mentorlogout">Logout</a></li>
        </ul>
    </div>
</body>
</html>
