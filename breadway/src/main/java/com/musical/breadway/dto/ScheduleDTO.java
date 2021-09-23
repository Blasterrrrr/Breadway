package com.musical.breadway.dto;

public class ScheduleDTO {
	private Integer schedule_ID;
	private String schedule_Date;
	private String schedule_Time;
	private Integer show_ID;
	private Integer role_Set;
	private Integer reserve_seat_qty;
	
	public Integer getReserve_seat_qty() {
		return reserve_seat_qty;
	}
	public void setReserve_seat_qty(Integer reserve_seat_qty) {
		this.reserve_seat_qty = reserve_seat_qty;
	}
	public Integer getSchedule_ID() {
		return schedule_ID;
	}
	public void setSchedule_ID(Integer schedule_ID) {
		this.schedule_ID = schedule_ID;
	}
	public String getSchedule_Date() {
		return schedule_Date;
	}
	public void setSchedule_Date(String schedule_Date) {
		this.schedule_Date = schedule_Date;
	}
	public String getSchedule_Time() {
		return schedule_Time;
	}
	public void setSchedule_Time(String schedule_Time) {
		this.schedule_Time = schedule_Time;
	}
	public Integer getShow_ID() {
		return show_ID;
	}
	public void setShow_ID(Integer show_ID) {
		this.show_ID = show_ID;
	}
	public Integer getRole_Set() {
		return role_Set;
	}
	public void setRole_Set(Integer role_Set) {
		this.role_Set = role_Set;
	}
	
}
