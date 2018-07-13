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
		case "login.nanum": // 로그인 페이지
			site = "login/loginForm.jsp";
			break;

		case "login_proc.nanum": // 로그인 처리
			System.out.println("123a");
			site = "LoginProc";
			break;

		case "logout.nanum": // 로그아웃 처리
			site = "LogoutServlet";
			break;

		case "signUp.nanum": // 회원가입 페이지
			site = "signUp/signUp.jsp";
			break;

		case "signUpProc.nanum": // 회원가입 처리
			site = "SignUpProc";
			break;

		case "main.nanum": // 메인 페이지
			site = "main/main.jsp";
			break;

		case "agreement.nanum": // 회원가입시 이용약관 페이지
			site = "signUp/agreement.jsp";
			break;

		case "admin.nanum": // 관리자 전용
			System.out.println("1231");
			site = "AdminServlet";
			break;

		case "myPage.nanum": // 마이페이지
			site = "member/myPage.jsp";
			break;

		case "memberModify.nanum": // 회원가입 페이지
			site = "member/memberModify.jsp";
			break;

		case "getUserInfo.nanum": // 사용자 정보 확인
			site = "GetInfoServlet";
			
			break;

		case "updateInfo.nanum": // 사용자 정보 수정
			site = "UpdateInfoServlet";			
			break;

		case "memberDelete.nanum": // 회원탈퇴페이지
			site = "member/memberDelete.jsp";
			System.out.println(site);
			break;
			
		case "delInfoForAdmin.nanum": // 관리자용 사용자 정보 삭제 , 회원탈퇴
			site = "DelInfoForAdminServlet";
			System.out.println(site);
			break;
		case "delInfoForUser.nanum": // 유저용 사용자 정보 삭제 , 회원탈퇴
			site = "DelInfoForUserServlet";
			System.out.println(site);
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