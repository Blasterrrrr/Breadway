package com.musical.breadway.mapper.manager;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.musical.breadway.dto.ConsumerDTO;

@Service
public class Manager_ConsumerManageMapper {

	@Autowired
	private SqlSession sqlSession;
	
	public List<ConsumerDTO> ManagerlistConsumer(String startRow ,String endRow){
		Map<String, String> map = new Hashtable<String, String>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<ConsumerDTO> list = sqlSession.selectList("ManagerlistConsumer",map);
		return list;
	}
	
	public List<ConsumerDTO> ManagersearchConsumer(String consumersearch,String consumerString){
		Map<String, String> map = new Hashtable<String, String>();
		map.put("consumersearch", consumersearch);
		map.put("consumerString", consumerString);
		List<ConsumerDTO> list = sqlSession.selectList("ManagersearchConsumer",map);
		return list;
	}
	
	public ConsumerDTO ManagergetConsumer(String num) {
		ConsumerDTO dto = sqlSession.selectOne("ManagergetConsumer",num);
		return dto;
	}
	
	public int ManagerupdateConsumer(ConsumerDTO dto) {
		int res = sqlSession.update("ManagerupdateConsumer",dto);
		return res;
	}
	
	public int ManagerdeleteConsumer(String num) {
		int res = sqlSession.delete("ManagerdeleteConsumer",num);
		return res;
	}
	
	public int ManagerconsumergetCount() {
		int res = sqlSession.selectOne("ManagerconsumergetCount");
		return res;
	}
	
	public int Managerconsumeridcheck(String consumer_id) {
		int res  = sqlSession.selectOne("Managerconsumeridcheck",consumer_id);
		return res;
	}
}
