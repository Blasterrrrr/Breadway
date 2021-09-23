package com.musical.breadway.dto;

public class SeatDTO {
	private int seat_ID;
	private String seat_Number;
	private String seat_Name;
	private int seat_Price;
	private int seat_Discount;
	private int schedule_ID;
	private int seat_Consumer_UID;
	private String consumer_Name;
	private String consumer_Phone;
	
	
	public String getSeat_Name() {
		return seat_Name;
	}
	public void setSeat_Name(String seat_Name) {
		this.seat_Name = seat_Name;
	}
	public int getSeat_ID() {
		return seat_ID;
	}
	public void setSeat_ID(int seat_ID) {
		this.seat_ID = seat_ID;
	}
	public String getSeat_Number() {
		return seat_Number;
	}
	public void setSeat_Number(String seat_Number) {
		this.seat_Number = seat_Number;
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
	public int getSchedule_ID() {
		return schedule_ID;
	}
	public void setSchedule_ID(int schedule_ID) {
		this.schedule_ID = schedule_ID;
	}
	public int getSeat_Consumer_UID() {
		return seat_Consumer_UID;
	}
	public void setSeat_Consumer_UID(int seat_consumer_UID) {
		this.seat_Consumer_UID = seat_consumer_UID;
	}
	public String getConsumer_Name() {
		return consumer_Name;
	}
	public void setConsumer_Name(String consumer_Name) {
		this.consumer_Name = consumer_Name;
	}
	public String getConsumer_Phone() {
		return consumer_Phone;
	}
	public void setConsumer_Phone(String consumer_Phone) {
		this.consumer_Phone = consumer_Phone;
	}
	
	


}
