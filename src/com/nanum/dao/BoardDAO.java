package com.nanum.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.nanum.db.DBConn;
import com.nanum.vo.BoardBean;
import com.nanum.vo.ReplyBean;


public class BoardDAO {
	
	// 게시글을 저장하는 메서드
	public static int addBoardContent(BoardBean bean) throws Exception{
		// 데이터 베이스 접속
		Connection db = DBConn.getConnection();
		// 쿼리문
		StringBuffer sql = new StringBuffer();
		sql.append("insert into BOARD_TABLE ");
		sql.append("(BOARD_SUBJECT, ");
		sql.append("BOARD_CONTENT, BOARD_IMAGE, ");
		sql.append("BOARD_READ_CNT, BOARD_DATE, ");
		sql.append("BOARD_IP, BOARD_STATUS, ");
		sql.append("BOARD_WRITER_IDX) ");
		sql.append("values (?, ?, ?, 0, now(), ?, 1, ?)");
		
		System.out.println(sql.toString());
		System.out.println(bean.getBoard_writer_idx());
		
		PreparedStatement pstmt = db.prepareStatement(sql.toString());
		pstmt.setString(1, bean.getBoard_subject());
		pstmt.setString(2, bean.getBoard_content());
		pstmt.setString(3, bean.getBoard_image());
		pstmt.setString(4, bean.getBoard_ip());
		//pstmt.setInt(5, bean.getBoard_info_idx());
		pstmt.setInt(5, bean.getBoard_writer_idx());
		
		
		pstmt.execute();
		
		
		// 시퀀스의 현재 값을 가져온다.
		String sql2 = "select max(BOARD_IDX) as a from BOARD_TABLE";
		PreparedStatement pstmt2 = db.prepareStatement(sql2);
		ResultSet rs = pstmt2.executeQuery();
		rs.next();
		int currval = rs.getInt("a");
		System.out.println(currval);
				
		db.close();
		
		return currval;
	}
	
	// 게시글 정보를 반환하는 메서드
	public static BoardBean getBoardContent(int board_idx) throws Exception{
		// 데이터 베이스 접속
		Connection db = DBConn.getConnection();
		
		StringBuffer sql = new StringBuffer();
		sql.append("select a2.NAME, a1.BOARD_SUBJECT,  ");
		sql.append("a1.BOARD_CONTENT, a1.BOARD_IP, ");
		sql.append("date_format(a1.BOARD_DATE, '%Y-%c-%e') as BOARD_DATE, ");
		sql.append("a1.BOARD_IMAGE, a1.BOARD_WRITER_IDX, a1.BOARD_STATUS ");
		sql.append("from BOARD_TABLE a1, USER a2 ");
		sql.append("where a1.BOARD_WRITER_IDX = a2.u_idx ");
		sql.append("and a1.BOARD_IDX=?");
		System.out.println(sql);
		PreparedStatement pstmt = db.prepareStatement(sql.toString());
		pstmt.setInt(1, board_idx);
		
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		
		// 데이터를 담을 빈 객체 생성
		BoardBean bean = new BoardBean();
		bean.setBoard_writer_name(rs.getString("NAME"));
		bean.setBoard_subject(rs.getString("BOARD_SUBJECT"));
		bean.setBoard_content(rs.getString("BOARD_CONTENT"));
		bean.setBoard_ip(rs.getString("BOARD_IP"));
		bean.setBoard_date(rs.getString("BOARD_DATE"));
		bean.setBoard_image(rs.getString("BOARD_IMAGE"));
		bean.setBoard_writer_idx(rs.getInt("BOARD_WRITER_IDX"));
		bean.setBoard_status(rs.getInt("BOARD_STATUS"));
		
		db.close();
		
		return bean;
	}
	
	// 게시글 목록을 가져오는 메서드
	public static ArrayList<BoardBean> getBoardList(int page) throws Exception{
		// 데이터 베이스 접속
		Connection db = DBConn.getConnection();
		
		StringBuffer sql = new StringBuffer();
		String sql2 = "SELECT A.BOARD_IDX BOARD_IDX, A.board_subject BOARD_SUBJECT, A.BOARD_READ_CNT " + 
				",(SELECT B.NAME FROM user B WHERE B.U_IDX=A.BOARD_WRITER_IDX) NAME  " + 
				",(SELECT COUNT(*) FROM REPLY_TABLE C WHERE C.REPLY_BOARD_IDX=A.BOARD_IDX) REPLY_CNT  " + 
				"FROM board_table A " + 
				"WHERE A.BOARD_STATUS = 1 " +
				"ORDER BY A.BOARD_IDX " + 
				"limit ?, ?";
		
	
		// 페이지에 해당하는 인덱스 번호를 구한다.
		// 페이지당 10개...
		int rows = 10;
		
		int min = ((page - 1) * rows);
		int max = rows + min - 1;
		
	
//		PreparedStatement pstmt = db.prepareStatement(sql.toString());
		PreparedStatement pstmt = db.prepareStatement(sql2);		
		pstmt.setInt(1, min);
		pstmt.setInt(2, max);
		
		ResultSet rs = pstmt.executeQuery();
		
		// 데이터를 담을 ArrayList를 만들어 준다.
		ArrayList<BoardBean> list = new ArrayList<BoardBean>();
		
		while(rs.next()){
			// 로우 하나의 데이터를 담을 빈 객체 생성
			BoardBean bean = new BoardBean();
			// 데이터를 담는다.
			bean.setBoard_idx(rs.getInt("BOARD_IDX"));
			bean.setBoard_subject(rs.getString("BOARD_SUBJECT"));
			bean.setBoard_writer_name(rs.getString("NAME"));
			bean.setBoard_read_cnt(rs.getInt("BOARD_READ_CNT"));
			bean.setReply_cnt(rs.getInt("REPLY_CNT"));
			// ArrayList에 담는다.
			list.add(bean);
		}
				
		db.close();
		
		return list;
	}
	// 전체 페이지 개수
	public static int getPageCnt() throws Exception{
		// 데이터 베이스 접속
		Connection db = DBConn.getConnection();
		
		// 쿼리문
		StringBuffer sql = new StringBuffer();
		sql.append("select count(*) from BOARD_TABLE ");		
				
		PreparedStatement pstmt = db.prepareStatement(sql.toString());		
		// 쿼리실행
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		
		
		
		int count = rs.getInt(1);
		
		// 페이지 수를 계산한다.
		int page_cnt = count / 10;
		if(count % 10 > 0){
			page_cnt++;
		}
		
		db.close();
		
		return page_cnt;
	}
	// 글을 삭제처리하는 메서드
	public static void deleteBoard(int board_idx) throws Exception{
		// 데이터 베이스 접속
		Connection db = DBConn.getConnection();
		// 쿼리문
		StringBuffer sql = new StringBuffer();
		sql.append("update BOARD_TABLE ");
		sql.append("set BOARD_STATUS=2 ");
		sql.append("where BOARD_IDX=?");
		
		PreparedStatement pstmt = db.prepareStatement(sql.toString());
		pstmt.setInt(1, board_idx);
		
		// 쿼리 실행
		pstmt.execute();
		
		db.close();
	}
	
	// 게시글 정보를 수정하는 메서드
	public static void modifyBoard(BoardBean bean) throws Exception {
		// 데이터베이스 접속
		Connection db = DBConn.getConnection();
		// 쿼리문
		StringBuffer sql = new StringBuffer();
		sql.append("update BOARD_TABLE set ");
		sql.append("BOARD_SUBJECT=?, BOARD_CONTENT=?, ");
		sql.append("BOARD_IP=? ");
		if(bean.getBoard_image() != null){
			sql.append(", BOARD_IMAGE=? ");
		}
		sql.append("where BOARD_IDX=?");
		
		PreparedStatement pstmt = db.prepareStatement(sql.toString());
		pstmt.setString(1, bean.getBoard_subject());
		pstmt.setString(2, bean.getBoard_content());
		pstmt.setString(3, bean.getBoard_ip());
		if(bean.getBoard_image() != null){
			pstmt.setString(4, bean.getBoard_image());
			pstmt.setInt(5, bean.getBoard_idx());
		} else {
			pstmt.setInt(4, bean.getBoard_idx());
		}
		
		pstmt.execute();
		
		db.close();
	}
	// 댓글 추가 메서드
	public static void add_reply(ReplyBean bean) throws Exception{
		// 데이터베이스 접속
		Connection db = DBConn.getConnection();
		
		StringBuffer sql = new StringBuffer();
		sql.append("insert into REPLY_TABLE ");
		sql.append("(REPLY_CONTENT, REPLY_DATE, ");
		sql.append("REPLY_IP, REPLY_STATUS, REPLY_WRITER_IDX, ");
		sql.append("REPLY_BOARD_IDX) values ");
		sql.append("(?, now(), ");
		sql.append("?, 1, ?, ?)");
		
		PreparedStatement pstmt = db.prepareStatement(sql.toString());
		pstmt.setString(1, bean.getReply_content());
		pstmt.setString(2, bean.getReply_ip());
		pstmt.setInt(3, bean.getReply_writer_idx());
		pstmt.setInt(4, bean.getReply_board_idx());
		
		pstmt.execute();
		
		db.close();
	}
	// 댓글 데이터를 가져온다.
	public static ArrayList<ReplyBean> getReplyList(int board_idx) throws Exception{
		// 데이터베이스 접속
		Connection db = DBConn.getConnection();
		
		StringBuffer sql = new StringBuffer();
		
		sql.append("select a1.REPLY_IDX, a1.REPLY_CONTENT, ");
		sql.append("a1.REPLY_WRITER_IDX, a2.NAME ");
		sql.append("from REPLY_TABLE a1, USER a2 ");
		sql.append("where a1.REPLY_WRITER_IDX = a2.U_IDX ");
		sql.append("and a1.REPLY_STATUS = 1 ");
		sql.append("and a1.REPLY_BOARD_IDX = ? ");
		sql.append("order by a1.REPLY_IDX desc ");
		
		PreparedStatement pstmt = db.prepareStatement(sql.toString());
		pstmt.setInt(1, board_idx);
		
		ResultSet rs = pstmt.executeQuery();
		
		// 데이터를 담을 ArrayList
		ArrayList<ReplyBean> list = new ArrayList<ReplyBean>();
		
		while(rs.next()){
			ReplyBean bean = new ReplyBean();
			bean.setReply_idx(rs.getInt("REPLY_IDX"));
			bean.setReply_content(rs.getString("REPLY_CONTENT"));
			bean.setReply_writer_idx(rs.getInt("REPLY_WRITER_IDX"));
			bean.setReply_writer_name(rs.getString("NAME"));
			
			list.add(bean);
		}
		
		db.close();
		
		return list;
	}
	
	// 댓글 삭제처리하는 메서드
	public static void remove_reply(int reply_idx) throws Exception{
		Connection db = DBConn.getConnection();
		
		StringBuffer sql = new StringBuffer();
		sql.append("update REPLY_TABLE ");
		sql.append("set REPLY_STATUS=2 ");
		sql.append("where REPLY_IDX=?");
		
		PreparedStatement pstmt = db.prepareStatement(sql.toString());
		pstmt.setInt(1, reply_idx);
		
		pstmt.execute();
		
		db.close();
	}
	// 조회수를 증가하는 메서드
	public static void addReadCnt(int board_idx) throws Exception{
		Connection db = DBConn.getConnection();
		// 쿼리문
		StringBuffer sql = new StringBuffer();
		sql.append("update BOARD_TABLE set ");
		sql.append("BOARD_READ_CNT = BOARD_READ_CNT + 1 ");
		sql.append("where BOARD_IDX=?");
		
		PreparedStatement pstmt = db.prepareStatement(sql.toString());
		pstmt.setInt(1, board_idx);
		
		pstmt.execute();
		
		
		db.close();
	}
}













