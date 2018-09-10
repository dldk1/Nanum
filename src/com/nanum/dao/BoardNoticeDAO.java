package com.nanum.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.nanum.db.DBConn;
import com.nanum.vo.BoardBean;
import com.nanum.vo.ReplyBean;

public class BoardNoticeDAO {

	// 게시글을 저장하는 메서드
	public static int addBoardContent(BoardBean bean) throws Exception {
		// 데이터 베이스 접속
		Connection db = DBConn.getConnection();
		// 쿼리문
		StringBuffer sql = new StringBuffer();
		sql.append("insert into BOARD_TABLE_NOTICE ");
		sql.append("(BOARD_SUBJECT, ");
		sql.append("BOARD_CONTENT, BOARD_IMAGE, ");
		sql.append("BOARD_READ_CNT, BOARD_DATE, ");
		sql.append("BOARD_IP, BOARD_STATUS, ");
		sql.append("BOARD_WRITER_IDX) ");
		sql.append("values (?, ?, ?, 0, now(), ?, 1, ?)");

		String sql2 = sql.toString().toLowerCase();
		System.out.println(sql2);

		System.out.println(bean.getBoard_writer_idx());

		PreparedStatement pstmt = db.prepareStatement(sql2);
		pstmt.setString(1, bean.getBoard_subject());
		pstmt.setString(2, bean.getBoard_content());
		pstmt.setString(3, bean.getBoard_image());
		pstmt.setString(4, bean.getBoard_ip());
		// pstmt.setInt(5, bean.getBoard_info_idx());
		pstmt.setInt(5, bean.getBoard_writer_idx());

		pstmt.execute();

		// 시퀀스의 현재 값을 가져온다.
		String sql3 = "select max(board_idx) as a from board_table_notice";
		PreparedStatement pstmt2 = db.prepareStatement(sql3);
		ResultSet rs = pstmt2.executeQuery();
		rs.next();
		int currval = rs.getInt("a");
		System.out.println(currval);

		db.close();

		return currval;
	}

	// 게시글 정보를 반환하는 메서드 _notice
	public static BoardBean getBoardContent(int board_idx) throws Exception {
		// 데이터 베이스 접속
		Connection db = DBConn.getConnection();

		StringBuffer sql = new StringBuffer();
		sql.append("select a2.NAME, a1.BOARD_SUBJECT,  ");
		sql.append("a1.BOARD_CONTENT, a1.BOARD_IP, ");
		sql.append("date_format(a1.BOARD_DATE, '%Y-%c-%e') as BOARD_DATE, ");
		sql.append("a1.BOARD_IMAGE, a1.BOARD_WRITER_IDX, a1.BOARD_STATUS ");
		sql.append("from BOARD_TABLE_NOTICE a1, USER a2 ");
		sql.append("where a1.BOARD_WRITER_IDX = a2.u_idx ");
		sql.append("and a1.BOARD_IDX=?");
		String sql2 = sql.toString().toLowerCase();
		System.out.println(sql2);
		PreparedStatement pstmt = db.prepareStatement(sql2);
		pstmt.setInt(1, board_idx);

		ResultSet rs = pstmt.executeQuery();
		rs.next();

		// 데이터를 담을 빈 객체 생성
		BoardBean bean = new BoardBean();
		bean.setBoard_writer_name(rs.getString("name"));
		bean.setBoard_subject(rs.getString("board_subject"));
		bean.setBoard_content(rs.getString("board_content"));
		bean.setBoard_ip(rs.getString("board_ip"));
		bean.setBoard_date(rs.getString("board_date"));
		bean.setBoard_image(rs.getString("board_image"));
		bean.setBoard_writer_idx(rs.getInt("board_writer_idx"));
		bean.setBoard_status(rs.getInt("board_status"));

		db.close();

		return bean;
	}

	// 게시글 목록을 가져오는 메서드
	public static ArrayList<BoardBean> getBoardList(int page) throws Exception {
		// 데이터 베이스 접속
		Connection db = DBConn.getConnection();

		StringBuffer sql = new StringBuffer();
		String sql2 = "SELECT a.board_idx, a.board_subject,  a.board_read_cnt "
				+ ",(SELECT b.name FROM user b WHERE b.u_idx = a.board_writer_idx) name  "
				+ ",(SELECT COUNT(*) FROM reply_table_notice c WHERE c.reply_board_idx=a.board_idx) reply_cnt  "
				+ "FROM board_table_notice a WHERE a.board_status = 1 ORDER BY a.board_idx desc limit ?, ?";

		// sql2 = sql2.toLowerCase();
		System.out.println(sql2);
		// 페이지에 해당하는 인덱스 번호를 구한다.
		// 페이지당 10개...
		int rows = 10;

		int min = ((page - 1) * rows);
		int max = rows + min;

		// PreparedStatement pstmt = db.prepareStatement(sql.toString());
		PreparedStatement pstmt = db.prepareStatement(sql2);
		pstmt.setInt(1, min);
		pstmt.setInt(2, max);

		ResultSet rs = pstmt.executeQuery();

		// 데이터를 담을 ArrayList를 만들어 준다.
		ArrayList<BoardBean> list = new ArrayList<BoardBean>();

		while (rs.next()) {
			// 로우 하나의 데이터를 담을 빈 객체 생성
			BoardBean bean = new BoardBean();
			// 데이터를 담는다.
			bean.setBoard_idx(rs.getInt("board_idx"));
			bean.setBoard_subject(rs.getString("board_subject"));
			bean.setBoard_writer_name(rs.getString("name"));
			bean.setBoard_read_cnt(rs.getInt("board_read_cnt"));
			bean.setReply_cnt(rs.getInt("reply_cnt"));
			// ArrayList에 담는다.
			list.add(bean);
		}

		db.close();

		return list;
	}

	// 전체 페이지 개수
	public static int getPageCnt() throws Exception {
		// 데이터 베이스 접속
		Connection db = DBConn.getConnection();

		// 쿼리문
		StringBuffer sql = new StringBuffer();
		sql.append("select count(*) from board_table_notice where board_status=1 ");

		PreparedStatement pstmt = db.prepareStatement(sql.toString());
		// 쿼리실행
		ResultSet rs = pstmt.executeQuery();
		rs.next();

		int count = rs.getInt(1);

		// 페이지 수를 계산한다.
		int page_cnt = count / 10;
		if (count % 10 > 0) {
			page_cnt++;
		}

		db.close();

		return page_cnt;
	}

	// 글을 삭제처리하는 메서드
	public static void deleteBoard(int board_idx) throws Exception {
		// 데이터 베이스 접속
		Connection db = DBConn.getConnection();
		// 쿼리문
		StringBuffer sql = new StringBuffer();
		sql.append("update board_table_notice ");
		sql.append("set board_status=2 ");
		sql.append("where board_idx=?");

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
		sql.append("update board_table_notice set ");
		sql.append("board_subject=?, board_content=?, ");
		sql.append("board_ip=? ");
		if (bean.getBoard_image() != null) {
			sql.append(", board_image=? ");
		}
		sql.append("where board_idx=?");

		PreparedStatement pstmt = db.prepareStatement(sql.toString());
		pstmt.setString(1, bean.getBoard_subject());
		pstmt.setString(2, bean.getBoard_content());
		pstmt.setString(3, bean.getBoard_ip());
		if (bean.getBoard_image() != null) {
			pstmt.setString(4, bean.getBoard_image());
			pstmt.setInt(5, bean.getBoard_idx());
		} else {
			pstmt.setInt(4, bean.getBoard_idx());
		}

		pstmt.execute();

		db.close();
	}

	// 댓글 추가 메서드
	public static void add_reply(ReplyBean bean) throws Exception {
		// 데이터베이스 접속
		Connection db = DBConn.getConnection();

		StringBuffer sql = new StringBuffer();
		sql.append("insert into reply_table_notice ");
		sql.append("(reply_content, reply_date, ");
		sql.append("reply_ip, reply_status, reply_writer_idx, ");
		sql.append("reply_board_idx) values ");
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
	public static ArrayList<ReplyBean> getReplyList(int board_idx) throws Exception {
		// 데이터베이스 접속
		Connection db = DBConn.getConnection();

		StringBuffer sql = new StringBuffer();

		sql.append("select a1.reply_idx, a1.reply_content, ");
		sql.append("a1.reply_writer_idx, a2.name ");
		sql.append("from reply_table_notice a1, user a2 ");
		sql.append("where a1.reply_writer_idx = a2.u_idx ");
		sql.append("and a1.reply_status = 1 ");
		sql.append("and a1.reply_board_idx = ? ");
		sql.append("order by a1.reply_idx desc ");

		PreparedStatement pstmt = db.prepareStatement(sql.toString());
		pstmt.setInt(1, board_idx);

		ResultSet rs = pstmt.executeQuery();

		// 데이터를 담을 ArrayList
		ArrayList<ReplyBean> list = new ArrayList<ReplyBean>();

		while (rs.next()) {
			ReplyBean bean = new ReplyBean();
			bean.setReply_idx(rs.getInt("reply_idx"));
			bean.setReply_content(rs.getString("reply_content"));
			bean.setReply_writer_idx(rs.getInt("reply_writer_idx"));
			bean.setReply_writer_name(rs.getString("name"));

			list.add(bean);
		}

		db.close();

		return list;
	}

	// 댓글 삭제처리하는 메서드
	public static void remove_reply(int reply_idx) throws Exception {
		Connection db = DBConn.getConnection();

		StringBuffer sql = new StringBuffer();
		sql.append("update reply_table_notice ");
		sql.append("set reply_status=2 ");
		sql.append("where reply_idx=?");

		PreparedStatement pstmt = db.prepareStatement(sql.toString());
		pstmt.setInt(1, reply_idx);

		pstmt.execute();

		db.close();
	}

	// 조회수를 증가하는 메서드
	public static void addReadCnt(int board_idx) throws Exception {
		Connection db = DBConn.getConnection();
		// 쿼리문
		StringBuffer sql = new StringBuffer();
		sql.append("update board_table_notice set ");
		sql.append("board_read_cnt = board_read_cnt + 1 ");
		sql.append("where board_idx=?");

		PreparedStatement pstmt = db.prepareStatement(sql.toString());
		pstmt.setInt(1, board_idx);

		pstmt.execute();

		db.close();
	}
}
