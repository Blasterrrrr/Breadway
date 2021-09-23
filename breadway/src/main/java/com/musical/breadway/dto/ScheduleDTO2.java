package com.musical.breadway.dto;

import java.sql.Date;

public class ScheduleDTO2 {
	private int schedule_id;
	private Date schedule_date;
	private String schedule_time;
	private int show_id;
	private int role_Set;
	private int reserve_seat_qty;
	
	public int getRole_Set() {
		return role_Set;
	}
	public void setRole_Set(int role_Set) {
		this.role_Set = role_Set;
	}
	public void setReserve_seat_qty(int reserve_seat_qty) {
		this.reserve_seat_qty = reserve_seat_qty;
	}
	public int getReserve_seat_qty() {
		return reserve_seat_qty;
	}
	public void setReserve_seat_qty(Integer reserve_seat_qty) {
		this.reserve_seat_qty = reserve_seat_qty;
	}
	public int getSchedule_id() {
		return schedule_id;
	}
	public void setSchedule_id(int schedule_id) {
		this.schedule_id = schedule_id;
	}
	public Date getSchedule_date() {
		return schedule_date;
	}
	public void setSchedule_date(Date schedule_date) {
		this.schedule_date = schedule_date;
	}
	public String getSchedule_time() {
		return schedule_time;
	}
	public void setSchedule_time(String schedule_time) {
		this.schedule_time = schedule_time;
	}
	public int getShow_id() {
		return show_id;
	}
	public void setShow_id(int show_id) {
		this.show_id = show_id;
	}
}
