package com.nanum.servlet.rating;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nanum.dao.RatingDAO;
import com.nanum.vo.RatingVO;

/**
 * Servlet implementation class RatingServlet
 */
@WebServlet("/AddRatingServlet")
public class AddRatingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddRatingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String board_writer_idx = request.getParameter("board_writer_idx");
		String rating = request.getParameter("rating");
		String content = request.getParameter("content");

		// board_writer_idx, rating, content null 체크 에러 처리
		try {
			RatingVO vo = new RatingVO();
			vo.setBoard_writer_idx(Integer.parseInt(board_writer_idx));
			vo.setRating(Integer.parseInt(rating));
			vo.setContent(content);
			
			RatingDAO.insertRating(vo);
			
			PrintWriter out = response.getWriter();
			out.println("OK");
			
//			String site = "main/main.jsp";
//			RequestDispatcher dis = request.getRequestDispatcher(site);
//			dis.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
