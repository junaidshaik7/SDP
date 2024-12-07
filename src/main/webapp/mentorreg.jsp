<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Mentor Registration</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
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

        input, select {
            width: 100%;
            padding: 12px 16px;
            border: 1px solid #e8e5ff;
            border-radius: 12px;
            background: #fcfbff;
            color: #4a4865;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        input:focus, select:focus {
            outline: none;
            border-color: #6b5ecd;
            background: white;
            box-shadow: 0 0 0 4px rgba(107, 94, 205, 0.1);
        }

        .button-container {
            text-align: center;
            padding-top: 32px;
        }

        input[type="submit"], input[type="reset"] {
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

            input[type="submit"], input[type="reset"] {
                width: 100%;
                margin: 10px 0;
            }
        }
    </style>
</head>
<body>
<%@ include file="adminnavbar.jsp" %>
<div class="form-container">
    <h3><u>Mentor Registration</u></h3>
    <form action="insertmentor" method="post">
        <table>
            <tr>
                <td>
                    <label for="name">Name</label>
                    <input type="text" id="name" name="name" required placeholder="Enter Name" />
                </td>
                <td>
                    <label for="gender">Gender</label>
                    <select id="gender" name="gender" required>
                        <option value="">Select Gender</option>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Other">Other</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="dateOfBirth">Date of Birth</label>
                    <input type="date" id="dateOfBirth" name="dateOfBirth" required />
                </td>
                <td>
                    <label for="department">Department</label>
                    <input type="text" id="department" name="department" required placeholder="Enter Department" />
                </td>
            </tr>
            <tr>
                <td>
                    <label for="salary">Salary</label>
                    <input type="number" step="0.01" id="salary" name="salary" required placeholder="Enter Salary" />
                </td>
                <td>
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" required placeholder="Enter Email" />
                </td>
            </tr>
            <tr>
                <td>
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required placeholder="Enter Password" />
                </td>
                <td>
                    <label for="location">Location</label>
                    <input type="text" id="location" name="location" required placeholder="Enter Location" />
                </td>
            </tr>
             <tr>
                <td>
                    <label for="contact" class="form-label">Contact</label>
                    <input type="text" name="contact" placeholder="Enter Contact Number" required />
                </td>
                <td>
                      <label for="status" class="form-label">Status</label>
                      <input type="text"  name="status" placeholder="Enter Status" required>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="button-container">
                    <input type="submit" value="Add Mentor" />
                   
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
