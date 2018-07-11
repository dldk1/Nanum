package com.nanum.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nanum.dao.UserDAO;
import com.nanum.vo.UserVO;



/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminServlet() {
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
		// response.getWriter().append("Served at: ").append(request.getContextPath());

		String site = "member/memberModify.jsp";

		// 로그인이 되었는지 체크(세션 session)
		HttpSession session = request.getSession();
		String idChk = (String) session.getAttribute("id");
		// 만약에 idChk의 값이 있으면 admin.jsp로 보내고
		// 없으면 login.jsp로 보내고(login.devil)
		if (idChk == null) {
			site = "login.nanum";
			response.sendRedirect(site); // login페이지로 redirect
			return; // if문 아래에 코드 진행을 막고 login페이지로
		}
		// 여기에 DB 정보를 불러와서 사용자 리스트 보여주기
		// UserDAO 에서 회원 정보 리스트를 받아 오는거 만들기
		try {
			ArrayList<UserVO> getUserList = UserDAO.getUser();
			// getList를 브라우저(jsp)에서 전달을 해줘야 하는데
			// 전달 할 수 있는 방법이 뭐가있을까
			request.setAttribute("userList", getUserList); // userList 이름으로 저장			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
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