package com.musical.breadway.mapper.marketer;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.musical.breadway.dto.ConsumerDTO;
import com.musical.breadway.dto.ReserveDTO;
import com.musical.breadway.dto.ScheduleDTO;
import com.musical.breadway.dto.SeatDTO;
import com.musical.breadway.dto.Venue_SeatsDTO;


@Service
public class MarketerProfitMapper {
	@Autowired
	private SqlSession sqlSession;
	
	
	public int showgetCount(Integer show_ID) {
		int count = sqlSession.selectOne("showgetCount", show_ID);
		return count;
	}
	
	public List<ScheduleDTO> seatinfo(Integer startRow, Integer endRow, Integer show_ID){
		Map<String,Integer> map = new Hashtable<String,Integer>();
		map.put("show_ID", show_ID);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<ScheduleDTO> list = sqlSession.selectList("seatinfo",map);
		return list;
	}
	
	public List<Venue_SeatsDTO> venue_seatFrame(Integer show_ID){
		List<Venue_SeatsDTO> list = sqlSession.selectList("venue_seatFrame", show_ID);
		return list;
	}
	
	public List<SeatDTO> get_allSeat(Integer show_ID){
		List<SeatDTO> seatlist = sqlSession.selectList("get_allSeat", show_ID);
		return seatlist;
	}
	
	
	public List<SeatDTO> getseat(String schedule_ID){
		List<SeatDTO> seatlist = sqlSession.selectList("getseat",schedule_ID);
		return seatlist;
	}
	
	public Integer get_consumerUID(Integer seat_ID){
		System.out.println("seat_ID:"+seat_ID);
		Integer consumer_UID = sqlSession.selectOne("get_consumerUID", seat_ID);
		System.out.println("매퍼 자바 컨슈머아이디: "+consumer_UID);
		return consumer_UID;
	}
	
	public ReserveDTO seatdetail(Integer seat_ID){
		ReserveDTO seatlist = sqlSession.selectOne("seatdetail", seat_ID);
		return seatlist;
	}

	public ConsumerDTO get_consumerInfo(Integer consumer_UID) {
		ConsumerDTO cdto = sqlSession.selectOne("get_consumerInfo", consumer_UID);
		return cdto;
	}

	public List<ReserveDTO> get_orderNumList(Integer schedule_ID, Integer consumer_UID) {
		Hashtable<String, Integer> ht = new Hashtable<String, Integer>();		
		ht.put("schedule_ID", schedule_ID);
		ht.put("consumer_UID", consumer_UID);
		List<ReserveDTO> rList = sqlSession.selectList("get_orderNumList", ht);
		return rList;
	}

	public Integer cancelReserve_byOrder(Integer order_Num, Integer schedule_ID) {
		Hashtable<String, Integer> ht = new Hashtable<String, Integer>();		
		ht.put("order_Num", order_Num);
		ht.put("schedule_ID", schedule_ID);
		Integer seatCount = sqlSession.selectOne("seatGetCount", ht);
		System.out.println("seatCount: "+seatCount);
		System.out.println("schedule_ID: "+schedule_ID);
		Hashtable<String, Integer> ht2 = new Hashtable<String, Integer>();		
		ht2.put("seatCount", seatCount);
		ht2.put("schedule_ID", schedule_ID);
		sqlSession.update("seat_MinusQty", ht2);
		return sqlSession.update("cancelReserve_byOrder", order_Num);
	}

	public List<ReserveDTO> get_allReservedBySchNum(Integer schedule_ID) {
		 List<ReserveDTO> reservedList = sqlSession.selectList("get_allReservedBySchNum", schedule_ID);
		return reservedList;
	}

	public List<Integer> get_seatID(Integer order_Num) {
		List<Integer> seatIDList = sqlSession.selectList("get_seatID", order_Num);
		return seatIDList;
	}
	
	public Integer delete_Seat(Integer seat_ID) {
		sqlSession.update("seatGetCount", seat_ID);
		return sqlSession.update("delete_Seat", seat_ID);
	}
	
	public List<Venue_SeatsDTO> get_TotalSeatNum(Integer show_ID) {
		return sqlSession.selectList("get_TotalSeatNum", show_ID);
	}
	
	
	
}
