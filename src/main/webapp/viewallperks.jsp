<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Perks</title>
    <style>
        body {
            background-color: #121212;
            font-family: 'Arial', sans-serif;
            color: #ffffff;
            margin: 0;
            padding: 20px;
        }

        .main-container {
            display: flex;
        }

        .navbar {
            width: 200px;
            background-color: #1c1c1c;
            padding: 15px;
            border-right: 1px solid #333;
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

        .flashcard-back {
            background-color: #1c1c1c;
            transform: rotateY(180deg);
        }

        .perk-title {
            font-size: 24px;
            font-weight: bold;
            color: #00bfff;
            margin-bottom: 15px;
            text-align: center;
        }

        .perk-description {
            font-size: 14px;
            color: #ffffff;
            line-height: 1.4;
            overflow-y: auto;
            max-height: 100px;
            text-align: center;
            padding: 10px;
        }

        .perk-author {
            font-size: 12px;
            color: #00bfff;
            position: absolute;
            bottom: 15px;
            width: 100%;
            text-align: center;
        }

        .flip-hint {
            font-size: 12px;
            color: #666;
            position: absolute;
            bottom: 10px;
            width: 100%;
            text-align: center;
        }

        h2 {
            color: #00bfff;
            text-align: center;
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
    <div class="main-container">
        <%@include file="stdhome.jsp" %>
        <div class="content">
            <h2>Student Perks</h2>
            <div class="flashcard-container">
                <!-- Top Academic Award -->
                <div class="flashcard">
                    <div class="flashcard-inner">
                        <div class="flashcard-front">
                            <div class="perk-title">Top Academic Award</div>
                            <div class="flip-hint">Hover to see details</div>
                        </div>
                        <div class="flashcard-back">
                            <div class="perk-description">
                                This prestigious award is given to students who demonstrate exceptional academic performance and community involvement.
                            </div>
                            <div class="perk-author">— KL University</div>
                        </div>
                    </div>
                </div>

                <!-- Hackathon Champion -->
                <div class="flashcard">
                    <div class="flashcard-inner">
                        <div class="flashcard-front">
                            <div class="perk-title">Hackathon Champion</div>
                            <div class="flip-hint">Hover to see details</div>
                        </div>
                        <div class="flashcard-back">
                            <div class="perk-description">
                                Awarded for outstanding performance in coding challenges and collaborative problem-solving during hackathons.
                            </div>
                            <div class="perk-author">— J. Surya Kiran</div>
                        </div>
                    </div>
                </div>

                <!-- Community Leadership Award -->
                <div class="flashcard">
                    <div class="flashcard-inner">
                        <div class="flashcard-front">
                            <div class="perk-title">Community Leadership Award</div>
                            <div class="flip-hint">Hover to see details</div>
                        </div>
                        <div class="flashcard-back">
                            <div class="perk-description">
                                Recognized for contributions to student clubs and leadership in organizing successful events and workshops.
                            </div>
                            <div class="perk-author">— Club President</div>
                        </div>
                    </div>
                </div>

                <!-- Innovation Award -->
                <div class="flashcard">
                    <div class="flashcard-inner">
                        <div class="flashcard-front">
                            <div class="perk-title">Innovation Award</div>
                            <div class="flip-hint">Hover to see details</div>
                        </div>
                        <div class="flashcard-back">
                            <div class="perk-description">
                                Honored for creative problem-solving and developing unique project solutions that impact the community positively.
                            </div>
                            <div class="perk-author">— Innovation </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>