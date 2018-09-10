package com.nanum.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.nanum.db.DBConn;
import com.nanum.vo.FoodVO;
import com.nanum.vo.RatingVO;
import com.nanum.vo.UserVO;

public class RatingDAO {
	public static void insertRating(RatingVO vo) throws Exception {
		// DB접속
		Connection db = DBConn.getConnection();
		// 쿼리 날려서 유저 정보를 삽입
		// insert into user (name, phone, id,pw) valuse ('이름','전화번호','이메일','비밀번호');
		String sql = "insert into rating_table (board_writer_idx, rating, content) values (?, ?, ?)";
		PreparedStatement pstmt = db.prepareStatement(sql);
		pstmt.setInt(1, vo.getBoard_writer_idx());
		pstmt.setInt(2, vo.getRating());
		pstmt.setString(3, vo.getContent());

		// 쿼리실행
		pstmt.executeUpdate();
		db.close();
	}
	
	public static List<RatingVO> getDetailRating(String board_writer_idx) throws Exception {

		Connection db = DBConn.getConnection();

		// 쿼리 날려서 유저 정보를 검색
		String sql = "select a1.board_writer_idx, a1.content, a1.rating, a2.name from rating_table a1, user a2 "
				+ "where a1.board_writer_idx = a2.u_idx  and a1.board_writer_idx = ?";

		PreparedStatement pstmt = db.prepareStatement(sql);
		pstmt.setString(1, board_writer_idx);
		
		List<RatingVO> list = new ArrayList<>();
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) { 
			RatingVO vo = new RatingVO();
//			vo.setR_idx(rs.getInt("r_idx"));
			vo.setBoard_writer_idx(rs.getInt("board_writer_idx"));
			vo.setRating(rs.getInt("rating"));
			vo.setName(rs.getString("name"));
			vo.setContent(rs.getString("content"));
			list.add(vo);
		}
		db.close();
		return list;
	}

	public static List<RatingVO> getRatingInfo(String board_writer_idx) throws Exception {

		Connection db = DBConn.getConnection();

		// 쿼리 날려서 유저 정보를 검색
		String sql = "select a1.board_writer_idx, a1.content, a1.rating, a2.name from rating_table a1, user a2 "
				+ "where a1.board_writer_idx = a2.u_idx  and a1.board_writer_idx = ? order by r_idx desc";
		
		System.out.println(sql);
		PreparedStatement pstmt = db.prepareStatement(sql);
		pstmt.setString(1, board_writer_idx);
		
		List<RatingVO> list = new ArrayList<>();
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) { 
			RatingVO vo = new RatingVO();
//			vo.setR_idx(rs.getInt("r_idx"));
			vo.setBoard_writer_idx(rs.getInt("board_writer_idx"));
			vo.setRating(rs.getInt("rating"));
			vo.setName(rs.getString("name"));
			vo.setContent(rs.getString("content"));
			list.add(vo);
		}
		db.close();
		return list;
	}
	
	public static List<RatingVO> getRatingInfo() throws Exception {

		Connection db = DBConn.getConnection();

		// 쿼리 날려서 유저 정보를 검색
		String sql = "select count(a1.board_writer_idx) as cnt, a1.board_writer_idx, a1.content, avg(a1.rating) as avg, a2.name  "
				+ "from rating_table a1, user a2 where a1.board_writer_idx = a2.u_idx  "
				+ "group by a1.board_writer_idx order by avg desc, cnt desc";

		PreparedStatement pstmt = db.prepareStatement(sql);
				
		List<RatingVO> list = new ArrayList<>();
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) { 
			RatingVO vo = new RatingVO();
//			vo.setR_idx(rs.getInt("r_idx"));
			vo.setBoard_writer_idx(rs.getInt("board_writer_idx"));
			vo.setCnt(rs.getInt("cnt"));
			vo.setRating(rs.getInt("avg"));
			vo.setName(rs.getString("name"));
			vo.setContent(rs.getString("content"));
			list.add(vo);
		}
		db.close();
		return list;
	}
	
	public static int getPageCnt() throws Exception{
		// 데이터 베이스 접속
		Connection db = DBConn.getConnection();
		
		// 쿼리문
		StringBuffer sql = new StringBuffer();
		sql.append("select count(*) from rating_table");		
				
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
	
}