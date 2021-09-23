package com.musical.breadway.mapper.marketer;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.musical.breadway.dto.MarketerDTO;



@Service
public class MarketerProfileMapper {
	@Autowired
	private SqlSession sqlSession;
	
	
//----------profile
	public List<MarketerDTO> profile_list(Integer marketer_UID){ 
		List<MarketerDTO> list = sqlSession.selectList("profile_list", marketer_UID);
		return list;
	}
	
	public Integer profile_update(MarketerDTO dto) {
		return sqlSession.update("profile_update", dto);
	}

	
}
