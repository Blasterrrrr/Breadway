package com.musical.breadway.mapper.marketer;

import java.util.Hashtable;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.musical.breadway.dto.ScheduleDTO;


@Service
public class MarketerScheduleMapper {
	@Autowired
	private SqlSession sqlSession;
	
	
	public Integer insert_schedule(ScheduleDTO dto) {
		return  sqlSession.insert("insert_schedule", dto);
	}

	public List<ScheduleDTO> list_schedule(Integer show_ID){
		List<ScheduleDTO> list = sqlSession.selectList("list_schedule", show_ID);
		return list;
	}
	
	public List<ScheduleDTO> get_schedule(Integer schedule_ID){
		List<ScheduleDTO> list = sqlSession.selectList("get_schedule", schedule_ID);
		return list;
	}

	public LinkedHashMap<String, String> get_scheduledCasts(String show_Role_Table_Name, Integer role_Set) {
		Hashtable<String, String> ht = new Hashtable<String, String>();		
		ht.put("show_Role_Table_Name", show_Role_Table_Name);
		String role_Set2 = String.valueOf(role_Set);
		ht.put("role_Set", role_Set2);
		LinkedHashMap<String, String> ht2 = sqlSession.selectOne("get_scheduledCasts", ht);
		return ht2;
	}

	public Integer delete_schedule(Integer schedule_ID) {
		sqlSession.update("delete_allSeat", schedule_ID);
		sqlSession.update("cancelReserve_bySch", schedule_ID);
		return sqlSession.update("delete_schedule", schedule_ID);
	}

	public Integer update_schedule(ScheduleDTO dto) {
		return  sqlSession.update("update_schedule", dto);
	}
	
	
}
