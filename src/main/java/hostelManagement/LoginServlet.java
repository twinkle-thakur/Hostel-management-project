//package hostelManagement;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.sql.*;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.*;
//
//@WebServlet("/LoginServlet")
//public class LoginServlet extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//
//    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/hostel";
//    private static final String JDBC_USER = "root";
//    private static final String JDBC_PASS = "khushi1404";
//
//    protected void service(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        String enrollment = request.getParameter("enrollment");
//        String password = request.getParameter("password");
//
//        response.setContentType("text/html");
//        PrintWriter out = response.getWriter();
//
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
//
//            String sql = "SELECT * FROM student WHERE enrollment_no = ? AND password = ?";
//            PreparedStatement stmt = conn.prepareStatement(sql);
//            stmt.setString(1, enrollment);
//            stmt.setString(2, password);
//
//            ResultSet rs = stmt.executeQuery();
//
//            if (rs.next()) {
//                // Successful login: create session and redirect to dashboard
//                HttpSession session = request.getSession();
//                session.setAttribute("enrollment", enrollment);
//                session.setAttribute("name", rs.getString("name"));
//                
//                response.sendRedirect("dashboard.jsp");
//            } else {
//                // Failed login: redirect with error message
//                response.sendRedirect("login.jsp?error=Invalid+Enrollment+or+Password");
//            }
//
//            rs.close();
//            stmt.close();
//            conn.close();
//        } catch (Exception e) {
//            out.println("<h3>Error: " + e.getMessage() + "</h3>");
//            e.printStackTrace(out);
//        }
//    }
//}
