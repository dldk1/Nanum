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
 * Servlet implementation class UpdateInfoServlet
 */
@WebServlet("/UpdateInfoServlet")
public class UpdateInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateInfoServlet() {
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

		// admin.jsp에 있는 모달에 있는 저장 버튼을 누르면
		// ajax가 있는 함수가 실행이 되어서 여기 서블릿으로 들어옴
		// 전달 되는 값은 u_idx, name, pw , email, phone
		// 전달 되는 값을 받아서 각각의 정보를 업데이트 쿼리로 수정
		// 업데이트 쿼리가 실핼하는 UserDAO를 만들어서 호출
		// 성공하면 다시 amdin.jsp에서 ajax로 다시 가서 success 쪽으로 성공 메시지를 보내어서 성공 했다 라고 하고 다시 페이지
		// 로드

		System.out.println("admin.jsp에서 들어온 모달");
		String u_idx = request.getParameter("u_idx");		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		System.out.println(u_idx + " " + id + " " + pw + " " + name + " " + email + " " + phone);
		
		UserVO vo = new UserVO();
		vo.setU_idx(Integer.parseInt(u_idx));
		vo.setId(id);
		vo.setPw(pw);
		vo.setName(name);
		vo.setEmail(email);
		vo.setPhone(phone);
		
		try {			
			UserDAO.updateInfo(vo);
			response.getWriter().println("OK");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		//메세지를 보내어서 성공 했다라고 하고 다시 페이지 로드 (admin.jsp에서)
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
