<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>View All Projects</title>
    <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background-color: #121212;
            font-family: 'Arial', sans-serif;
            color: #ffffff;
            min-height: 100vh;
        }

        .main-container {
            display: flex;
            min-height: 100vh;
        }

        .navbar {
            width: 250px;
            background-color: #1c1c1c;
            padding: 20px;
            height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
            z-index: 1000;
            border-right: 1px solid #333;
        }

        .content-wrapper {
            flex: 1;
            margin-left: 250px;
            padding: 40px;
            min-height: 100vh;
            overflow-x: hidden;
        }

        .page-header {
            text-align: center;
            margin-bottom: 40px;
        }

        .page-header h2 {
            font-size: 2.5rem;
            color: #00bfff;
            margin-bottom: 1rem;
            font-weight: 700;
        }

        .page-header p {
            color: #888;
            font-size: 1.1rem;
        }

        .flashcard-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 20px;
            flex: 1;
        }

        .flashcard {
            width: 300px;
            height: 200px;
            perspective: 1000px;
            cursor: pointer;
        }

        .flashcard-inner {
            position: relative;
            width: 100%;
            height: 100%;
            text-align: center;
            transition: transform 0.8s;
            transform-style: preserve-3d;
        }

        .flashcard:hover .flashcard-inner {
            transform: rotateY(180deg);
        }

        .flashcard-front, .flashcard-back {
            position: absolute;
            width: 100%;
            height: 100%;
            backface-visibility: hidden;
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(0, 255, 255, 0.2);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 20px;
            box-sizing: border-box;
        }

        .flashcard-front {
            background-color: #1c1c1c;
        }

       

        .flashcard:nth-child(3n-2) .flashcard-front {
            border-color: rgba(255, 0, 128, 0.3);
            box-shadow: 0 0 15px rgba(255, 0, 128, 0.2);
        }

        .flashcard:nth-child(3n-1) .flashcard-front {
            border-color: rgba(0, 255, 128, 0.3);
            box-shadow: 0 0 15px rgba(0, 255, 128, 0.2);
        }

        .flashcard:nth-child(3n) .flashcard-front {
            border-color: rgba(255, 165, 0, 0.3);
            box-shadow: 0 0 15px rgba(255, 165, 0, 0.2);
        }

       .flashcard-back {
            background-color: #1c1c1c;
            transform: rotateY(180deg);
        }

        .flashcard-title {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 15px;
            line-height: 1.3;
            padding: 0 20px;
            color: #00bfff;
        }

        .flashcard:nth-child(3n-2) .flashcard-title {
            color: #ff0080;
        }

        .flashcard:nth-child(3n-1) .flashcard-title {
            color: #00ff80;
        }

        .flashcard:nth-child(3n) .flashcard-title {
            color: #ffa500;
        }

        .flashcard-description {
            font-size: 0.95rem;
            line-height: 1.6;
            color: #ffffff;
            overflow-y: auto;
            padding: 0 15px;
            margin: 15px 0;
            max-height: 150px;
            scrollbar-width: thin;
            scrollbar-color: #333 #1c1c1c;
        }

        .flashcard-description::-webkit-scrollbar {
            width: 4px;
        }

        .flashcard-description::-webkit-scrollbar-track {
            background: #1c1c1c;
            border-radius: 2px;
        }

        .flashcard-description::-webkit-scrollbar-thumb {
            background-color: #333;
            border-radius: 2px;
        }

        .flip-hint {
            font-size: 0.875rem;
            color: rgba(255, 255, 255, 0.6);
            position: absolute;
            bottom: 20px;
            width: 100%;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 5px;
        }

        .flip-hint svg {
            width: 16px;
            height: 16px;
            animation: bounce 2s infinite;
        }

        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% {
                transform: translateY(0);
            }
            40% {
                transform: translateY(-5px);
            }
            60% {
                transform: translateY(-3px);
            }
        }

        .alert {
            background-color: rgba(255, 0, 0, 0.1);
            border-left: 4px solid #ff0000;
            color: #ff6b6b;
            padding: 1rem;
            margin: 1rem 0;
            border-radius: 0.5rem;
        }

        @media (max-width: 1200px) {
            .flashcard-container {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 768px) {
            .navbar {
                width: 200px;
            }
            
            .content-wrapper {
                margin-left: 200px;
                padding: 20px;
            }

            .page-header h2 {
                font-size: 2rem;
            }

            .flashcard-container {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 640px) {
            .navbar {
                width: 80px;
            }
            
            .content-wrapper {
                margin-left: 80px;
                padding: 15px;
            }
        }
    </style>
</head>
<body>
    <div class="main-container">
        <div class="navbar">
            <%@ include file="stdhome.jsp" %>
        </div>
        <div class="content-wrapper">
            <div class="page-header">
                <h2>Student Projects</h2>
                <p>Explore and discover amazing student projects</p>
            </div>
            
            <div class="flashcard-container">
                <c:forEach var="project" items="${projects}">
                    <div class="flashcard">
                        <div class="flashcard-inner">
                            <div class="flashcard-front">
                                <div class="flashcard-title">${project.projectTitle}</div>
                                <div class="flip-hint">
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 8h10M7 12h10m-10 4h10" />
                                    </svg>
                                    Hover to see details
                                </div>
                            </div>
                            <div class="flashcard-back">
                                <div class="flashcard-title">${project.projectTitle}</div>
                                <div class="flashcard-description">${project.projectDescription}</div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <c:if test="${not empty message}">
                <div class="alert">
                    ${message}
                </div>
            </c:if>
        </div>
    </div>
</body>
</html>
