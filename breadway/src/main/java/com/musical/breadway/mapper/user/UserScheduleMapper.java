package com.musical.breadway.mapper.user;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.musical.breadway.dto.ScheduleDTO2;


@Service
public class UserScheduleMapper {
	@Autowired
	private SqlSession sqlSession;
	
	public List<ScheduleDTO2> findSchedule(String start_date, String end_date, int show_id){
		Map<String, String> map = new HashMap<String, String>();
		map.put("start_date", start_date);
		map.put("end_date", end_date);
		map.put("show_id", Integer.toString(show_id));
		
		List<ScheduleDTO2> list = sqlSession.selectList("findSchedule", map);
		return list;
	}
	
	public ScheduleDTO2 fineScheduleOne(int schedule_id) {
		ScheduleDTO2 dto = sqlSession.selectOne("findScheduleOne", schedule_id);
		return dto;
	}
	
	public int updateSeatQtyOnSchedule(int seat_qty, int schedule_id) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("reserve_seat_qty", seat_qty);
		map.put("schedule_id", schedule_id);
		
		int result = sqlSession.update("updateSeatQtyOnSchedule", map);
		return result;
	}
}
