<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Student</title>
    <style>
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes slideIn {
            from { transform: translateX(-100%); }
            to { transform: translateX(0); }
        }

        body {
            background-image: url('delete.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: #ffffff;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            min-height: 100vh;
        }

        .content-wrapper {
            flex: 1;
            margin-left: 200px;
            padding: 20px;
            animation: fadeIn 0.8s ease-out;
        }

        .table-container {
            max-width: 1200px;
            margin: 0 auto;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
        }

        h3 {
            text-align: center;
            color: #ffffff;
            font-size: 24px;
            margin-bottom: 30px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            animation: slideIn 0.8s ease-out;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: transparent;
            margin-top: 20px;
        }

        th, td {
            padding: 15px;
            text-align: center;
            border: 1px solid #ddd;
            transition: all 0.3s ease;
        }

        th {
            background-color: #2c3e50;
            color: white;
            font-weight: bold;
            text-transform: uppercase;
        }

        tr {
            animation: fadeIn 0.5s ease-out;
        }

        tr:nth-child(even) {
            background-color: rgba(242, 242, 242, 0.9);
        }

        tr:nth-child(odd) {
            background-color: rgba(255, 255, 255, 0.9);
        }

        tr:hover {
            background-color: rgba(52, 152, 219, 0.1);
            transform: scale(1.01);
        }

        td {
            color: #333;
        }

        a {
            text-decoration: none;
            color: #e74c3c;
            font-weight: bold;
            padding: 5px 10px;
            border-radius: 4px;
            transition: all 0.3s ease;
        }

        a:hover {
            background-color: #e74c3c;
            color: white;
        }

        /* Responsive design */
        @media (max-width: 1200px) {
            .content-wrapper {
                margin-left: 0;
                padding: 10px;
            }

            table {
                font-size: 14px;
            }

            th, td {
                padding: 10px 5px;
            }
        }

        /* Custom scrollbar */
        .table-container::-webkit-scrollbar {
            width: 8px;
            height: 8px;
        }

        .table-container::-webkit-scrollbar-track {
            background: #f1f1f1;
        }

        .table-container::-webkit-scrollbar-thumb {
            background: #888;
            border-radius: 4px;
        }

        .table-container::-webkit-scrollbar-thumb:hover {
            background: #555;
        }
    </style>
</head>
<body>
    <%@include file="adminnavbar.jsp" %>
    <div class="content-wrapper">
        <h3><u>Delete Student</u></h3>
        <div class="table-container">
            <table>
                <tr>
                    <th>ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Gender</th>
                    <th>Date of Birth</th>
                    <th>Department</th>
                    <th>Location</th>
                    <th>Email</th>
                    <th>Contact</th>
                    <th>Action</th>
                </tr>
                <c:forEach items="${stulist}" var="stu" varStatus="status">
                    <tr style="animation-delay: ${status.index * 0.1}s">
                        <td><c:out value="${stu.id}"/></td>
                        <td><c:out value="${stu.firstname}"/></td>
                        <td><c:out value="${stu.lastname}"/></td>
                        <td><c:out value="${stu.gender}"/></td>
                        <td><c:out value="${stu.dateofbirth}"/></td>
                        <td><c:out value="${stu.department}"/></td>
                        <td><c:out value="${stu.location}"/></td>
                        <td><c:out value="${stu.email}"/></td>
                        <td><c:out value="${stu.contact}"/></td>
                        <td>
                            <a href='<c:url value="delete?id=${stu.id}"/>'>Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</body>
</html>
