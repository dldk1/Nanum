package com.nanum.servlet.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nanum.dao.BoardDAO;
import com.nanum.vo.BoardBean;
import com.nanum.vo.UserVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;



/**
 * Servlet implementation class BoardWriteProServlet
 */
@WebServlet("/BoardWriteProServlet")
public class BoardWriteProServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardWriteProServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path1 = request.getContextPath();
				
		try{
			// 업로드 파일 최대 용량
			int maxSize = 1024 * 1024 * 100;	// 100mb
			// 저장될 서버의 경로
			String path = request.getServletContext().getRealPath("upload");
			// 중복파일 이름 변경 정책 객체
			DefaultFileRenamePolicy dfr = new DefaultFileRenamePolicy();
			// 업로드 처리
			MultipartRequest mr = new MultipartRequest(request, path, maxSize, "UTF-8", dfr);
			
			// 파라미터 데이터 추출
			String board_subject = mr.getParameter("board_subject");
			String board_content = mr.getParameter("board_content");
			String board_image = mr.getFilesystemName("board_image");
			String board_area_code = mr.getParameter("board_area_code");
//			String board_info_idx_str = mr.getParameter("board_info_idx");
//			int board_info_idx = Integer.parseInt(board_info_idx_str);
			System.out.println(board_subject);
			System.out.println(board_content);
			System.out.println(board_image);
			// 작성자의 인덱스 번호
			HttpSession session = request.getSession();
			UserVO login_bean = (UserVO)session.getAttribute("login_bean");
			if (login_bean == null) {
				System.out.println("세션 에러");
			}
			System.out.println("asdasdada dasd");
			int board_writer_idx = login_bean.getU_idx();
			System.out.println(board_writer_idx);
			// 작성자 IP 주소
			String board_ip = request.getRemoteAddr();
			// 저장할 데이터를 담는다.
			BoardBean board_bean = new BoardBean();
			board_bean.setBoard_subject(board_subject);
			board_bean.setBoard_content(board_content);
			board_bean.setBoard_image(board_image);
//			board_bean.setBoard_info_idx(board_info_idx);
			board_bean.setBoard_writer_idx(board_writer_idx);
			board_bean.setBoard_ip(board_ip);
			board_bean.setBoard_area_code(board_area_code);
			// 데이터 저장하는 메서드 호출
			System.out.println(board_bean.getBoard_writer_idx());
			int board_idx = BoardDAO.addBoardContent(board_bean);
			System.out.println(board_idx);
			request.setAttribute("board_idx", board_idx);
			// 뷰로 이동한다.
			String site = "/board/board_write_pro.jsp";
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
