package com.musical.breadway.dto;

public class Venue_SeatsDTO {
	private int schedule_ID;
	private int venue_ID;
	private String seat_Section;
	private int seat_Qty;
	private int seat_Row;
	private int seat_Price;
	private int seat_Discount;
	private int theatre_ID;
	public int getSchedule_ID() {
		return schedule_ID;
	}
	public void setSchedule_ID(int schedule_ID) {
		this.schedule_ID = schedule_ID;
	}
	public int getVenue_ID() {
		return venue_ID;
	}
	public void setVenue_ID(int venue_ID) {
		this.venue_ID = venue_ID;
	}
	public String getSeat_Section() {
		return seat_Section;
	}
	public void setSeat_Section(String seat_Section) {
		this.seat_Section = seat_Section;
	}
	public int getSeat_Qty() {
		return seat_Qty;
	}
	public void setSeat_Qty(int seat_Qty) {
		this.seat_Qty = seat_Qty;
	}
	public int getSeat_Row() {
		return seat_Row;
	}
	public void setSeat_Row(int seat_Row) {
		this.seat_Row = seat_Row;
	}
	public int getSeat_Price() {
		return seat_Price;
	}
	public void setSeat_Price(int seat_Price) {
		this.seat_Price = seat_Price;
	}
	public int getSeat_Discount() {
		return seat_Discount;
	}
	public void setSeat_Discount(int seat_Discount) {
		this.seat_Discount = seat_Discount;
	}
	public int getTheatre_ID() {
		return theatre_ID;
	}
	public void setTheatre_ID(int theatre_ID) {
		this.theatre_ID = theatre_ID;
	}
	


}
