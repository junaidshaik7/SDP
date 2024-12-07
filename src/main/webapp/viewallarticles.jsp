<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Articles</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f6f9fc 0%, #edf2f7 100%);
            margin: 0;
            padding: 20px;
            min-height: 100vh;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            animation: containerFadeIn 0.5s ease-out;
        }

        h3 {
            text-align: center;
            color: #2c5282;
            font-size: 1.8rem;
            margin: 1.5rem 0;
            text-transform: uppercase;
            letter-spacing: 2px;
            position: relative;
            padding-bottom: 10px;
            animation: fadeIn 0.8s ease-out;
        }

        h3::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background: #4299e1;
            border-radius: 2px;
        }

        .table-container {
            background: white;
            border-radius: 15px;
            padding: 1.5rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin: 20px auto;
            animation: tableAppear 0.6s ease-out;
            max-height: 500px;
            overflow-y: auto;
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            background-color: transparent;
            font-size: 0.9rem;
        }

        th, td {
            padding: 0.8rem;
            text-align: left;
            border-bottom: 1px solid #e2e8f0;
        }

        th {
            background: #2c5282;
            color: white;
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-size: 0.8rem;
            position: sticky;
            top: 0;
            z-index: 10;
        }

        th:first-child {
            border-top-left-radius: 8px;
        }

        th:last-child {
            border-top-right-radius: 8px;
        }

        tr:last-child td {
            border-bottom: none;
        }

        td {
            background: transparent;
            transition: all 0.2s ease;
        }

        tr:hover td {
            background: #ebf8ff;
        }

        tr td:first-child {
            font-weight: 500;
            color: #2c5282;
        }

        tr {
            opacity: 0;
            animation: rowFadeIn 0.5s ease-out forwards;
        }

        /* Custom Scrollbar */
        .table-container::-webkit-scrollbar {
            width: 6px;
        }

        .table-container::-webkit-scrollbar-track {
            background: #f1f1f1;
            border-radius: 3px;
        }

        .table-container::-webkit-scrollbar-thumb {
            background: #cbd5e0;
            border-radius: 3px;
        }

        .table-container::-webkit-scrollbar-thumb:hover {
            background: #a0aec0;
        }

        @keyframes tableAppear {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes rowFadeIn {
            from {
                opacity: 0;
                transform: translateX(-10px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        @keyframes containerFadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        /* Stagger animation for rows */
        <c:forEach items="${achievements}" var="stdach" varStatus="status">
            tr:nth-child(${status.index + 1}) {
                animation-delay: ${status.index * 0.05}s;
            }
        </c:forEach>

        /* Responsive design */
        @media (max-width: 768px) {
            .container {
                padding: 10px;
            }

            .table-container {
                padding: 1rem;
                margin: 10px;
            }

            th, td {
                padding: 0.6rem;
                font-size: 0.8rem;
            }

            h3 {
                font-size: 1.4rem;
            }
        }
    </style>
</head>
<body>
    <%@include file="stdhome.jsp" %>
    <div class="container">
        <h3>View All Articles</h3>
        <div class="table-container">
            <table>
                <tr>
                    <th>Article Title</th>
                    <th>Article Description</th>
                    
                </tr>
                <c:forEach items="${articles}" var="articles">
                    <tr>
                        <td><c:out value="${articles.articleTitle}"/></td>
                        <td><c:out value="${articles.articleDescription}"/></td>
                       
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</body>
</html>