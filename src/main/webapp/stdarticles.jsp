<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Article Management</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .logo-section {
            text-align: center;
            margin: 2rem 0;
            animation: fadeIn 1s ease-in;
        }

        .logo-icon {
            font-size: 3.5rem;
            margin-bottom: 0.5rem;
            color: #2c3e50;
        }

        .logo-text {
            font-size: 2rem;
            color: #2c3e50;
            font-weight: bold;
            margin: 0;
        }

        .nav-buttons {
            display: flex;
            gap: 1.5rem;
            margin-bottom: 2rem;
            padding: 0 1rem;
        }

        .nav-btn {
            padding: 1rem 2rem;
            border: none;
            border-radius: 12px;
            font-weight: 600;
            font-size: 1.1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            text-align: center;
            min-width: 160px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .nav-btn.active {
            background: #4CAF50;
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(76, 175, 80, 0.2);
        }

        .nav-btn:not(.active) {
            background: #ffffff;
            color: #2c3e50;
        }

        .nav-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        }

        .main-content {
            width: 100%;
            max-width: 900px;
            padding: 0 1rem;
            box-sizing: border-box;
            animation: slideUp 0.5s ease-out;
        }

        .form-container {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            padding: 2.5rem;
            backdrop-filter: blur(10px);
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        label {
            display: block;
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 0.5rem;
            font-size: 1rem;
        }

        input[type="text"],
        select,
        textarea {
            width: 100%;
            padding: 0.875rem;
            border: 2px solid #e0e0e0;
            border-radius: 12px;
            font-size: 1rem;
            transition: all 0.3s ease;
            box-sizing: border-box;
            background: white;
        }

        input[type="text"]:focus,
        select:focus,
        textarea:focus {
            border-color: #4CAF50;
            outline: none;
            box-shadow: 0 0 0 3px rgba(76, 175, 80, 0.1);
        }

        textarea {
            min-height: 150px;
            resize: vertical;
        }

        .file-upload {
            border: 2px dashed #4CAF50;
            border-radius: 12px;
            padding: 2rem;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
            background: rgba(76, 175, 80, 0.05);
            margin-bottom: 1.5rem;
        }

        .file-upload:hover {
            background: rgba(76, 175, 80, 0.1);
            border-color: #45a049;
        }

        .upload-area {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 0.75rem;
        }

        .upload-icon {
            font-size: 2.5rem;
            color: #4CAF50;
        }

        .upload-text {
            font-weight: 600;
            color: #2c3e50;
            font-size: 1.1rem;
        }

        .upload-hint {
            font-size: 0.9rem;
            color: #666;
        }

        input[type="file"] {
            display: none;
        }

        .button-group {
            display: flex;
            gap: 1rem;
            margin-top: 2rem;
        }

        .btn {
            padding: 1rem 1.5rem;
            border: none;
            border-radius: 12px;
            font-weight: 600;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            flex: 1;
            text-align: center;
        }

        .save {
            background: #e0e0e0;
            color: #2c3e50;
        }

        .submit {
            background: #4CAF50;
            color: white;
            box-shadow: 0 4px 6px rgba(76, 175, 80, 0.2);
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        }

        .submit:hover {
            background: #45a049;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @media (max-width: 768px) {
            .nav-buttons {
                flex-direction: column;
                width: 100%;
                padding: 0 1rem;
            }

            .nav-btn {
                width: 100%;
            }

            .form-container {
                padding: 1.5rem;
            }

            .button-group {
                flex-direction: column;
            }

            .logo-text {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <%@ include file="stdhome.jsp" %>

    <div class="logo-section">
        <div class="logo-icon">📚</div>
        <h1 class="logo-text">Article Management System</h1>
    </div>

    <div class="nav-buttons">
        
        <a href="viewallarticles" class="nav-btn">View Articles</a>
    </div>

    <div class="main-content">
        <div class="form-container">
            <%
                String ArticleTitle = request.getParameter("title");
                String ArticleDescription = request.getParameter("description");
                String category = request.getParameter("category");
            %>
            <form action="submitarticle" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="articleTitle">Article Title</label>
                    <input type="text" 
                           id="articleTitle" 
                           name="articleTitle" 
                           value="<%= ArticleTitle != null ? ArticleTitle : "" %>" 
                           required
                           placeholder="Enter a descriptive title for your article">
                </div>

                <div class="form-group">
                    <label for="category">Category</label>
                    <select id="category" name="category" required>
                        <option value="" disabled selected>Select a category</option>
                        <option value="web" <%= "web".equals(category) ? "selected" : "" %>>Web Development</option>
                        <option value="mobile" <%= "mobile".equals(category) ? "selected" : "" %>>Mobile Development</option>
                        <option value="ai" <%= "ai".equals(category) ? "selected" : "" %>>Artificial Intelligence</option>
                        <option value="data" <%= "data".equals(category) ? "selected" : "" %>>Data Science</option>
                        <option value="other" <%= "other".equals(category) ? "selected" : "" %>>Other</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="articleDescription">Article Description</label>
                    <textarea id="articleDescription" 
                              name="articleDescription" 
                              required
                              placeholder="Provide a detailed description of your article"><%= ArticleDescription != null ? ArticleDescription : "" %></textarea>
                </div>

                <div class="file-upload">
                    <label for="mediaUpload">
                        <div class="upload-area">
                            <span class="upload-icon">📁</span>
                            <span class="upload-text">Click to upload project files</span>
                            <span class="upload-hint">Supports images, documents, and zip files up to 10MB</span>
                        </div>
                    </label>
                    <input type="file" 
                           id="mediaUpload" 
                           name="mediaUpload" 
                           accept=".jpg,.jpeg,.png,.pdf,.zip,.doc,.docx"
                           multiple>
                </div>

                <div class="button-group">
                    <button type="submit" name="action" value="save" class="btn save">
                        Save Draft
                    </button>
                    <button type="submit" name="action" value="submit" class="btn submit">
                        Submit Article
                    </button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>