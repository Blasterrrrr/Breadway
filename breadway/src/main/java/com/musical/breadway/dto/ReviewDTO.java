package com.musical.breadway.dto;

import java.sql.Date;

public class ReviewDTO {
	
	private Integer num;
	private Integer show_ID;
	private Date view_date;
	private String rev_subject;
	private String writer;
	private String score;
	private String rev_content;
	private String reg_date;
	private Integer readcount;
	
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public Integer getShow_ID() {
		return show_ID;
	}
	public void setShow_ID(Integer show_ID) {
		this.show_ID = show_ID;
	}
	public Date getView_date() {
		return view_date;
	}
	public void setView_date(Date view_date) {
		this.view_date = view_date;
	}
	public String getRev_subject() {
		return rev_subject;
	}
	public void setRev_subject(String rev_subject) {
		this.rev_subject = rev_subject;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getRev_content() {
		return rev_content;
	}
	public void setRev_content(String rev_content) {
		this.rev_content = rev_content;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public Integer getReadcount() {
		return readcount;
	}
	public void setReadcount(Integer readcount) {
		this.readcount = readcount;
	}
	
}
