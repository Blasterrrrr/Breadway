package com.musical.breadway.dto;


public class ShowDTO {
	private Integer show_ID;
	private String show_Name;
	private String show_Organizer;
	private Integer theatre_ID;
	private String startDate;
	private String endDate;
	private String genre;
	private String rate;
	private Integer duration;
	private String detail;
	private String notice;
	private Integer show_Status;
	private Integer marketer_UID;
	private String posterName;
	private String videoLink;
	private String show_Role_Table_Name;
	

	public String getShow_Role_Table_Name() {
		return show_Role_Table_Name;
	}
	public void setShow_Role_Table_Name(String show_Role_Table_Name) {
		this.show_Role_Table_Name = show_Role_Table_Name;
	}
	public Integer getShow_ID() {
		return show_ID;
	}
	public void setShow_ID(Integer show_ID) {
		this.show_ID = show_ID;
	}
	public String getShow_Name() {
		return show_Name;
	}
	public void setShow_Name(String show_Name) {
		this.show_Name = show_Name;
	}
	public String getShow_Organizer() {
		return show_Organizer;
	}
	public void setShow_Organizer(String show_Organizer) {
		this.show_Organizer = show_Organizer;
	}
	public Integer getTheatre_ID() {
		return theatre_ID;
	}
	public void setTheatre_ID(Integer theatre_ID) {
		this.theatre_ID = theatre_ID;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getRate() {
		return rate;
	}
	public void setRate(String rate) {
		this.rate = rate;
	}
	public Integer getDuration() {
		return duration;
	}
	public void setDuration(Integer duration) {
		this.duration = duration;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	public Integer getShow_Status() {
		return show_Status;
	}
	public void setShow_Status(Integer show_Status) {
		this.show_Status = show_Status;
	}
	public Integer getMarketer_UID() {
		return marketer_UID;
	}
	public void setMarketer_UID(Integer marketer_UID) {
		this.marketer_UID = marketer_UID;
	}
	public String getPosterName() {
		return posterName;
	}
	public String setPosterName(String posterName) {
		return this.posterName = posterName;
	}
	public String getVideoLink() {
		return videoLink;
	}
	public void setVideoLink(String videoLink) {
		this.videoLink = videoLink;
	}

	
}
