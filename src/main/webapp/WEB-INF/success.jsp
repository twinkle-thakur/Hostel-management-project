<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>🎉 Registration Success</title>
<style>
    body {
        margin: 0;
        padding: 0;
        font-family: 'Segoe UI', sans-serif;
        background: url('<%= request.getContextPath() %>/images/college.png') no-repeat center center fixed;
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
        width: 500px;
        margin: 100px auto;
        background-color: rgba(255, 255, 255, 0.95);
        border-radius: 8px;
        padding: 40px;
        box-shadow: 0 8px 18px rgba(0, 0, 0, 0.1);
        text-align: center;
    }

    h1 {
        color: #0078d4;
        margin-bottom: 20px;
    }

    p {
        font-size: 16px;
        color: #333;
    }

    a {
        color: #0078d4;
        text-decoration: none;
        font-weight: bold;
    }

    a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
    <div class="overlay"></div>

    <div class="container">
        <h1>Your registration has been successfully submitted</h1>
        <br/>
        <p>Login <a href="/">here</a></p>
    </div>
</body>
</html>