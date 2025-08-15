<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>🔐 Admin Login</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url('<%=request.getContextPath()%>/images/college.png') no-repeat center center fixed;
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

        form {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 30px 35px;
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.2);
            width: 360px;
            display: flex;
            flex-direction: column;
        }

        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
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

        .error {
            color: red;
            margin-top: 15px;
            font-weight: bold;
            text-align: center;
        }
        #log{
        color:white;
        font-weight: bold;
        }
        #log a{
        color:yellow;
        font-weight: bold;
        text-decoration:none;
        }
        #log a:hover{
      text-decoration:underline;
        }
    </style>
</head>
<body>
    <div class="overlay"></div>
    <div class="container">
        <form action="<%=request.getContextPath()%>/admin/login" method="post">
            <h2>🔐 Admin Login</h2>

            <% if (request.getAttribute("error") != null) { %>
                <div class="error"><%= request.getAttribute("error") %></div>
            <% } %>

            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="submit" value="Login">
        </form>
        <div id="log">
         🔐 Student Login <a href="${pageContext.request.contextPath}/portal/login"><span>🚪</span> Login here</a>
        </div>
       
    </div>
</body>
</html>
