
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Registration</title>
    
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

    input[type="submit"],
    input[type="reset"] {
        width: 100%;
        margin: 10px 0;
    }
}
    </style>
</head>
<body>
<%@include file="adminnavbar.jsp" %>
    <div class="form-container">
        <h3><u>Student Registration</u></h3>
      
        <form method="post" action="insertstd">
            <table>
                <tr>
                    <td>
                        <label for="sfirstname">First Name</label>
                        <input type="text" id="sfirstname" name="sfirstname" required placeholder="Enter your first name"/>
                    </td>
                    <td>
                        <label for="slastname">Last Name</label>
                        <input type="text" id="slastname" name="slastname" required placeholder="Enter your last name"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label>Gender</label>
                        <div class="radio-group">
                            <label>
                                <input type="radio" id="male" name="sgender" value="MALE" required/>
                                Male
                            </label>
                            <label>
                                <input type="radio" id="female" name="sgender" value="FEMALE" required/>
                                Female
                            </label>
                            <label>
                                <input type="radio" id="others" name="sgender" value="OTHERS" required/>
                                Others
                            </label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="sdob">Date of Birth</label>
                        <input type="date" id="sdob" name="sdob" required/>
                    </td>
                    <td>
                        <label for="sdept">Department</label>
                        <select id="sdept" name="sdept" required>
                            <option value="">Select Department</option>
                            <option value="ARTIFICIAL INTELLIGENCE AND DATA SCIENECE">Artificial Intelligence and Data Science</option>
                            <option value="BACHELOR OF BUSINESS ADMINISTRATION">Bachelor of Business Administration</option>
                            <option value="COMPUTER SCIENCE AND ENGINEERING">Computer Science and Engineering</option>
                            <option value="ELECTRONICS AND COMMUNICATION ENGINEERING">Electronics and Communication Engineering</option>
                            <option value="INTERNET OF THINGS">Internet of Things</option>
                            <option value="MASTER OF BUSINESS ADMINISTRATION">Master of Business Administration</option>
                            <option value="MECHANICAL ENGINEERING">Mechanical Engineering</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="slocation">Location</label>
                        <input type="text" id="slocation" name="slocation" required placeholder="Enter your location"/>
                    </td>
                    <td>
                        <label for="scontact">Contact Number</label>
                        <input type="number" id="scontact" name="scontact" required placeholder="Enter your contact number"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="semail">Email ID</label>
                        <input type="email" id="semail" name="semail" required placeholder="Enter your email"/>
                    </td>
                    <td>
                        <label for="spwd">Password</label>
                        <input type="password" id="spwd" name="spwd" required placeholder="Enter your password"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="button-container">
                        <input type="submit" value="Register"/>
                        <input type="reset" value="Clear"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>