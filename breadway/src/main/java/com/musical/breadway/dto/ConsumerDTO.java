package com.musical.breadway.dto;

public class ConsumerDTO {
	private int consumer_UID;
	private String consumer_ID;
	private String consumer_Password;
	private String consumer_Name;
	private String consumer_Email;
	private String authKey;
	private String consumer_Phone;
	private int consumer_Status;
	
	public int getConsumer_UID() {
		return consumer_UID;
	}
	public void setConsumer_UID(int consumer_UID) {
		this.consumer_UID = consumer_UID;
	}
	public String getConsumer_ID() {
		return consumer_ID;
	}
	public void setConsumer_ID(String consumer_ID) {
		this.consumer_ID = consumer_ID;
	}
	public String getConsumer_Password() {
		return consumer_Password;
	}
	public void setConsumer_Password(String consumer_Password) {
		this.consumer_Password = consumer_Password;
	}
	public String getConsumer_Name() {
		return consumer_Name;
	}
	public void setConsumer_Name(String consumer_Name) {
		this.consumer_Name = consumer_Name;
	}
	public String getConsumer_Email() {
		return consumer_Email;
	}
	public void setConsumer_Email(String consumer_Email) {
		this.consumer_Email = consumer_Email;
	}
	
	public String getAuthKey() {
		return authKey;
	}
	public void setAuthKey(String authKey) {
		this.authKey = authKey;
	}
	public String getConsumer_Phone() {
		return consumer_Phone;
	}
	public void setConsumer_Phone(String consumer_Phone) {
		this.consumer_Phone = consumer_Phone;
	}
	public int getConsumer_Status() {
		return consumer_Status;
	}
	public void setConsumer_Status(int consumer_Status) {
		this.consumer_Status = consumer_Status;
	}
	
	
	
}
