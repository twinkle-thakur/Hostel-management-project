//package hostelManagement;
//
//import java.io.*;
//import java.sql.*;
//import javax.servlet.*;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.*;
//
//@WebServlet("/ComplainServlet")
//public class ComplainServlet extends HttpServlet {
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
//        String category = request.getParameter("category");
//        String description = request.getParameter("description");
//
//        response.setContentType("text/html");
//        PrintWriter out = response.getWriter();
//
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
//
//            String sql = "INSERT INTO complaints (enrollment_no, category, description) VALUES (?, ?, ?)";
//            PreparedStatement stmt = conn.prepareStatement(sql);
//            stmt.setString(1, enrollment);
//            stmt.setString(2, category);
//            stmt.setString(3, description);
//
//            int result = stmt.executeUpdate();
//            if (result > 0) {
//                out.println("<h3 style='color:green;'>✅ Complaint submitted successfully!</h3>");
//                out.println("<a href='dashboard.jsp'>Go back to Dashboard</a>");
//            } else {
//                out.println("<h3 style='color:red;'>❌ Failed to submit complaint. Try again.</h3>");
//            }
//
//            stmt.close();
//            conn.close();
//        } catch (Exception e) {
//            out.println("<h3>Error: " + e.getMessage() + "</h3>");
//            e.printStackTrace(out);
//        }
//    }
//}
