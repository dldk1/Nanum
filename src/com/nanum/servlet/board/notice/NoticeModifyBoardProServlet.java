package com.nanum.servlet.board.notice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nanum.dao.BoardNoticeDAO;
import com.nanum.vo.BoardBean;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class ModifyBoardProServlet
 */
@WebServlet("/NoticeModifyBoardProServlet")
public class NoticeModifyBoardProServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeModifyBoardProServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			// 업로드 파일 최대 용량
			int maxSize = 1024 * 1024 * 100;	// 100mb
			// 저장될 서버의 경로
			String path = request.getServletContext().getRealPath("upload");
			// 중복파일 이름 변경 정책 객체
			DefaultFileRenamePolicy dfr = new DefaultFileRenamePolicy();
			// 업로드 처리
			MultipartRequest mr = new MultipartRequest(request, path, maxSize, "UTF-8", dfr);
			
			// 파라미터 데이터와 파일 이름을 추출
			String board_subject = mr.getParameter("board_subject");
			String board_content = mr.getParameter("board_content");
			String board_image = mr.getFilesystemName("board_image");
			String board_idx_str = mr.getParameter("board_idx");
			int board_idx = Integer.parseInt(board_idx_str);
			// 빈 객체에 담는다.
			BoardBean board_bean = new BoardBean();
			board_bean.setBoard_idx(board_idx);
			board_bean.setBoard_subject(board_subject);
			board_bean.setBoard_content(board_content);
			board_bean.setBoard_image(board_image);
			board_bean.setBoard_ip(request.getRemoteAddr());
			// 수정한다.
			BoardNoticeDAO.modifyBoard(board_bean);
			// 뷰로 이동한다.
			String site = "/admin/modify_board_pro_notice.jsp";
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
