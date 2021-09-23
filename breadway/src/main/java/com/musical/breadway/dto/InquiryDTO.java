package com.musical.breadway.dto;

public class InquiryDTO {
	
	private int consumer_UID;
	private int num;
	private String inqdate;
	private String name;
	private String email;
	private String subject;
	private String content;
	private String passwd;
	private int re_step;
	private int re_level;
	private int re_group;
	
	
	

	public int getConsumer_UID() {
		return consumer_UID;
	}
	public void setConsumer_UID(int consumer_UID) {
		this.consumer_UID = consumer_UID;
	}
	public String getInqdate() {
		return inqdate;
	}
	public void setInqdate(String inqdate) {
		this.inqdate = inqdate;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	public int getRe_group() {
		return re_group;
	}
	public void setRe_group(int re_group) {
		this.re_group = re_group;
	}
	
	
}
