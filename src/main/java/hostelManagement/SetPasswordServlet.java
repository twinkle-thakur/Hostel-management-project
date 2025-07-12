//package hostelManagement;
//
//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
///**
// * Servlet implementation class SetPasswordServlet
// */
//@WebServlet("/SetPasswordServlet")
//public class SetPasswordServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//	 private static final String JDBC_URL = "jdbc:mysql://localhost:3306/hostel";
//	    private static final String JDBC_USER = "root";
//	    private static final String JDBC_PASS = "khushi1404"; 
//    /**
//     * @see HttpServlet#HttpServlet()
//     */
//    public SetPasswordServlet() {
//        super();
//        // TODO Auto-generated constructor stub
//    }
//
//	/**
//	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//        String enrollment = request.getParameter("enrollment");
//        String password = request.getParameter("password");
//        String confirmPassword = request.getParameter("confirm_password");
//
//        if (enrollment == null || enrollment.isEmpty()) {
//            response.sendRedirect("registration.jsp?error=Missing+enrollment+number");
//            return;
//        }
//
//        if (!password.equals(confirmPassword)) {
//            response.sendRedirect("setPassword.jsp?enrollment=" + enrollment + "&error=Passwords+do+not+match");
//            return;
//        }
//
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
//
//            String sql = "UPDATE student SET password = ? WHERE enrollment_no = ?";
//            PreparedStatement stmt = conn.prepareStatement(sql);
//            stmt.setString(1, password); // You can hash password here for security.
//            stmt.setString(2, enrollment);
//
//            int result = stmt.executeUpdate();
//
//            stmt.close();
//            conn.close();
//
//            if (result > 0) {
//                // Password successfully set — forward to login page
//                request.setAttribute("success", "Password set successfully. Please login.");
//                request.getRequestDispatcher("login.jsp").forward(request, response);
//            } else {
//                // Enrollment number not found
//                response.sendRedirect("setPassword.jsp?enrollment=" + enrollment + "&error=Enrollment+number+not+found");
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            response.sendRedirect("setPassword.jsp?enrollment=" + enrollment + "&error=Server+error:+"
//                    + e.getMessage().replace(" ", "+"));
//        }
//	}
//
//}
