package com.nanum.vo;

public class RatingVO {
//	private int r_idx;
	private int board_writer_idx;
	private int rating;
	private int cnt;
	private String name;
	private String content;
	

	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getBoard_writer_idx() {
		return board_writer_idx;
	}
	public void setBoard_writer_idx(int board_writer_idx) {
		this.board_writer_idx = board_writer_idx;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	

}
