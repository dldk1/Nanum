package com.nanum.servlet.rating;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nanum.dao.BoardDAO;
import com.nanum.dao.RatingDAO;
import com.nanum.vo.RatingVO;

/**
 * Servlet implementation class RatingServlet
 */
@WebServlet("/GetRatingDetailServlet")
public class GetRatingDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetRatingDetailServlet() {
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
		System.out.println("board_writer_idx: " + board_writer_idx);
		// board_writer_idx, rating, content null 체크 에러 처리
		try {

			// 페이지 번호를 파라미터로 가져온다.
			List<RatingVO> list = RatingDAO.getRatingInfo(board_writer_idx);
			request.setAttribute("writer_name", list.get(0).getName());
			request.setAttribute("rating_list", list);
			
			String site = "rating/rating_detail.jsp";
			RequestDispatcher dis = request.getRequestDispatcher(site);
			dis.forward(request, response);
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
