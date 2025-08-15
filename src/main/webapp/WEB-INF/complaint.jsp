<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>🛠 Lodge a Complaint</title>
    <style>
        body {
            font-family: 'Segoe UI'; background: url('<%= request.getContextPath() %>/images/college.png') no-repeat center center fixed;
            background-size: cover; margin: 0; padding: 0;
        }
        .overlay { background-color: rgba(0,0,0,0.4); position: fixed; width: 100%; height: 100%; z-index: 0; }
        .container {
            position: relative; z-index: 1; max-width: 550px; margin: 100px auto;
            background-color: rgba(255,255,255,0.95); padding: 30px; border-radius: 8px;
            box-shadow: 0 8px 18px rgba(0,0,0,0.1); text-align: center;
        }
        select, textarea {
            width: 100%; padding: 10px; margin-bottom: 15px;
            border: 1px solid #ccc; border-radius: 6px; font-size: 14px;
        }
        input[type="submit"] {
            background-color: #0078d4; color: white;
            padding: 12px; border: none; border-radius: 6px; font-weight: bold;
            cursor: pointer; transition: background 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #005ea2;
        }
        .error {
            color: red; margin-bottom: 10px; font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="overlay"></div>
    <div class="container">
        <h2>🛠 Lodge a Complaint</h2>
  
<% String successMsg = request.getParameter("message");
   if (successMsg != null) { %>
    <div style="color: green; font-weight: bold; margin-bottom: 10px;">
        <%= successMsg %>
    </div>
<% } %>

<% if (request.getAttribute("error") != null) { %>
    <div class="error"><%= request.getAttribute("error") %></div>
<% } %>
        <form action="${pageContext.request.contextPath}/portal/submitComplaint" method="post">
            <select name="type" required>
                <option value="">-- Select Complaint Type --</option>
                <option value="Food">🍽 Food</option>
                <option value="Water">🚰 Water</option>
                <option value="Electricity">💡 Electricity</option>
                <option value="Cleanliness">🧹 Cleanliness</option>
                <option value="Internet">🌐 Internet</option>
            </select>
            <textarea name="description" required placeholder="Describe your issue briefly..."></textarea>
            <input type="submit" value="Submit Complaint"> 
            <br/>  <br/>
        <a href="${pageContext.request.contextPath}/portal/dashboard">🔙 Back to Dashboard</a>
        </form>
    </div>
</body>
</html>