package com.hm.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.hm.dto.Complaint;
import com.hm.dto.Profile;
import com.hm.service.ProfileService;
import com.hm.service.ProfileServiceImpl;
import com.hm.service.ComplaintServiceImpl;
import com.hm.service.LoginServiceImpl;
import com.hm.service.NotificationService;
import com.hm.service.NotificationServiceImpl;
import com.hm.service.RegistrationService;
import com.hm.service.RegistrationServiceImpl;

@WebServlet("/portal/*")
public class HostelManagementController extends HttpServlet {

	private LoginServiceImpl loginService;
	private RegistrationService registrationService;
	private ProfileService profileService;
	private ComplaintServiceImpl complaintService;
	private NotificationService notificationService;

	@Override
	public void init() {
		loginService = new LoginServiceImpl();
		registrationService = new RegistrationServiceImpl();
		profileService = new ProfileServiceImpl();
		complaintService = new ComplaintServiceImpl();
		notificationService = new NotificationServiceImpl();
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pathInfo = request.getPathInfo();
		System.out.println("context path: " + request.getContextPath());

		if (pathInfo == null || "/".equals(pathInfo)) {
			response.sendRedirect(request.getContextPath() + "/index.jsp");
			return;
		}

		switch (pathInfo) {
		case "/login":
			if (loginService.validateUser(request, response)) {
				request.getSession().setAttribute("enrollment", request.getParameter("enrollment"));
				response.sendRedirect(request.getContextPath() + "/portal/dashboard");
			} else {
				response.sendRedirect(request.getContextPath() + "/index.jsp?error=Invalid credentials");
			}
			break;

		case "/newUser":
			forward(request, response, "/WEB-INF/registration.jsp");
			break;

		case "/registration":
			if (registrationService.registerUser(request, response)) {
				forward(request, response, "/WEB-INF/success.jsp");
			} else {
				forward(request, response, "/WEB-INF/registration.jsp");
			}
			break;

		case "/logout":
			HttpSession session = request.getSession(false);
			if (session != null)
				session.invalidate();
			response.sendRedirect(request.getContextPath() + "/index.jsp?message=Logged out successfully");
			break;

		case "/sendNotification":
			String msg = request.getParameter("message");
			if (notificationService.sendNotification(msg)) {
				response.sendRedirect(request.getContextPath() + "/portal/dashboard?message=Notification Sent");
			} else {
				response.sendRedirect(request.getContextPath() + "/portal/dashboard?error=Failed to send");
			}
			break;

		case "/viewNotifications":
			request.setAttribute("notifications", notificationService.getNotifications());
			forward(request, response, "/WEB-INF/viewNotifications.jsp");
			break;

		case "/profile":
			String enrollment = (String) request.getSession().getAttribute("enrollment");
			if (enrollment == null) {
				response.sendRedirect(request.getContextPath() + "/index.jsp?error=Please login first");
				return;
			}
			request.setAttribute("profile", profileService.getProfile(enrollment));
			request.getSession().setAttribute("photo", "D:\\image.JPG");
			forward(request, response, "/WEB-INF/profile.jsp");
			break;

		case "/dashboard":
			forward(request, response, "/WEB-INF/dashboard.jsp");
			break;

		case "/complaint":
			forward(request, response, "/WEB-INF/complaint.jsp");
			break;

		case "/submitComplaint":
			Complaint complaint = new Complaint();
			complaint.setType(request.getParameter("type"));
			complaint.setDescription(request.getParameter("description"));
			if (complaintService.lodgeComplaint(complaint)) {
				response.sendRedirect(
						request.getContextPath() + "/portal/dashboard?message=Complaint submitted successfully");
			} else {
				request.setAttribute("error", "Unable to submit complaint");
				forward(request, response, "/WEB-INF/complaint.jsp");
			}
			break;

		default:
			response.sendError(HttpServletResponse.SC_NOT_FOUND, "Page not found");
		}
	}

	private void forward(HttpServletRequest request, HttpServletResponse response, String path)
			throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
	}
}
