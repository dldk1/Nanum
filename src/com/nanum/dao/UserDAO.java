package com.nanum.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;

import com.nanum.db.DBConn;
import com.nanum.vo.FoodVO;
import com.nanum.vo.UserVO;

public class UserDAO {
	public static void insertUser(UserVO vo) throws Exception {
		// DB접속
		Connection db = DBConn.getConnection();
		// 쿼리 날려서 유저 정보를 삽입
		// insert into user (name, phone, id,pw) valuse ('이름','전화번호','이메일','비밀번호');
		String sql = "insert into user (id, pw, name, email, phone, gender) values (?, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = db.prepareStatement(sql);
		pstmt.setString(1, vo.getId());

		pstmt.setString(2, vo.getPw());
		pstmt.setString(3, vo.getName());
		pstmt.setString(4, vo.getEmail());
		pstmt.setString(5, vo.getPhone());
		pstmt.setString(6, vo.getGender());

		// 쿼리실행
		pstmt.executeUpdate();
		db.close();
	}

	// vo 객체를 넣어서 id pw 정보 확인
	public static Boolean getUser(UserVO vo) throws Exception {

		Connection db = DBConn.getConnection();

		// 쿼리 날려서 유저 정보를 검색
		String sql = "select * from user where id = ?";
		// String sql = "select * from user where id = ? and pw = ?";
		PreparedStatement pstmt = db.prepareStatement(sql);
		pstmt.setString(1, vo.getId());
		// DB에서 id과 함께 검색해서 넣어도 됨. 검색된 데이터가 있으면 로그인. 없으면 로그인 실패
		// pstmt.setString(2, vo.getPw());

		// id 만으로 검색해서 데이터가 있으면 pw DB 데이터와 vo.getPw() 데이터와 비교

		// 쿼리 실행해서 결과값 반환
		Boolean isLogin = false;
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) { // 검색된 데이터가 있으면 로그인 / 패스워드 체크 후 로그인 성공 여부
			String dbPw = rs.getString("pw");
			if (dbPw.equals(vo.getPw())) { // 입력한 패스워드가 데이터베이스 패스워드와 일치할 때
				isLogin = true;
			} else { // 불일치할 때
						// isLogin 이 false가 기본값이라서 else 문은 사실상 불필요~!~!!!!~!!~~~~~~~~!!!!
			}
		} else { // id 정보가 없음

		}

		db.close();
		return isLogin;
	}

	// String id, pw 를 매개변수로 넣어서 UserVO값을 반환
	// 들어가는 변수 String id, String pw
	// 리턴 받는 형은 UserVO

	public static Boolean getUser(String id, String pw) throws Exception {

		Connection db = DBConn.getConnection();
		System.out.println(id);
		System.out.println(pw);
		Boolean isLogin = false;
		// 쿼리 날려서 유저 정보를 검색
		String sql = "select * from user where id = ? and pw = ?";

		PreparedStatement pstmt = db.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);

		UserVO vo = null;
		ResultSet rs = pstmt.executeQuery();

		if (rs.next()) { // 검색된 데이터가 있으면 로그인 / 패스워드 체크 후 로그인 성공 여부
			isLogin = true;
			db.close();
		}
		return isLogin;
	}

	public static UserVO getUserInfoForAdmin(String u_idx) throws Exception {

		Connection db = DBConn.getConnection();

		// 쿼리 날려서 유저 정보를 검색
		String sql = "select * from user where u_idx = ?";

		PreparedStatement pstmt = db.prepareStatement(sql);
		pstmt.setString(1, u_idx);
		
		UserVO vo = null; //사용자 정보를 담는 객체
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) { // 검색된 데이터가 있으면 로그인 / 패스워드 체크 후 로그인 성공 여부
			vo = new UserVO();
			vo.setU_idx(rs.getInt("u_idx"));
			vo.setId(rs.getString("id"));
			vo.setName(rs.getString("name"));
			vo.setEmail(rs.getString("email"));
			vo.setPhone(rs.getString("phone"));
			vo.setPw(rs.getString("pw"));
		}
		db.close();
		return vo;
	}
	
	public static UserVO getUser2(String id, String pw) throws Exception {

		Connection db = DBConn.getConnection();

		// 쿼리 날려서 유저 정보를 검색
		String sql = "select * from user where id = ? and pw = ?";

		PreparedStatement pstmt = db.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		UserVO vo = null;
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) { // 검색된 데이터가 있으면 로그인 / 패스워드 체크 후 로그인 성공 여부
			vo = new UserVO();
			vo.setName(rs.getString("name"));
			vo.setId(rs.getString("id"));
			vo.setU_idx(rs.getInt("U_idx"));
			vo.setPhone(rs.getString("phone"));
		}
		db.close();
		return vo;
	}

	/*
	 * 사용법 : 리턴 타입은 Boolean ID가 있으면 true 없으면 false Boolean isid=idCheck(id); isID값을
	 * 비교
	 */
	public static Boolean idCheck(String id) throws Exception {

		Connection db = DBConn.getConnection();

		// 쿼리 날려서 유저 정보를 검색
		String sql = "select * from user where id = ?";

		PreparedStatement pstmt = db.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		Boolean isid = rs.next();

		db.close();
		return isid;
	}

	// 사용자 정보 리스트를 가져오는 메tho드
	// UserVO는 사용자 하나의 정보
	// 리스트에 UserVO를 담으면 여러개의 사용자 정보를 받아 올 수 있겠네 ?
	/*
	 * getUser를 호출하면 리스트를 받을 수 있다. 사용법 : ArrayList<UserVO> getList =
	 * UserDAO.getUser();
	 */
	public static ArrayList<UserVO> getUser() throws Exception {

		Connection db = DBConn.getConnection();

		// 쿼리 날려서 유저 정보를 검색
		String sql = "select * from user";

		PreparedStatement pstmt = db.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery(); // 쿼리를 DB에 날려서 rs값을 받음

		// 사용자 정보를 담는 리스트
		ArrayList<UserVO> userList = new ArrayList<>();

		// 사용자 정보가 한줄씩 읽어서 DB정보의 user 테이블의 마지막까지 읽어서 더이상 읽을 정보가 없으면 while문 종료
		while (rs.next()) {
			UserVO vo = new UserVO(); // 사용자 정보를 담는 객체
			vo.setU_idx(rs.getInt("u_idx"));
			vo.setId(rs.getString("id"));
			vo.setPw(rs.getString("pw"));
			vo.setName(rs.getString("name"));
			vo.setEmail(rs.getString("email"));
			vo.setPhone(rs.getString("phone"));
			vo.setState(rs.getInt("state"));
			userList.add(vo); // 사용자 정보 객체를 리스트에 담기
		}
		db.close();
		return userList;
	}

	// 사용자 정보 삭제
	
	public static Boolean delInfo(String id, String pw) throws Exception {
		// TODO Auto-generated method stub
		Boolean isDelete=false;
		
		System.out.println(id);
		System.out.println(pw);		
		
			Connection db = DBConn.getConnection();

			String sql = "delete from user where id = ?";
			PreparedStatement pstmt = db.prepareStatement(sql);
			pstmt.setString(1, id);

			// 쿼리실행
			pstmt.executeUpdate();
			db.close();
			
			isDelete=true;
		
	
		return  isDelete;
	}

	public static void delInfo(String u_idx) throws Exception {
		// TODO Auto-generated method stub
		Connection db = DBConn.getConnection();

		String sql = "delete from user where u_idx=?";
		PreparedStatement pstmt = db.prepareStatement(sql);
		pstmt.setString(1, u_idx);

		// 쿼리실행
		pstmt.executeUpdate();
		db.close();
	}
	
	public static UserVO getUserInfo(String id) throws Exception {

		Connection db = DBConn.getConnection();

		// 쿼리 날려서 유저 정보를 검색
		String sql = "select * from user where id = ?";

		PreparedStatement pstmt = db.prepareStatement(sql);
		pstmt.setString(1, id);

		UserVO vo = null; // 사용자 정보를 담는 객체
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) { // 검색된 데이터가 있으면 로그인 / 패스워드 체크 후 로그인 성공 여부
			vo = new UserVO();
			vo.setId(rs.getString("id"));
			vo.setPw(rs.getString("pw"));
			vo.setName(rs.getString("name"));
			vo.setEmail(rs.getString("email"));
			vo.setPhone(rs.getString("phone"));

		}
		db.close();
		return vo;
	}

	// 사용자 정보 수정
	public static void updateInfo(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		Connection db = DBConn.getConnection();
		// 쿼리 날려서 유저 정보를 삽입
		// insert into user (name, phone, id,pw) valuse ('이름','전화번호','이메일','비밀번호');
		String sql = "update user set name = ?, pw = ?, id= ?, phone = ?, email=? where id=?";
		PreparedStatement pstmt = db.prepareStatement(sql);
		pstmt.setString(1, vo.getName());
		pstmt.setString(2, vo.getPw());
		pstmt.setString(3, vo.getId());
		pstmt.setString(4, vo.getPhone());
		pstmt.setString(5, vo.getEmail());		
		pstmt.setString(6, vo.getId());

		// 쿼리실행
		pstmt.executeUpdate();
		db.close();
	}

	public static int getMemberId(String id) throws Exception {

		Connection db = DBConn.getConnection();

		// 쿼리 날려서 유저 정보를 검색
		String sql = "select * from user where id=?";

		PreparedStatement pstmt = db.prepareStatement(sql);
		pstmt.setString(1, id);

		int ret = 0; // id가 없으면 3

		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) { // 검색된 데이터가 있으면 로그인 / 패스워드 체크 후 로그인 성공 여부
			ret = 1; // id가 있으면 2
		}
		db.close();
		return ret;
	}

	public static int getMemberEmail(String email) throws Exception {

		Connection db = DBConn.getConnection();

		// 쿼리 날려서 유저 정보를 검색
		String sql = "select * from user where email=?";

		PreparedStatement pstmt = db.prepareStatement(sql);
		pstmt.setString(1, email);

		int ret = 0; // id가 없으면 3

		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) { // 검색된 데이터가 있으면 로그인 / 패스워드 체크 후 로그인 성공 여부
			ret = 1; // id가 있으면 2
		}
		db.close();
		return ret;
	}

	
	public static FoodVO randomFood() {
	
	// DB 연결 코드 작성
	Connection conn = null;
	ArrayList<FoodVO> foodList = new ArrayList<>();

	try {

		conn = DBConn.getConnection();

		// 데이터베이스에 연결후 쿼리 날림
		PreparedStatement pstm = null; // SQL 문을 나타내는 객체
		ResultSet rs = null; // 쿼리문을 날린것에 대한 반환값을 담을 객체

		String sql = "SELECT * FROM bab"; // bab테이블

		pstm = conn.prepareStatement(sql);
		rs = pstm.executeQuery();

		while (rs.next()) {
			FoodVO vo = new FoodVO();
			/* int idx = rs.getInt("idx");			
			String store = rs.getString("store");
			String menu = rs.getString("menu");
			int price = rs.getInt("price"); */
			vo.setIdx(rs.getInt("idx"));
			vo.setStore(rs.getString("store"));
			vo.setMenu(rs.getString("menu"));
			vo.setPrice(rs.getInt("price"));

			foodList.add(vo);

		}
		conn.close();
	} catch (SQLException sqle) {
		System.out.println("DB 접속실패 : " + sqle.toString());
	} catch (Exception e) {
		System.out.println("Unknown error");
		e.printStackTrace();
	}

	Random rnd = new Random();
	int rNum = rnd.nextInt(foodList.size());
	FoodVO fVO = new FoodVO();
	fVO = foodList.get(rNum); // 밥 리스트중 하나 뽑음
	
	return fVO;
	}
	
	
}