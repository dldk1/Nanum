package com.nanum.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nanum.dao.UserDAO;
import com.nanum.vo.UserVO;

/**
 * Servlet implementation class GetInfoServlet
 */
@WebServlet("/GetInfoForAdminServlet")
public class GetInfoForAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetInfoForAdminServlet() {
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
		// u_idx 값을 받아 와서 UserDAO에서 사용자 정보를 가져오기
		String u_idx = request.getParameter("u_idx");
		System.out.println(u_idx);
		try {
			UserVO vo = UserDAO.getUserInfoForAdmin(u_idx);
			// int uidx = vo.getU_idx();
			String id = "/" + vo.getId();
			String name = "/" + vo.getName();
			String pw = "/" + vo.getPw();
			String email = "/" + vo.getEmail();
			String phone = "/" + vo.getPhone();

			response.setCharacterEncoding("utf-8");
			response.setContentType("text/plain; charset=utf-8");
			response.getWriter().println("OK/" + id + pw + name + email + phone);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
