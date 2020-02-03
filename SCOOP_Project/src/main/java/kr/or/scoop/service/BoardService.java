package kr.or.scoop.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.scoop.dao.NoticeDao;
import kr.or.scoop.dao.ProjectDao;
import kr.or.scoop.dto.MyIssue;
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
			result = dao.insertPJT(team);
		return result;
		
	}
	public int insertTeamPjt2(String email, int tseq) {
		int result = 0;
		// 아이디 존재 함 등록 못함
		ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
		try {
			result = dao.insertPJT2(email, tseq);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
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
	
	public int deleteNotice(int bnseq) {
		int result = 0;
		NoticeDao dao = sqlsession.getMapper(NoticeDao.class);
		result = dao.deleteNotice(bnseq);
		
		return result;		
	}
	
}
