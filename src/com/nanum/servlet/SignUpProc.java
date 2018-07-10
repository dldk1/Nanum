package com.nanum.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nanum.dao.UserDAO;
import com.nanum.vo.UserVO;




/**
 * Servlet implementation class JoinUsProc
 */
@WebServlet("/SignUpProc")
public class SignUpProc extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SignUpProc() {
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
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");		
		String gender = request.getParameter("radio");
	
		String path = request.getContextPath();

		UserVO uvo = new UserVO();	
		uvo.setId(id);
		uvo.setPw(pw);
		uvo.setName(name);		
		uvo.setEmail(email);
		uvo.setPhone(phone);
		uvo.setGender(gender);

		// static 으로 만들어서 바로 사용 가능
		// 원래 객체 생성후 만듬
		PrintWriter out = response.getWriter();		

		try {
			UserDAO.insertUser(uvo);						
			response.sendRedirect(path+"/main.nanum");				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// DB연결 해서 데이터 삽입 (DAO)

		// DB커넥터 (jar 파일 라이브러리)
		// 우리 DB는 Mysql 이다.
		// DAO(클래스)를 만들어서 데이터 삽입 쿼리를 넣는 실행 메소드 생성
		// 이 클래스 안에는 테이블 정보(컬럼값)를 담는 클래스(VO)가 필요

		// response.setContentType("text/html; charset=UTF-8");
		// PrintWriter out = response.getWriter();
		// out.println("이름 : " + name + "<br>");
		// out.println("폰 번호 : " + phone + "<br>");
		// out.println("이메일 : " + email + "<br>");
		// out.println("비밀번호 : " + pw + "<br>");

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
