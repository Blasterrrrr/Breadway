package com.musical.breadway.mapper.manager;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.musical.breadway.dto.FaqDTO;


@Service
public class Manager_FaqMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<FaqDTO> ManagerlistFAQ(int startRow, int endRow){
		Map<String, Integer> map = new Hashtable<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<FaqDTO> faq_list = sqlSession.selectList("ManagerlistFAQ", map);
		return faq_list;
	}
	
	public List<FaqDTO> ManagerselectByWord(int startRow, int endRow){
		Map<String, Integer> map = new Hashtable<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<FaqDTO> faq_list = sqlSession.selectList("ManagerlistFAQ", map);
		return faq_list;
	}
	
	public List<FaqDTO> ManagerselectByKeyword(String keyword){
		List<FaqDTO> faq_keyword = sqlSession.selectList("ManagerselectByKeyword", keyword);
		return faq_keyword;
	}
	
	public int ManagerinsertFAQ(FaqDTO dto) {
		int res = sqlSession.insert("ManagerinsertFAQ", dto);
		return res;
	}
	
	public int ManagerdeleteFAQ(int num) {
		int res = sqlSession.delete("ManagerdeleteFAQ", num);
		return res;
	}
	
	public FaqDTO ManagergetFAQ(int num){
		FaqDTO list = sqlSession.selectOne("ManagergetFAQ", num);
		return list;
	}
	
	public int ManagerupdateFAQ(FaqDTO dto) {
		int res = sqlSession.update("ManagerupdateFAQ", dto);
		return res;
	}

	public int ManagerfaqgetCount() {
		int count = sqlSession.selectOne("ManagerfaqgetCount");
		return count;
		}
		

	
	
}
