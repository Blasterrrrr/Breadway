package com.musical.breadway.mapper.manager;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.musical.breadway.dto.InquiryDTO;

@Service
public class Manager_InquiryMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<InquiryDTO> ManagerlistInquiry(String startRow, String endRow){ 
		Map<String,String> map = new Hashtable<String,String>();
		map.put("startRow",startRow);
		map.put("endRow",endRow);
		List<InquiryDTO> list = sqlSession.selectList("ManagerlistInquiry", map);
		return list;
	}
	
	public List<InquiryDTO> Managerinquirykeyword(String keyword){
		List<InquiryDTO> list = sqlSession.selectList("Managerinquirykeyword",keyword);
		return list;
	}
	
	public int ManagerinsertInquiry(InquiryDTO dto) {
		int res = sqlSession.insert("ManagerinsertInquiry", dto);
		return res;
	}
	
	public int ManagerdeleteInquiry(int num) {
		int res = sqlSession.delete("ManagerdeleteInquiry", num);
		return res;
	}
	
	public int ManagerupdateInquiry(InquiryDTO dto) {
		int res = sqlSession.update("ManagerupdateInquiry",dto);
		return res;
	}
	
	public InquiryDTO ManagergetInquiry(int num,int re_step ,int re_level, int re_group){
		Map<String,Integer> map = new Hashtable<String,Integer>();
		map.put("num",num);
		map.put("re_step",re_step);
		map.put("re_level",re_level);
		map.put("re_group",re_group);
		InquiryDTO dto = sqlSession.selectOne("ManagergetInquiry", map);
		return dto;
	}
	
	public int ManagerinqgetCount() {
		int count = sqlSession.selectOne("ManagerinqgetCount");
		return count;
	}
	
}
