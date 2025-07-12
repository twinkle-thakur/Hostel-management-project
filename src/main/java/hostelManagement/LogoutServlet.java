//package hostelManagement;
//
//import java.io.IOException;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.*;
//
//@WebServlet("/LogoutServlet")
//public class LogoutServlet extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//
//    protected void service(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        HttpSession session = request.getSession(false); // don't create if it doesn't exist
//        if (session != null) {
//            session.invalidate(); // log user out
//        }
//
//        response.sendRedirect("login.jsp"); // back to login page
//    }
//}
