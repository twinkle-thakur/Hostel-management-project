<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    com.hm.dto.Profile profile = (com.hm.dto.Profile) request.getAttribute("profile");
%>
<html>
<head>
    <title>👤 Profile</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: url('<%= request.getContextPath() %>/images/college.png') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
        }

        .overlay {
            background-color: rgba(0, 0, 0, 0.4);
            position: fixed;
            width: 100%;
            height: 100%;
            z-index: 0;
        }

        .container {
            position: relative;
            z-index: 1;
            width: 500px;
            margin: 100px auto;
            background-color: rgba(255,255,255,0.95);
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 8px 18px rgba(0,0,0,0.1);
        }

        h2 {
            color: #0078d4;
            text-align: center;
        }

        p {
            font-size: 15px;
            margin: 10px 0;
            color: #333;
        }
    </style>
</head>
<body>
    <div class="overlay"></div>
    <div class="container">
        
       <h2> Student Profile</h2>
        <p><strong>Enrollment No:</strong> <%= profile.getEnrollmentNumber() %></p>
        <p><strong>Name:</strong> <%= profile.getName() %></p>
        <p><strong>Email:</strong> <%= profile.getEmail() %></p>
        <p><strong>Branch:</strong> <%= profile.getBranch() %></p>
        <p><strong>Year:</strong> <%= profile.getYear() %></p>
        <p><strong>DOB:</strong> <%= profile.getDob() %></p>
        <p><strong>Blood Group:</strong> <%= profile.getBloodGroup() %></p>
        <p><strong>Mobile No:</strong> <%= profile.getMobileNo() %></p>
        <p><strong>Father’s Name:</strong> <%= profile.getFatherName() %></p>
        <p><strong>Father’s Mobile:</strong> <%= profile.getFatherMobile() %></p>
        <p><strong>Room ID:</strong> <%= profile.getRoomId() %></p>
   <a href="${pageContext.request.contextPath}/portal/dashboard">🔙 Back to Dashboard</a>
    </div>
</body>
</html>