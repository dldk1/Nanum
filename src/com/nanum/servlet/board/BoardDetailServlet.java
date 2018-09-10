package com.nanum.servlet.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nanum.dao.BoardDAO;
import com.nanum.vo.BoardBean;
import com.nanum.vo.ReplyBean;
import com.nanum.vo.UserVO;



/**
 * Servlet implementation class BoardDetailServlet
 */
@WebServlet("/BoardDetailServlet")
public class BoardDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			
			// 파라미터 추출
			String board_idx_str = request.getParameter("board_idx");
			int board_idx = Integer.parseInt(board_idx_str);
			// 게시글 정보를 가져온다.
			BoardBean board_bean = BoardDAO.getBoardContent(board_idx);
			request.setAttribute("board_bean", board_bean);
			// 작성자와 로그인한 사람이 다르면 조회수를
			// 증가시킨다.
			HttpSession session = request.getSession();
			UserVO login_bean = (UserVO)session.getAttribute("login_bean");
			if(board_bean.getBoard_writer_idx() != login_bean.getU_idx()){
				BoardDAO.addReadCnt(board_idx);
			}
			
			
			
			
			// 댓글 정보를 가져온다.
			ArrayList<ReplyBean> reply_list = BoardDAO.getReplyList(board_idx);
			request.setAttribute("reply_list", reply_list);
			
			String site = "/board/board_detail.jsp";
			RequestDispatcher dis = request.getRequestDispatcher(site);
			dis.forward(request, response);
			
		}catch(Exception e){
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
