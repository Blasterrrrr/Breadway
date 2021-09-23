package com.musical.breadway.controller.user;

import java.util.Enumeration;
import java.util.Hashtable;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

public class ShowSeatStatusManager implements HttpSessionBindingListener {
	private static ShowSeatStatusManager seat_mgr = null;

	private static Hashtable<String, String> storage = new Hashtable<String, String>();
	
	private ShowSeatStatusManager() {}	
	public static synchronized ShowSeatStatusManager getInstance() {
		if(seat_mgr==null) {
			seat_mgr = new ShowSeatStatusManager();
		}
		return seat_mgr;
	}	
	
	//해당 좌석에 이미 누군가 먼저 선택을 했는지 체크
	public boolean checkCurrentStatusOfSeat(String seat_key) {
		return storage.containsKey(seat_key);
	}
	
	//해당 좌석 체크 저장
	public void setStatusOfSeat(String seat_key, String user) {
		storage.put(seat_key, user);
	}
	
	//user session 저장
	public void setSeatSession(HttpSession session, String user) {
		session.setAttribute(user, this);
	}
	
	//해당 유저가 session 시간을 초과하거나 주문 진행 취소시 시트 기록 지우기
	public void removeStatusOfSeat(String user) {
		 Enumeration<String> e = storage.keys();
		 
		 while (e.hasMoreElements()) {
			 String key = e.nextElement();
			 
			 if(storage.get(key).equals(user)) {
				 storage.remove(key);
			 }
		 }
	}
	
	@Override
	public void valueBound(HttpSessionBindingEvent event) {
		System.out.println(event.getName() + "생성");
	}
	
	@Override
	public void valueUnbound(HttpSessionBindingEvent event) {
		//해당 유저가 session 시간 초과시 해당 유저가 선택한 모든 좌석은 선택이 취소가 된다.
		System.out.println(event.getName() + "제거");
		removeStatusOfSeat(event.getName());
	}
}
