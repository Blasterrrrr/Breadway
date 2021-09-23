package com.musical.breadway.mapper.manager;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.musical.breadway.dto.MarketerDTO;

@Service
public class Manager_MarketerManageMapper {
	@Autowired
	private SqlSession sqlSession;
	
	public List<MarketerDTO> ManagerlistMarketer(String startRow ,String endRow){
		Map<String, String> map = new Hashtable<String, String>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<MarketerDTO> list = sqlSession.selectList("ManagerlistMarketer",map);
		return list;
	}
	
	public List<MarketerDTO> ManagersearchMarketer(String marketersearch, String marketerString){
		Map<String, String> map = new Hashtable<String, String>();
		map.put("marketersearch", marketersearch);
		map.put("marketerString", marketerString);
		List<MarketerDTO> list = sqlSession.selectList("ManagersearchMarketer",map);
		return list;
	}
	
	public int ManagerstatusCheck(int num) {
		int res = sqlSession.update("ManagerstatusCheck",num);
		return res;
	}
	
	public MarketerDTO ManagergetMarketer(int marketer_uid) {
		MarketerDTO res = sqlSession.selectOne("ManagergetMarketer",marketer_uid);
		return res;
	}
	
	public int ManagerupdateMarketer(MarketerDTO dto) {
		int res = sqlSession.update("ManagerupdateMarketer",dto);
		return res;
	}
	
	public int ManagerdeleteMarketer(String num) {
		int res = sqlSession.delete("ManagerdeleteMarketer",num);
		return res;
	}
	
	public int ManagermarketergetCount() {
		int res = sqlSession.selectOne("ManagermarketergetCount");
		return res;
	}
	
	public int Managermarketeridcheck(String marketer_id) {
		int res  = sqlSession.selectOne("Managermarketeridcheck",marketer_id);
		return res;
	}
	
	public MarketerDTO ManagerMypageInfo() {
		MarketerDTO dto = sqlSession.selectOne("ManagerMypageInfo");
		return dto;
	}
	
	public int ManagerMypageInfoUpdate(MarketerDTO dto) {
		int res = sqlSession.update("ManagerMypageInfoUpdate",dto);
		return res;
	}
}
