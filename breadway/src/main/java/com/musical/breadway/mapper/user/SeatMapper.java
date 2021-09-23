package com.musical.breadway.mapper.user;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.musical.breadway.dto.SeatDTO;
import com.musical.breadway.dto.Venue_SeatsDTO;

@Service
public class SeatMapper {
	@Autowired
	private SqlSession sqlSession;
	
	public List<Venue_SeatsDTO> findSeatSection(int schedule_id){
		List<Venue_SeatsDTO> list = sqlSession.selectList("searchSeatSection", schedule_id);
		return list;
	}
	
	public List<SeatDTO> findCurrentStatusOfSeats(String seat_section, int schedule_id){
		Map<String, String> map = new HashMap<String, String>();
		map.put("seat_section", seat_section);
		map.put("schedule_id", Integer.toString(schedule_id));
		
		List<SeatDTO> list = sqlSession.selectList("searchCurrentStatusOfSeats", map);
		return list;
	}
	
	public SeatDTO findCurrentStatusOfSeat(String seat_number, String schedule_id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("seat_number", seat_number);
		map.put("schedule_id", schedule_id);
		
		SeatDTO dto = sqlSession.selectOne("findCurrentStatusOfSeat", map);
		return dto;
	}
	
	public int insertReserveSeat(List<SeatDTO> list) {
		int result = sqlSession.insert("insertReserveSeat", list);
		return result;
	}

	//시트번호 가져오기
	public List<SeatDTO> findSeatKey(int schedule_id, List<SeatDTO> list) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schedule_id", schedule_id);
		map.put("list", list);
		
		List<SeatDTO> seatList = sqlSession.selectList("findSeatKey", map);		
		return seatList;
	}
	

	//공연장 시트 개수 가져오기
	public List<Venue_SeatsDTO> findVenueSeatQty(int theatre_id){
		List<Venue_SeatsDTO> list = sqlSession.selectList("findVenueSeatQty", theatre_id);
		return list;
	}	

}
