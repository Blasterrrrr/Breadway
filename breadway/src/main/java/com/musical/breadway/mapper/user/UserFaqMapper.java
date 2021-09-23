package com.musical.breadway.mapper.user;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.musical.breadway.dto.FaqDTO;


@Service
public class UserFaqMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<FaqDTO> listFAQ(int startRow, int endRow){
		Map<String, Integer> map = new Hashtable<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<FaqDTO> faq_list = sqlSession.selectList("listFAQ", map);
		return faq_list;
	}
	
	public List<FaqDTO> faqKeywordList(String keyword) {
		List<FaqDTO> list = sqlSession.selectList("keywordList", keyword);
		return list;
	}
	
	public List<FaqDTO> selectByWord(int startRow, int endRow){
		Map<String, Integer> map = new Hashtable<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<FaqDTO> faq_list = sqlSession.selectList("listFAQ", map);
		return faq_list;
	}
	
	
	public List<FaqDTO> faqFind(String question) {
		List<FaqDTO> list = sqlSession.selectList("faqFind", question);
		return list;
	}
	
	public List<FaqDTO> selectByKeyword(String keyword){
		List<FaqDTO> faq_keyword = sqlSession.selectList("selectByKeyword", keyword);
		return faq_keyword;
	}
	
	public int insertFAQ(FaqDTO dto) {
		int res = sqlSession.insert("insertFAQ", dto);
		return res;
	}
	
	public int deleteFAQ(int num) {
		int res = sqlSession.delete("deleteFAQ", num);
		return res;
	}
	
	public FaqDTO getFAQ(int num){
		List<FaqDTO> list = sqlSession.selectList("getFAQ", num);
		return list.get(0);
	}
	
	public int updateFAQ(FaqDTO dto) {
		int res = sqlSession.update("updateFAQ", dto);
		return res;
	}

	public int faqgetCount() {
		int count = sqlSession.selectOne("faqgetCount");
		return count;
		}
		

	
	
}
