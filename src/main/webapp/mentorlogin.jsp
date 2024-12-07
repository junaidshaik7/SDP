<%-- <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mentor Login</title>
    <link rel="stylesheet" type="text/css" href="styles.css"> <!-- Link to your CSS file -->
</head>
<body>
    <h1>Mentor Login</h1>
    <form action="checkmentorlogin" method="post">
        <div>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <button type="submit">Login</button>
    </form>
    
    <c:if test="${not empty message}">
        <p style="color:red">${message}</p> <!-- Display login error message -->
    </c:if>
</body>
</html> --%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
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
            max-width: 420px;
            box-shadow: 0 4px 20px rgba(138, 135, 165, 0.15);
        }

        .logo-container {
            background: #e8e5ff;
            width: 56px;
            height: 56px;
            border-radius: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 24px;
        }

        .logo {
            width: 32px;
            height: 32px;
            color: #6b5ecd;
        }

        h3 {
            color: #4a4865;
            font-size: 24px;
            margin-bottom: 32px;
            text-align: center;
            font-weight: 600;
        }

        .input-group {
            margin-bottom: 24px;
        }

        label {
            color: #6b6885;
            font-size: 14px;
            font-weight: 500;
            display: block;
            margin-bottom: 8px;
        }

        input[type="text"],
        input[type="password"] {
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
        input[type="password"]::placeholder {
            color: #a8a5c1;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            outline: none;
            border-color: #6b5ecd;
            background: white;
            box-shadow: 0 0 0 4px rgba(107, 94, 205, 0.1);
        }

        .button-group {
            display: flex;
            flex-direction: column;
            gap: 12px;
            margin-top: 32px;
        }

        .submit-btn {
            padding: 12px 24px;
            border: none;
            border-radius: 12px;
            background: #6b5ecd;
            color: white;
            font-weight: 600;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .reset-btn {
            padding: 12px 24px;
            border: 1px solid #e8e5ff;
            border-radius: 12px;
            background: white;
            color: #6b5ecd;
            font-weight: 500;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .submit-btn:hover {
            transform: translateY(-2px);
            background: #5d51b6;
            box-shadow: 0 4px 12px rgba(107, 94, 205, 0.2);
        }

        .reset-btn:hover {
            background: #fcfbff;
            border-color: #6b5ecd;
        }

        @media (max-width: 480px) {
            .form-container {
                padding: 24px;
            }

            .button-group {
                gap: 8px;
            }
        }
    </style>
</head>
<body>
    <div class="form-container">
        <div class="logo-container">
            <svg class="logo" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 11c0 3.517-1.009 6.799-2.753 9.571m-3.44-2.04l.054-.09A13.916 13.916 0 008 11a4 4 0 118 0c0 1.017-.07 2.019-.203 3m-2.118 6.844A21.88 21.88 0 0015.171 17m3.839 1.132c.645-2.266.99-4.659.99-7.132A8 8 0 008 4.07M3 15.364c.64-1.319 1-2.8 1-4.364 0-1.457.39-2.823 1.07-4"></path>
            </svg>
        </div>
        <h3>Mentor Login</h3>
        <form action="checkmentorlogin" method="post">
            <div class="input-group">
                <label for="email">User Name</label>
                <input type="text" id="email" name="email" required placeholder="Enter your Username">
            </div>
            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required placeholder="Enter your password">
            </div>
            <div class="button-group">
                <button type="submit" class="submit-btn">Sign In</button>
                <button type="reset" class="reset-btn">Clear</button>
            </div>
        </form>
    </div>
</body>
</html>