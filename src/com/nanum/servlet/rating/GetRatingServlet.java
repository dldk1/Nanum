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
@WebServlet("/GetRatingServlet")
public class GetRatingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetRatingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
//		String board_writer_idx = request.getParameter("board_writer_idx");
//		System.out.println("board_writer_idx: " + board_writer_idx);
		// board_writer_idx, rating, content null 체크 에러 처리
		try {

			// 페이지 번호를 파라미터로 가져온다.
			String page_str = request.getParameter("page");
			if(page_str == null || page_str == "" || page_str.equals("")) {
				page_str = "1";
			}
			System.out.println("page_str: " + page_str);
			int page = Integer.parseInt(page_str);
			// 전체 페이지수를 구한다.
			int page_cnt = RatingDAO.getPageCnt();
			request.setAttribute("page_cnt", page_cnt);
			System.out.println("page_cnt: " + page_cnt);
			
			
			// 페이지 번호가 전체 페이지수를 넘을 경우 처리
			if(page > page_cnt){
				page = page_cnt;
			}
			
			// 현재 페이지 번호를 저장한다.
			request.setAttribute("now_page", page);
			System.out.println("now_page: " + page);
						
			// 하단 페이지 최소 최대값을 구한다.
			// 현재 페이지에서 1를 빼고 10을 나눈 몫을 구한다.
			int temp1 = (page - 1) / 10;
			// 최소 페이지 번호를 구한다.
			int min_page = 1 + (temp1 * 10);
			// 최대 페이지 번호를 구한다.
			int max_page = min_page + 10 - 1;
			// 최대 페이지 번호가 페이지수를 넘어간다면
			if(max_page > page_cnt){
				max_page = page_cnt;
			}
			
			request.setAttribute("min_page", min_page);
			request.setAttribute("max_page", max_page);
			
			System.out.println("min_page: " + min_page);
			System.out.println("max_page: " + max_page);
		
			// < >표시 처리
			int pre_max = min_page - 1;
			int next_min = max_page + 1;
			
			if(pre_max < 1){
				pre_max = 1;
			}
			
			if(next_min > page_cnt){
				next_min = page_cnt;
			}
			
			request.setAttribute("pre_max", pre_max);
			request.setAttribute("next_min", next_min);
			
			System.out.println("pre_max: " + pre_max);
			System.out.println("next_min: " + next_min);
			
			List<RatingVO> list = RatingDAO.getRatingInfo();

			request.setAttribute("rating_list", list);
			
			String site = "rating/rating_list.jsp";
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
