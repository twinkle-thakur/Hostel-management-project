<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>📝 Student Registration</title>
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
            margin: 50px auto;
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 8px 18px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #0078d4;
        }

        label {
            font-weight: bold;
            margin-top: 10px;
            display: block;
        }

        input, select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            margin-bottom: 15px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        input[type="submit"] {
            background-color: #0078d4;
            color: white;
            border: none;
            font-weight: bold;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #005ea2;
        }

        .error-message {
            color: red;
            text-align: center;
            margin-top: 10px;
        }
         #back {
            padding: 12px;
            
            color: yellow;
            text-decoration: none;
          
            font-weight: bold;
            transition: all 0.3s ease;
        }

        #back :hover {
            text-decoration:underline;
            transform: scale(1.03);
        }
    </style>
</head>
<body>
    <div class="overlay"></div>

    <div class="container">
        <h2>Register a New Student</h2>
        <form action="registration" method="post">
            <label>Enrollment No:</label>
            <input type="text" name="enrollment" required>

            <label>Name:</label>
            <input type="text" name="name" required>

            <label>Email:</label>
            <input type="email" name="email" required>

            <label>Password:</label>
            <input type="password" name="password" required>

            <label>Branch:</label>
            <select name="branch" required>
                <option value="">Select Branch</option>
                <option value="cse">cse</option>
                <option value="ME">ME</option>
                <option value="civil">civil</option>
                <option value="IT">IT</option>
                <option value="EC">EC</option>
                <option value="EX">EX</option>
            </select>

            <label>Year:</label>
            <select name="year" required>
                <option value="">Select Year</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
            </select>

            <label>Date of Birth:</label>
            <input type="date" name="dob" required>

            <label>Blood Group:</label>
            <select name="blood_group" required onchange="toggleOtherBlood(this)">
                <option value="">Select Blood Group</option>
                <option value="A+">A+</option>
                <option value="A-">A-</option>
                <option value="B+">B+</option>
                <option value="B-">B-</option>
                <option value="AB+">AB+</option>
                <option value="AB-">AB-</option>
                <option value="O+">O+</option>
                <option value="O-">O-</option>
                <option value="Other">Other</option>
            </select>
            <input type="text" name="blood_group_other" placeholder="Enter Blood Group" style="display:none;" id="bloodOther">

            <label>Mobile:</label>
            <input type="tel" name="mobile" required>

            <label>Father's Name:</label>
            <input type="text" name="father_name" required>

            <label>Father's Mobile:</label>
            <input type="tel" name="father_mobile" required>

            <label>Room ID:</label>
            <input type="text" name="room_id" required>

            <input type="submit" value="Register">
        </form>

        <div class="error-message">
            <%= request.getParameter("error") != null ? request.getParameter("error") : "" %>
        </div>
        <div id="back"> <a href="${pageContext.request.contextPath}/portal/"><span>🚪</span> Back </a></div>
       
    </div>

    <script>
        function toggleOtherBlood(select) {
            var otherInput = document.getElementById('bloodOther');
            if(select.value === 'Other') {
                otherInput.style.display = 'block';
                otherInput.required = true;
            } else {
                otherInput.style.display = 'none';
                otherInput.required = false;
            }
        }
    </script>
</body>
</html>
