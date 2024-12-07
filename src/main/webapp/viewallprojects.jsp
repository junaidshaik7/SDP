<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Spring Boot Projects</title>
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
            background-image: url('viewprojects.jpg');
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

        h3 {
            text-align: center;
            color: #ffffff;
            font-size: 24px;
            margin-top: 30px;
            text-decoration: underline;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            animation: slideIn 0.8s ease-out;
        }

        #myInput {
            width: 40%;
            padding: 10px;
            margin: 20px auto;
            display: block;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        .table-container {
            max-width: 1200px;
            margin: 0 auto;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 15px;
            text-align: left;
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
            color: #3498db;
            font-weight: bold;
            padding: 5px 10px;
            border-radius: 4px;
            transition: all 0.3s ease;
        }

        a:hover {
            background-color: #3498db;
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

    <script>
        function myFunction() {
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("myInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("myTable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[1]; // Assuming the project name is in the second column
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
    </script>
</head>

<body>
    <%@ include file="adminnavbar.jsp" %>
    <div class="content-wrapper">
        <h3><u>View All Projects</u></h3>
        <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Enter Project Name">

        <div class="table-container">
            <table id="myTable">
                <tr class="header">
                    <th>ID</th>
                    <th>Project Title</th>
                    <th>Category</th>
                    <th>Description</th>
                    <th>Document</th>
                </tr>

                <c:forEach items="${projectlist}" var="project">
                    <tr>
                        <td><c:out value="${project.id}"></c:out></td>
                        <td><c:out value="${project.projectTitle}"></c:out></td>
                        <td><c:out value="${project.category}"></c:out></td>
                        <td><c:out value="${project.projectDescription}"></c:out></td>
                        <td>
                            <a href="<c:url value='/downloadProjectDoc?id=${project.id}'/>">Download Document</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</body>

</html>
