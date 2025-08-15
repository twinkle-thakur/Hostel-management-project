<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession session1 = request.getSession(false);

    if (session1 == null || session1.getAttribute("adminUser") == null) {
        request.getRequestDispatcher("/WEB-INF/adminLogin.jsp").forward(request, response);
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        /* Background */
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url('images/college.png') no-repeat center center fixed;
            background-size: cover;
        }

        .overlay {
            background-color: rgba(0, 0, 0, 0.4);
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 0;
        }

        .container {
            position: relative;
            z-index: 1;
            padding: 30px;
            max-width: 600px;
            margin: 50px auto;
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.2);
        }

        h1, h2 {
            text-align: center;
            color: #333;
        }

        .logout {
            float: right;
            text-decoration: none;
            color: #fff;
            background-color: #e74c3c;
            padding: 8px 12px;
            border-radius: 6px;
            transition: 0.3s;
        }

        .logout:hover {
            background-color: #c0392b;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
            margin-top: 20px;
        }

        input[type="text"] {
            padding: 12px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        input[type="submit"] {
            background-color: #2c3e50;
            color: #fff;
            padding: 12px;
            border: none;
            border-radius: 6px;
            font-size: 15px;
            cursor: pointer;
            transition: 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #1f2a38;
        }

        .message {
            color: green;
            font-weight: bold;
            text-align: center;
        }

        .error {
            color: red;
            font-weight: bold;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="overlay"></div>

    <div class="container">
        <a class="logout" href="${pageContext.request.contextPath}/admin/logout">Logout</a>
        <h1>Welcome, <%= session1.getAttribute("adminUser") %></h1>

        <h2>Add Notification</h2>
        <form action="${pageContext.request.contextPath}/admin/addNotification" method="post">
            <input type="text" name="title" placeholder="Enter notification title" required>
            <input type="text" name="message" placeholder="Enter notification message" required>
            <input type="submit" value="Add Notification">
        </form>

        <% if (request.getParameter("msg") != null) { %>
            <div class="message"><%= request.getParameter("msg") %></div>
        <% } %>
        <% if (request.getAttribute("error") != null) { %>
            <div class="error"><%= request.getAttribute("error") %></div>
        <% } %>
    </div>
</body>
</html>
