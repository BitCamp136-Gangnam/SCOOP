package kr.or.scoop.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.scoop.dao.NoticeDao;
import kr.or.scoop.dao.ProjectDao;
import kr.or.scoop.dto.Notice;
import kr.or.scoop.dto.TeamPjt;

@Service
public class BoardService {
	@Autowired
	private SqlSession sqlsession;
	
	public int insertTeamPjt(TeamPjt team) {
		int result = 0;
		// 아이디 존재 함 등록 못함
			ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
			System.out.println("여기좀 와주라 ㅠㅠㅠㅠ123");	
			System.out.println(team.toString());
			result = dao.insertPJT(team);
			System.out.println("꺄르르륵");
		return result;
		
	}
	public int insertTeamPjt2(String email, int tseq) {
		int result = 0;
		// 아이디 존재 함 등록 못함
		System.out.println("매퍼 전");
		ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
		System.out.println("매퍼 후");
		System.out.println(email + tseq);
		result = dao.insertPJT2(email, tseq);
		System.out.println("꺄르르륵");
		return result;
		
	}
	
	public int insertNotice(Notice notice) {
		int result = 0;
		NoticeDao dao = sqlsession.getMapper(NoticeDao.class);
		result = dao.insertNotice(notice);
		
		return result;
		
	}
	
	public int updateNotice(Notice notice) {
		int result = 0;
		NoticeDao dao = sqlsession.getMapper(NoticeDao.class);
		result = dao.updateNotice(notice);
		
		return result;
	}

	
}
