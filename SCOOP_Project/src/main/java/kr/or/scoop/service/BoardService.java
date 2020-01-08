package kr.or.scoop.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.scoop.dao.ProjectDao;
import kr.or.scoop.dto.TeamPjt;

@Service
public class BoardService {
	@Autowired
	private SqlSession sqlsession;
	
	public int insertTeamPjt(TeamPjt team) {
		int result = 0;
		// 아이디 존재 함 등록 못함
			ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
			System.out.println("여기좀 와주라 ㅠㅠㅠㅠ");	
			
			result = dao.insertPJT(team);
			
		return result;
		
	}
	
	
}
