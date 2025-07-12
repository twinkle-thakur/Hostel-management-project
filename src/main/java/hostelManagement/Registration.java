//package hostelManagement;
//
//import java.io.IOException;
//import java.io.PrintWriter;
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
// * Servlet implementation class Registration
// */
//@WebServlet("/Registration")
//public class Registration extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/hostel";
//    private static final String JDBC_USER = "root"; 
//    private static final String JDBC_PASS = "khushi1404"; 
//    /**
//     * @see HttpServlet#HttpServlet()
//     */
//    public Registration() {
//        super();
//        // TODO Auto-generated constructor stub
//    }
//
//	/**
//	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    String name = request.getParameter("name");
//    String enroll = request.getParameter("enrollment");
//    String email = request.getParameter("email");
//    String branch = request.getParameter("branch");
//    String year = request.getParameter("year");
//    String dob = request.getParameter("dob");
//    String blood = request.getParameter("blood_group");
//    String mobile = request.getParameter("mobile");
//    String father = request.getParameter("father_name");
//    String fatherMob = request.getParameter("father_mobile");
//    String room = request.getParameter("room_id");
//    
//
//    response.setContentType("text/html");
//    PrintWriter out = response.getWriter();
//
//    try {
//        // Load MySQL driver
//        Class.forName("com.mysql.cj.jdbc.Driver");
//
//        // Connect to database
//        Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
//
//        // Prepare SQL
//        String sql = "INSERT INTO student (name, enrollment_no, email, branch, year, dob, blood_group, mobile_no, father_name, father_mobile, room_id) " +
//                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
//
//        PreparedStatement stmt = conn.prepareStatement(sql);
//        stmt.setString(1, name);
//        stmt.setString(2, enroll);
//        stmt.setString(3, email);
//        stmt.setString(4, branch);
//        stmt.setString(5, year);
//        stmt.setString(6, dob);
//        stmt.setString(7, blood);
//        stmt.setString(8, mobile);
//        stmt.setString(9, father);
//        stmt.setString(10, fatherMob);
//        stmt.setString(11, room);
//
//        int result = stmt.executeUpdate();
//        if (result > 0) {
//            // Forward to password page with success message
//            request.setAttribute("message", "Successfully Registered!");
//            request.setAttribute("enrollment", enroll);
//            request.getRequestDispatcher("setPassword.jsp").forward(request, response);
//        } else {
//            // Redirect to registration page and inform failure
//            response.sendRedirect("registration.jsp?error=Registration+failed.+Please+try+again.");
//        }
//    stmt.close();
//    conn.close();
//} catch (Exception e) {
//    out.println("<h3>Error: " + e.getMessage() + "</h3>");
//    e.printStackTrace(out);
//}
//	}
//}
