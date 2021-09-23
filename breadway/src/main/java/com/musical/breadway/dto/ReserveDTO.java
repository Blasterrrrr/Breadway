package com.musical.breadway.dto;

public class ReserveDTO {
	private int reserve_ID;
	private String reserve_Date;
	private int seat_ID;
	private String seat_Name;
	private int seat_Price;
	private int seat_Discount;
	private int show_ID;
	private int reserve_Status;
	private int consumer_UID;
	private String consumer_Name;
	private int order_Num;
	private int schedule_ID;
	private String reserve_Cancel_Date;
	
	public String getConsumer_Name() {
		return consumer_Name;
	}
	public void setConsumer_Name(String consumer_Name) {
		this.consumer_Name = consumer_Name;
	}
	public int getReserve_ID() {
		return reserve_ID;
	}
	public void setReserve_ID(int reserve_ID) {
		this.reserve_ID = reserve_ID;
	}
	public String getReserve_Date() {
		return reserve_Date;
	}
	public void setReserve_Date(String reserve_Date) {
		this.reserve_Date = reserve_Date;
	}
	public int getSeat_ID() {
		return seat_ID;
	}
	public void setSeat_ID(int seat_ID) {
		this.seat_ID = seat_ID;
	}
	public String getSeat_Name() {
		return seat_Name;
	}
	public void setSeat_Name(String seat_Name) {
		this.seat_Name = seat_Name;
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
	public int getShow_ID() {
		return show_ID;
	}
	public void setShow_ID(int show_ID) {
		this.show_ID = show_ID;
	}
	public int getReserve_Status() {
		return reserve_Status;
	}
	public void setReserve_Status(int reserve_Status) {
		this.reserve_Status = reserve_Status;
	}
	public int getConsumer_UID() {
		return consumer_UID;
	}
	public void setConsumer_UID(int consumer_UID) {
		this.consumer_UID = consumer_UID;
	}
	public int getOrder_Num() {
		return order_Num;
	}
	public void setOrder_Num(int order_Num) {
		this.order_Num = order_Num;
	}
	public int getSchedule_ID() {
		return schedule_ID;
	}
	public void setSchedule_ID(int schedule_ID) {
		this.schedule_ID = schedule_ID;
	}
	public String getReserve_Cancel_Date() {
		return reserve_Cancel_Date;
	}
	public void setReserve_Cancel_Date(String reserve_Cancel_Date) {
		this.reserve_Cancel_Date = reserve_Cancel_Date;
	}
}
