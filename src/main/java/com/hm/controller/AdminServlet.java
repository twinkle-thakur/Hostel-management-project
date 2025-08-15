package com.hm.controller;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.hm.jdbc.utils.JdbcUtils;

@WebServlet("/admin/*")
public class AdminServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String pathInfo = request.getPathInfo(); // /login, /addNotification, etc.
        if (pathInfo == null || pathInfo.equals("/")) {
            // Always forward to WEB-INF for login
            request.getRequestDispatcher("/WEB-INF/adminLogin.jsp").forward(request, response);
            return;
        }

        switch (pathInfo) {
            case "/login":
                adminLogin(request, response);
                break;

            case "/addNotification":
                addNotification(request, response);
                break;

            case "/logout":
                HttpSession session = request.getSession(false);
                if (session != null) session.invalidate();
                request.setAttribute("msg", "Logged out successfully");
                request.getRequestDispatcher("/WEB-INF/adminLogin.jsp").forward(request, response);
                break;

            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    private void adminLogin(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Hardcoded or from DB — change as needed
        if ("khushi".equals(username) && "khushi".equals(password)) {
            HttpSession session = request.getSession();
            session.setAttribute("adminUser", username);

            // adminDashboard.jsp is outside WEB-INF → redirect
            response.sendRedirect(request.getContextPath() + "/adminDashboard.jsp");
        } else {
           
            request.getRequestDispatcher("/WEB-INF/adminLogin.jsp").forward(request, response);
        }
    }

    private void addNotification(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        String message = request.getParameter("message");
        String title = request.getParameter("title");
        if (title == null || title.trim().isEmpty() || message == null || message.trim().isEmpty()) {
            request.setAttribute("error", "Title and message cannot be empty");
            request.getRequestDispatcher("/adminDashboard.jsp").forward(request, response);
            return;
        }

        try {
            
            try (Connection con = JdbcUtils.getMysqlConnection()) {
                PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO notifications (title, message) VALUES (?, ?)"
                );
                ps.setString(1, title);
                ps.setString(2, message);
                ps.executeUpdate();
            }
            response.sendRedirect(request.getContextPath() + "/adminDashboard.jsp?msg=Notification added");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Failed to add notification");
            request.getRequestDispatcher("/adminDashboard.jsp").forward(request, response);
        }
    }
}
