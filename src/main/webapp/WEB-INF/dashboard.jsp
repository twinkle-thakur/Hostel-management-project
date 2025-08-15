<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("enrollment") == null) {
        response.sendRedirect("../index.jsp?error=Please login first");
        return;
    }
%>
<html>
<head>
    <title>Dashboard</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            background: url('<%= request.getContextPath() %>/images/college.png') no-repeat center center fixed;
            background-size: cover;
        }

        /* Dark overlay to make text readable */
        .overlay {
            background-color: rgba(0, 0, 0, 0.5);
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }

        /* Main card */
        .container {
            position: relative;
            max-width: 600px;
            margin: 100px auto;
            background-color: rgba(255, 255, 255, 0.97);
            border-radius: 12px;
            padding: 35px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
            text-align: center;
            z-index: 1;
        }

        h2 {
            color: #0078d4;
            margin-bottom: 15px;
            font-size: 26px;
        }

        /* Success / message box */
        .message {
            background-color: #e6f7e6;
            border: 1px solid #28a745;
            color: #155724;
            padding: 10px;
            border-radius: 6px;
            margin-bottom: 20px;
            font-weight: bold;
            animation: fadeIn 0.5s ease-in-out;
        }

        /* Navigation buttons */
        .menu {
            display: flex;
            flex-direction: column;
            gap: 12px;
            margin-top: 15px;
        }

        .menu a {
            padding: 12px;
            background-color: #0078d4;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            transition: all 0.3s ease;
        }

        .menu a:hover {
            background-color: #005ea2;
            transform: scale(1.03);
        }

        /* Button Icons */
        .menu a span {
            margin-right: 8px;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-5px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <div class="overlay"></div>

    <div class="container">
        <h2>Welcome, <%= session.getAttribute("enrollment") %></h2>

        <% String msg = request.getParameter("message");
           if (msg != null) { %>
            <div class="message">
                <%= msg %>
            </div>
        <% } %>

        <div class="menu">
            <a href="${pageContext.request.contextPath}/portal/profile"><span>👤</span> View Profile</a>
            
            <a href="${pageContext.request.contextPath}/portal/complaint"><span>🛠</span> Lodge a Complaint</a>
            <a href="${pageContext.request.contextPath}/portal/viewNotifications"><span>🔔</span> View Notifications</a>
            <a href="${pageContext.request.contextPath}/portal/logout"><span>🚪</span> Logout</a>
        </div>
    </div>
</body>
</html>
