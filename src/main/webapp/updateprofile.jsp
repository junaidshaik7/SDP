<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Mentor Profile</title>
    <link rel="stylesheet" type="text/css" href="styles.css"> <!-- Link to your CSS file -->
</head>
<body>
    <h1>Update Mentor Profile</h1>

    <form action="updatementorprofile" method="post">
        <div>
            <label for="mentorId">Mentor ID:</label>
            <input type="text" id="mentorId" name="mentorId" value="${sessionScope.mentor.id}" readonly>
        </div>
        <div>
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="${sessionScope.mentor.name}" required>
        </div>
        <div>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="${sessionScope.mentor.email}" required>
        </div>
        <div>
            <label for="contact">Contact:</label>
            <input type="text" id="contact" name="contact" value="${sessionScope.mentor.contact}" required>
        </div>
        <div>
            <label for="department">Department:</label>
            <input type="text" id="department" name="department" value="${sessionScope.mentor.department}" required>
        </div>
        <div>
            <label for="salary">Salary:</label>
            <input type="text" id="salary" name="salary" value="${sessionScope.mentor.salary}" required>
        </div>
        <button type="submit">Update Profile</button>
    </form>
    
    <br><br>
    <a href="mentordashboard">Back to Dashboard</a>
</body>
</html>
