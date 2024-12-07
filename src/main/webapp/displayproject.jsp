<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Spring Boot Project</title>
    
    <style>
        /* Centering and styling the card */
        .card {
            width: 40%;
            margin: auto;
            padding: 20px;
            text-align: center;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            background-color: #f9f9f9;
        }

        /* Styling for headings and paragraphs within the card */
        .card h1, .card h2 {
            color: #333;
            margin: 10px 0;
        }

        .card p {
            color: #555;
            margin: 10px 0;
            font-size: 16px;
        }

        /* Styling the link */
        .card a {
            color: #4CAF50;
            text-decoration: none;
            font-weight: bold;
        }

        .card a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>

<%@ include file="adminnavbar.jsp" %>

<br><br>

<h3 align="center"><u>Project Details</u></h3>

<br>

<div class="card">
    <!-- Displaying project details -->
    <h1>${project.projectTitle}</h1>
    <p>${project.projectDescription}</p>
    <p><a href="downloadprojectdoc?id=${project.id}" target="_new">Download Documentation</a></p>
</div>

</body>
</html>
