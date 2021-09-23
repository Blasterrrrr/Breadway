package com.musical.breadway.mapper.user;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.musical.breadway.dto.InquiryDTO;

@Service
public class UserInquiryMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<InquiryDTO> listInquiry(String startRow, String endRow, int consumer_uid){ 
		Map<String,String> map = new Hashtable<String,String>();
		map.put("startRow",startRow);
		map.put("endRow",endRow);
		map.put("consumer_uid",String.valueOf(consumer_uid));
		List<InquiryDTO> list = sqlSession.selectList("listInquiry", map);
		return list;
	}
	
	public List<InquiryDTO> listInquiryAnswer(int consumer_uid) {
		List<InquiryDTO> list = sqlSession.selectList("listInquiryAnswer", consumer_uid);
		return list;
	}
	
	public List<InquiryDTO> inquirykeyword(String keyword){
		List<InquiryDTO> list = sqlSession.selectList("listInquiry",keyword);
		return list;
	}
	
	
	
	public int maxInquiry() {
		int max = sqlSession.selectOne("maxInquiry");
		return max;
	}
	
	public int setInquiry(String re_group,String re_step) {
		Map<String,String> map = new Hashtable<String,String>();
		map.put("re_group", re_group);
		map.put("re_step", re_step);
		int set = sqlSession.update("setInquiry", map);
		return set;
	}
	
	public int insertInquiry(InquiryDTO dto) {
		int res = sqlSession.insert("insertInquiry", dto);
		return res;
	}
	
	public int deleteInquiry(int num) {
		int res = sqlSession.delete("deleteInquiry", num);
		return res;
	}
	
	public int updateInquiry(InquiryDTO dto) {
		int res = sqlSession.update("updateInquiry",dto);
		return res;
	}
	
	public InquiryDTO getInquiry(int num){
		InquiryDTO dto = sqlSession.selectOne("getInquiry", num);
		return dto;
	}
	
	public InquiryDTO getInquiryAnswer(Map<String, Integer> params) {
		
		InquiryDTO dto = sqlSession.selectOne("getInquiryAnswer", params);
		return dto;
	}
	
	public int inqgetCount(int consumer_uid) {
		int count = sqlSession.selectOne("inqgetCount", consumer_uid);
		return count;
	}
	
	
	
}
