package com.nanum.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ControllerServlet
 */
@WebServlet("*.nanum")
public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ControllerServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String url = request.getRequestURL().toString();

		String[] sub = url.split("/");

		String suburl = sub[4];

		String site = null;
		System.out.println(suburl);

		switch (suburl) {
		case "login.nanum":
			site = "login/loginForm.jsp";
			break;
			
		case "login_proc.nanum":
			System.out.println("123a");
			site = "LoginProc";			
			break;
			
		case "logout.nanum":			
			site = "LogoutServlet";			
			break;
			
		case "signUp.nanum":			
			site = "signUp/signUp.jsp";			
			break;
		
		case "signUpProc.nanum":			
			site = "SignUpProc";			
			break;
			
			
		case "main.nanum":			
			site = "main/main.jsp";			
			break;
			
		case "agreement.nanum":			
			site = "signUp/agreement.jsp";			
			break;

		default:
			response.getWriter().append("error page");
			break;
		}
		// 서버내에서 페이지 이동
		RequestDispatcher dis = request.getRequestDispatcher(site);
		dis.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}