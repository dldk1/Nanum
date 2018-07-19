package com.nanum.vo;

public class ReplyBean {
	private int reply_idx;			// 인덱스
	private String reply_date;		// 작성 날짜
	private String reply_ip;		// 아이피
	private int reply_status;		// 상태
	private int reply_writer_idx;	// 작성자 인덱스
	private int reply_board_idx;	// 글 인덱스
	private String reply_content;	// 댓글 내용
	private String reply_writer_name;	// 작성자 이름
	
	public int getReply_idx() {
		return reply_idx;
	}
	public void setReply_idx(int reply_idx) {
		this.reply_idx = reply_idx;
	}
	public String getReply_date() {
		return reply_date;
	}
	public void setReply_date(String reply_date) {
		this.reply_date = reply_date;
	}
	public String getReply_ip() {
		return reply_ip;
	}
	public void setReply_ip(String reply_ip) {
		this.reply_ip = reply_ip;
	}
	public int getReply_status() {
		return reply_status;
	}
	public void setReply_status(int reply_status) {
		this.reply_status = reply_status;
	}
	public int getReply_writer_idx() {
		return reply_writer_idx;
	}
	public void setReply_writer_idx(int reply_writer_idx) {
		this.reply_writer_idx = reply_writer_idx;
	}
	public int getReply_board_idx() {
		return reply_board_idx;
	}
	public void setReply_board_idx(int reply_board_idx) {
		this.reply_board_idx = reply_board_idx;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public String getReply_writer_name() {
		return reply_writer_name;
	}
	public void setReply_writer_name(String reply_writer_name) {
		this.reply_writer_name = reply_writer_name;
	}
	
	

}






