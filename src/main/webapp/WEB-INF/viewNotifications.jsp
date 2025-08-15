<%@ page import="java.util.List" %>
<%@ page import="com.hm.dto.Notification" %>
<%
    List<Notification> notifications = (List<Notification>) request.getAttribute("notifications");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Notifications</title>
    <style>
        /* Full-page background */
       body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    margin: 0;
    padding: 0;
    background: url('<%= request.getContextPath() %>/images/college.png') no-repeat center center fixed;
    background-size: cover;
}


        /* Overlay for better readability */
        .overlay {
            position: fixed;
            top: 0; left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.4);
            z-index: 0;
        }

        /* Container for content */
        .container {
            position: relative;
            z-index: 1;
            padding: 30px;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h2 {
            color: #fff;
            margin-bottom: 25px;
            text-shadow: 1px 1px 4px rgba(0,0,0,0.7);
        }

        .notification {
            background: white;
            margin: 10px 0;
            padding: 15px 20px;
            width: 400px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
            animation: fadeInUp 0.5s ease-in-out;
        }

        .notification strong {
            font-size: 16px;
        }

        .notification small {
            color: #555;
        }

        @keyframes fadeInUp {
            from { transform: translateY(20px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        /* Back to dashboard button */
        .back-btn {
            margin-top: 20px;
            text-decoration: none;
            color: #fff;
            background-color: #2c3e50;
            padding: 10px 20px;
            border-radius: 6px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.3);
            transition: background 0.3s ease;
        }
        .back-btn:hover {
            background-color: #1f2a38;
        }

        p {
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="overlay"></div>
    <div class="container">
        <h2>Notifications</h2>
        <%
        if (notifications != null && !notifications.isEmpty()) {
            for (Notification n : notifications) {
        %>
            <div class="notification">
                <strong><%= n.getMessage() %></strong><br>
                <small><%= n.getCreatedAt() %></small>
            </div>
        <%
            }
        } else {
        %>
            <p>No notifications yet.</p>
        <%
        }
        %>
        <a class="back-btn" href="<%= request.getContextPath() %>/portal/dashboard">← Back to Dashboard</a>
    </div>
</body>
</html>
