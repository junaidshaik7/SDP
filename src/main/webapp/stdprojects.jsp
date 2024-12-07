<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Project Details</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            display: flex;
        }

        .main-content {
            flex-grow: 1;
            margin-left: 250px;
            transition: 0.3s;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
            box-sizing: border-box;
        }

        .main-content.expanded {
            margin-left: 80px;
        }

        .form-container {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            padding: 2rem;
            width: 100%;
            max-width: 800px;
            margin: auto;
        }

        .glass-form {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }

        label {
            font-weight: bold;
            color: #333;
            font-size: 0.95rem;
        }

        input[type="text"],
        select,
        textarea {
            padding: 0.75rem;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 1rem;
            width: 100%;
            box-sizing: border-box;
            background: white;
        }

        textarea {
            min-height: 120px;
            resize: vertical;
        }

        .file-upload {
            border: 2px dashed #ccc;
            border-radius: 8px;
            padding: 1.5rem;
            text-align: center;
            cursor: pointer;
            transition: border-color 0.3s ease;
        }

        .file-upload:hover {
            border-color: #666;
        }

        .upload-area {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 0.5rem;
        }

        .upload-icon {
            font-size: 2rem;
        }

        .upload-text {
            font-weight: bold;
            color: #333;
        }

        .upload-hint {
            font-size: 0.8rem;
            color: #666;
        }

        input[type="file"] {
            display: none;
        }

        .button-group {
            display: flex;
            gap: 1rem;
            margin-top: 1rem;
        }

        .btn {
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
            transition: transform 0.2s ease;
            flex: 1;
        }

        .btn:hover {
            transform: translateY(-2px);
        }

        .save {
            background: #e0e0e0;
            color: #333;
        }

        .submit {
            background: #4CAF50;
            color: white;
        }

        @media (max-width: 768px) {
            .main-content {
                margin-left: 80px;
                padding: 1rem;
            }
            
            .form-container {
                padding: 1rem;
            }

            .button-group {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <%@ include file="stdhome.jsp" %>
    
    
    <div class="main-content">
        <div class="form-container">
            <%
                String projectTitle = request.getParameter("title");
                String projectDescription = request.getParameter("description");
                String category = request.getParameter("category");
                String milestones = request.getParameter("milestones");
            %>
            <form action="submitProject" method="post" enctype="multipart/form-data" class="glass-form">
                <div class="form-group">
                    <label for="projectTitle">Project Title</label>
                    <input type="text" 
                           id="projectTitle" 
                           name="projectTitle" 
                           value="<%= projectTitle != null ? projectTitle : "" %>" 
                           required
                           placeholder="Enter project title">
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
                    <label for="projectDescription">Project Description</label>
                    <textarea id="projectDescription" 
                              name="projectDescription" 
                              required
                              placeholder="Describe your project in detail"><%= projectDescription != null ? projectDescription : "" %></textarea>
                </div>

                <div class="form-group">
                    <label for="milestones">Project Milestones</label>
                    <textarea id="milestones" 
                              name="milestones" 
                              required
                              placeholder="List your project milestones"><%= milestones != null ? milestones : "" %></textarea>
                </div>

                <div class="form-group file-upload">
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
                        Submit Project
                    </button>
                </div>
            </form>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const mainContent = document.querySelector('.main-content');
            const navbar = document.querySelector('.navbar');
            
            if (navbar.classList.contains('collapsed')) {
                mainContent.classList.add('expanded');
            }
            
            document.querySelector('.toggle-btn').addEventListener('click', () => {
                mainContent.classList.toggle('expanded');
            });
        });
    </script>
</body>
</html>