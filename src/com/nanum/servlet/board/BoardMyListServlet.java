package com.nanum.servlet.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nanum.dao.BoardDAO;
import com.nanum.vo.BoardBean;

/**
 * Servlet implementation class BoardMyListServlet
 */
@WebServlet("/BoardMyListServlet")
public class BoardMyListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardMyListServlet() {
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
		try {

			// 페이지 번호를 파라미터로 가져온다.
			String page_str = request.getParameter("page");
			System.out.println(page_str + "aa");
			String u_idx_str = request.getParameter("u_idx");
			System.out.println(u_idx_str + "bb");

			if (page_str == null || page_str == "" || page_str.equals("")) {
				page_str = "1";
			}
			int page = Integer.parseInt(page_str);
//				if (u_idx_str == null || u_idx_str == "" || u_idx_str.equals("")) {
//					u_idx_str = "1";
//				}
			System.out.println(page+"페이지다아");
			int u_idx = Integer.parseInt(u_idx_str);
			// 전체 페이지수를 구한다.
			int page_cnt = BoardDAO.getPageCnt(u_idx);

			request.setAttribute("page_cnt", page_cnt);

			// 페이지 번호가 전체 페이지수를 넘을 경우 처리
			if (page > page_cnt) {
				page = page_cnt;
			}

			// 현재 페이지 번호를 저장한다.
			request.setAttribute("now_page", page);

			// 하단 페이지 최소 최대값을 구한다.
			// 현재 페이지에서 1를 빼고 10을 나눈 몫을 구한다.
			int temp1 = (page - 1) / 10;
			// 최소 페이지 번호를 구한다.
			int min_page = 1 + (temp1 * 10);
			// 최대 페이지 번호를 구한다.
			int max_page = min_page + 10 - 1;
			// 최대 페이지 번호가 페이지수를 넘어간다면
			if (max_page > page_cnt) {
				max_page = page_cnt;
			}

			request.setAttribute("min_page", min_page);
			request.setAttribute("max_page", max_page);

			// < >표시 처리
			int pre_max = min_page - 1;
			int next_min = max_page + 1;

			if (pre_max < 1) {
				pre_max = 1;
			}

			if (next_min > page_cnt) {
				next_min = page_cnt;
			}

			request.setAttribute("pre_max", pre_max);
			request.setAttribute("next_min", next_min);

			// 게시판 글 리스트를 가져온다.
			ArrayList<BoardBean> board_mylist = BoardDAO.getMyBoardList(page, u_idx);

			request.setAttribute("board_mylist", board_mylist);

			String site = "/board/board_mylist.jsp";
			RequestDispatcher dis = request.getRequestDispatcher(site);
			dis.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			
			/*String site = "/board/board_mylist_empty.jsp";
			RequestDispatcher dis = request.getRequestDispatcher(site);
			dis.forward(request, response);*/
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
