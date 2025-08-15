<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>🔐 Student / Admin Login</title>
    <style>
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
        }

        .container {
            position: relative;
            z-index: 1;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            gap: 30px;
        }

        h2 {
            color: #fff;
            margin-bottom: 20px;
        }

        form {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 30px 35px;
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.2);
            width: 360px;
            display: flex;
            flex-direction: column;
        }

        input[type="text"],
        input[type="password"] {
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        input[type="submit"] {
            background-color: #2c3e50;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 6px;
            font-size: 15px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #1f2a38;
        }

        .message {
            color: #4CAF50;
            margin-top: 15px;
            font-weight: bold;
            text-align: center;
        }

        .welcome {
            text-align: center;
            font-size: 16px;
            color: #fff;
            margin-top: 5px;
        }

        .register-link {
            margin-top: 25px;
            text-align: center;
            color: #fff;
        }

        .register-link a {
            color: #ffeb3b;
            text-decoration: none;
            font-weight: bold;
        }

        .register-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="overlay"></div>
    <div class="container">
        
        <!-- Marquee Notice -->
        <marquee behavior="scroll" direction="left" scrollamount="6" onmouseover="this.stop();" onmouseout="this.start();">
            <h2>Welcome to Smart Hostel Management system.....please login or register</h2>
        </marquee>
        
        <!-- Student Login -->
        <div>
        
            <h2>🔐 Student Login</h2>
            <form action="${pageContext.request.contextPath}/portal/login" method="post">
                <input type="text" name="enrollment" required placeholder="Enrollment No">
                <input type="password" name="password" required placeholder="Password">
                <input type="submit" value="Login">
            </form>
            <% 
                String message = request.getParameter("message"); 
                String registeredName = (String) session.getAttribute("registeredName"); 
                if (message != null) { 
            %>
                <div class="message"><%= message %></div>
                <% if (registeredName != null) { %>
                    <div class="welcome">Welcome, <%= registeredName %>! 🎉</div>
                <% } %>
            <% } %>
            <div class="register-link">
                📝 New user? <a href="${pageContext.request.contextPath}/portal/newUser">Register here</a>
            </div>
            <div class="register-link">
          
           🛡️ Admin Login <a href="${pageContext.request.contextPath}/admin/login"><span>🚪</span> Login here</a>

        </div>
        </div>

        
    </div>
</body>
</html>
