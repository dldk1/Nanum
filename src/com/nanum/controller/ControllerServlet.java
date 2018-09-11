package com.nanum.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ControllerServlet
 */
@WebServlet("*.nanum")
public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ControllerServlet() {
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

		String url = request.getRequestURL().toString();

		String[] sub = url.split("/");

		String suburl = sub[4];

		String site = null;
		System.out.println(suburl);

		switch (suburl) {

		case "main.nanum": // 메인 페이지
			site = "main/main.jsp";
			break;

		case "login.nanum": // 로그인 페이지
			site = "login/loginForm.jsp";
			break;

		case "login_proc.nanum": // 로그인 처리
			System.out.println("123a");
			site = "LoginProc";
			break;

		case "logout.nanum": // 로그아웃 처리
			site = "LogoutServlet";
			break;

		case "signUp.nanum": // 회원가입 페이지
			site = "signUp/signUp.jsp";
			break;

		case "signUpProc.nanum": // 회원가입 처리
			site = "SignUpProc";
			break;

		case "agreement.nanum": // 회원가입시 이용약관 페이지
			site = "signUp/agreement.jsp";
			break;

		case "admin.nanum": // 관리자 전용
			System.out.println("1231");
			site = "AdminServlet";
			break;

		case "myPage.nanum": // 마이페이지
			site = "member/myPage.jsp";
			break;

		case "memberModify.nanum": // 개인정보변경 페이지
			site = "member/memberModify.jsp";
			break;

		case "updateInfo.nanum": // 사용자 정보 수정 처리
			site = "UpdateInfoServlet";
			break;

		case "memberDelete.nanum": // 회원탈퇴페이지
			site = "member/memberDelete.jsp";
			System.out.println(site);
			break;

		case "getUserInfoForAdmin.nanum": // 관리자용 사용자 정보 확인
			site = "GetInfoForAdminServlet";
			break;

		case "getUserInfoForUser.nanum": // 유저용 사용자 정보 확인
			site = "GetInfoForUserServlet";
			break;

		case "delInfoForAdmin.nanum": // 관리자용 사용자 정보 삭제 , 회원탈퇴
			site = "DelInfoForAdminServlet";
			System.out.println(site);
			break;

		case "delInfoForUser.nanum": // 유저용 사용자 정보 삭제 , 회원탈퇴
			site = "DelInfoForUserServlet";
			System.out.println(site);
			break;
		// 나눔 게시판
		case "board.nanum":
			site = "board/board_list.jsp";
			System.out.println(site);
			break;

		case "board_list.nanum":
			site = "BoardListServlet";
			break;
			
		case "board_write.nanum":
			site = "BoardWriteServlet";
			break;
			
		case "board_write_pro.nanum":
			site = "BoardWriteProServlet";
			System.out.println(site);
			break;
			
		case "board_detail.nanum":
			site = "BoardDetailServlet";
			System.out.println(site);
			break;
			
		case "delete_board.nanum":
			site = "DeleteBoardServlet";
			break;
			
		case "modify_board.nanum":
			site = "ModifyBoardServlet";
			break;
			
		case "modify_board_pro.nanum":
			site = "ModifyBoardProServlet";
			break;
			
		case "add_reply.nanum":
			site = "AddReplyServlet";
			break;
			
		case "remove_reply.nanum":
			site = "RemoveReplyServlet";
			break;

		case "rating.nanum":
			site = "RatingServlet";
			break;

		// 공지사항
		case "notice.nanum":
			site = "NoticeBoardListServlet";
			break;

		case "board_list_notice.nanum":
			site = "NoticeBoardListServlet";

			break;
		case "board_write_notice.nanum":
			site = "NoticeBoardWriteServlet";
			break;

		case "board_write_pro_notice.nanum":
			site = "NoticeBoardWriteProServlet";
			System.out.println(site);
			break;

		case "board_detail_notice.nanum":
			site = "NoticeBoardDetailServlet";
			System.out.println(site);
			break;

		case "delete_board_notice.nanum":
			site = "NoticeDeleteBoardServlet";
			break;

		case "modify_board_notice.nanum":
			site = "NoticeModifyBoardServlet";
			break;

		case "modify_board_pro_notice.nanum":
			site = "NoticeModifyBoardProServlet";
			break;

		case "add_reply_notice.nanum":
			site = "NoticeAddReplyServlet";
			break;

		case "remove_reply_notice.nanum":
			site = "NoticeRemoveReplyServlet";
			break;

		// 울산
		case "board_list_ulsan.nanum":
			site = "UlsanBoardListServlet";
			break;

		// 세종
		case "board_list_sejong.nanum":
			site = "SejongBoardListServlet";
			break;

		// 경기도
		case "board_list_gyeonggi.nanum": // 게시판 리스트
			site = "GyeonggiBoardListServlet";
			break;

		// 경상남도
		case "board_list_gyeongnam.nanum": // 게시판 리스트
			site = "GyeongnamBoardListServlet";
			break;

		// 경상북도
		case "board_list_gyeongbuk.nanum":
			site = "GyeongbukBoardListServlet";
			break;

		// 충청북도
		case "board_list_chungbuk.nanum":
			site = "ChungBukBoardListServlet";
			break;

		// 충청남도
		case "board_list_chungnam.nanum":
			site = "ChungNamBoardListServlet";
			break;

		// 전라북도
		case "board_list_jyeonbuk.nanum":
			site = "JyeonBukBoardListServlet";
			break;

		// 전라남도
		case "board_list_jeollanamdo.nanum":
			site = "JeollanamdoBoardListServlet";
			break;

		// 서울
		case "board_list_seoul.nanum":
			site = "SeoulBoardListServlet";
			break;

		// 부산
		case "board_list_busan.nanum":
			site = "BusanBoardListServlet";
			break;

		// 대구
		case "board_list_daegu.nanum":
			site = "DaeguBoardListServlet";
			break;

		// 인천
		case "board_list_incheon.nanum":
			site = "IncheonBoardListServlet";
			break;

		// 광주
		case "board_list_gwangju.nanum":
			site = "GwangjuBoardListServlet";
			break;

		// 대전
		case "board_list_daejeon.nanum":
			site = "DaejeonBoardListServlet";
			break;

		// 제주도
		case "board_list_jejuIsland.nanum":
			site = "JejuIslandBoardListServlet";
			break;

		// 강원도
		case "board_list_gangwondo.nanum":
			site = "GangwondoBoardListServlet";
			break;

		/*
		 * // 별점 평가 case "rating.nanum": site = "RatingServlet"; break;
		 */

		case "add_rating.nanum":
			site = "AddRatingServlet";
			break;

		case "rating_list.nanum":
			site = "GetRatingServlet";
			break;

		case "rating_detail.nanum":
			site = "GetRatingDetailServlet";
			break;

		case "board_mylist.nanum":
			site = "BoardMyListServlet";
			System.out.println(site);
			break;
		case "send_board_mylist.nanum":
			site = "SendBoardMyListServlet";
			System.out.println(site);
			break;
			
		default:
			response.getWriter().append("error page");
			break;
		}
		// 서버내에서 페이지 이동
		RequestDispatcher dis = request.getRequestDispatcher(site);
		dis.forward(request, response);
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