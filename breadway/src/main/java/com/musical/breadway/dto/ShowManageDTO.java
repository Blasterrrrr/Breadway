package com.musical.breadway.dto;

public class ShowManageDTO {//table name = show + theatre 
	private int show_ID;
	private String show_name;
	private String show_organizer;
	private String show_role_table_Name;
	private int theatre_id;
	private String theatre_name;
	private String theatre_address;
	private int theatre_areacode;
	private String startDate;
	private String endDate;
	private String genre;
	private String rate;
	private int duration;
	private String detail;
	private String notice;
	private int show_Status;
	private int Show_Marketer_UID;
	private String posterName;
	private String videoLink;
	
	public String getShow_role_table_Name() {
		return show_role_table_Name;
	}
	public void setShow_role_table_Name(String show_role_table_Name) {
		this.show_role_table_Name = show_role_table_Name;
	}
	public String getVideoLink() {
		return videoLink;
	}
	public void setVideoLink(String videoLink) {
		this.videoLink = videoLink;
	}
	public int getShow_ID() {
		return show_ID;
	}
	public void setShow_ID(int show_ID) {
		this.show_ID = show_ID;
	}
	public String getShow_name() {
		return show_name;
	}
	public void setShow_name(String show_name) {
		this.show_name = show_name;
	}
	public String getShow_organizer() {
		return show_organizer;
	}
	public void setShow_organizer(String show_organizer) {
		this.show_organizer = show_organizer;
	}
	public int getTheatre_id() {
		return theatre_id;
	}
	public void setTheatre_id(int theatre_id) {
		this.theatre_id = theatre_id;
	}
	public String getTheatre_name() {
		return theatre_name;
	}
	public void setTheatre_name(String theatre_name) {
		this.theatre_name = theatre_name;
	}
	public String getTheatre_address() {
		return theatre_address;
	}
	public void setTheatre_address(String theatre_address) {
		this.theatre_address = theatre_address;
	}
	public int getTheatre_areacode() {
		return theatre_areacode;
	}
	public void setTheatre_areacode(int theatre_areacode) {
		this.theatre_areacode = theatre_areacode;
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
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
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
	public int getShow_Status() {
		return show_Status;
	}
	public void setShow_Status(int show_Status) {
		this.show_Status = show_Status;
	}
	public int getShow_Marketer_UID() {
		return Show_Marketer_UID;
	}
	public void setShow_Marketer_UID(int show_Marketer_UID) {
		Show_Marketer_UID = show_Marketer_UID;
	}
	public String getPosterName() {
		return posterName;
	}
	public void setPosterName(String posterName) {
		this.posterName = posterName;
	}
	
}
