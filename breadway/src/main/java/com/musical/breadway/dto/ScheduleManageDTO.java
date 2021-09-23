package com.musical.breadway.dto;

public class ScheduleManageDTO {//schedule + seat 컬럼 몇개
	private int schedule_id;
	private String schedule_date;
	private String schedule_time;
	private String show_id;
	private String seat_number;
	private String seat_price;
	private String seat_discount;
	
	public String getSeat_price() {
		return seat_price;
	}
	public void setSeat_price(String seat_price) {
		this.seat_price = seat_price;
	}
	public String getSeat_discount() {
		return seat_discount;
	}
	public void setSeat_discount(String seat_discount) {
		this.seat_discount = seat_discount;
	}
	public String getSeat_number() {
		return seat_number;
	}
	public void setSeat_number(String seat_number) {
		this.seat_number = seat_number;
	}
	public int getSchedule_id() {
		return schedule_id;
	}
	public void setSchedule_id(int schedule_id) {
		this.schedule_id = schedule_id;
	}
	public String getSchedule_date() {
		return schedule_date;
	}
	public void setSchedule_date(String schedule_date) {
		this.schedule_date = schedule_date;
	}
	public String getSchedule_time() {
		return schedule_time;
	}
	public void setSchedule_time(String schedule_time) {
		this.schedule_time = schedule_time;
	}
	public String getShow_id() {
		return show_id;
	}
	public void setShow_id(String show_id) {
		this.show_id = show_id;
	}
	
}
