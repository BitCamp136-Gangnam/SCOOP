package kr.or.scoop.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.scoop.dao.ProjectDao;
import kr.or.scoop.dao.TissueDao;
import kr.or.scoop.dto.PjNotice;
import kr.or.scoop.dto.Reply;
import kr.or.scoop.dto.TeamPjt;
import kr.or.scoop.dto.Tissue;

@Service
public class TeamService {
	
	@Autowired
	private SqlSession sqlsession;
	
	public List<Tissue> loadKanban(int tseq) {
		TissueDao dao = sqlsession.getMapper(TissueDao.class);
		List<Tissue> tissuelist = dao.loadKanban(tseq);
		return tissuelist;
	}
	
	public int teamSetting(int[] pjuserrank, int tseq, String[] email) {
		int result = 0 ;
		System.out.println("teamSetting");
		TissueDao dao = sqlsession.getMapper(TissueDao.class);
		for(int i=0; i<email.length;i++) {
			System.out.println(tseq);
			System.out.println(email[i]);
			System.out.println(pjuserrank[i]);
			result = dao.teamSetting(pjuserrank[i], tseq, email[i]);
			System.out.println(result);
		}
		return result;
	}
	public int EditKanban(int tseq, int tiseq, int isprocess) {
		int result = 0;
		TissueDao dao = sqlsession.getMapper(TissueDao.class);
		result = dao.kanbanEdit(tseq, tiseq, isprocess);
		return result;
	}
	public int banMember(int tseq, String email) {
		int result = 0;
		System.out.println(tseq);
		System.out.println(email);
		TissueDao dao = sqlsession.getMapper(TissueDao.class);
		result = dao.banMember(tseq, email);
		return result;
	}
	public int changeManager(int tseq, String email) {
		int result = 0;
		System.out.println(tseq);
		System.out.println(email);
		TissueDao dao = sqlsession.getMapper(TissueDao.class);
		result = dao.changeMember(tseq, email);
		return result;
	}
	public int changeManagerTp(int tseq, String email) {
		int result = 0;
		System.out.println(tseq);
		System.out.println(email);
		TissueDao dao = sqlsession.getMapper(TissueDao.class);
		result = dao.changeMemberTp(tseq, email);
		return result;
	}
	public int changeManagerTp2(int tseq, String email) {
		int result = 0;
		System.out.println(tseq);
		System.out.println(email);
		TissueDao dao = sqlsession.getMapper(TissueDao.class);
		result = dao.changeMemberTp2(tseq, email);
		return result;
	}
	public int dropProject(int tseq) {
		int result = 0;
		System.out.println(tseq);
		TissueDao dao = sqlsession.getMapper(TissueDao.class);
		result = dao.dropProject(tseq);
		return result;
	}
	public int teamUpdate(TeamPjt teampjt) {
		int result = 0;
		ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
		result = dao.updatePjt(teampjt);
		return result;
	}
	
	//팀 프로젝트 댓글 입력
	public int teamComment(int tiseq,String rcontent,String email) {
		TissueDao dao = sqlsession.getMapper(TissueDao.class);
		int result = dao.teamComment(tiseq,rcontent,email);
		return result;
	}
	//팀 댓글 비동기 뿌려주기 
	public List<Reply> teamCommentOk(int tiseq){
		TissueDao dao = sqlsession.getMapper(TissueDao.class);
		List<Reply> result = dao.teamCommentOk(tiseq);
		return result;
	}
	
	//팀 파일 업로드
	public int fileInsert(int tseq, String fdname, long fdcapa, String email) {
		TissueDao dao = sqlsession.getMapper(TissueDao.class);
		int result = dao.fileInsert(tseq, fdname, fdcapa, email);
		return result;
	}
	
	//개인 파일 업로드
	public int myFileInsert(String pfdname, long pdcapa, String email) {
		TissueDao dao = sqlsession.getMapper(TissueDao.class);
		int result = dao.myFileInsert(pfdname, pdcapa, email);
		
		return result;
	}
	
	//프로젝트 공지사항 작성
	public int pjNoticeWrite(PjNotice pjnotice) {
		ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
		int result = dao.pjNoticeWrite(pjnotice);
		
		return result;
	}
	
	//팀 멘션 생성
		public int mentionInsert(String email) {
			TissueDao dao = sqlsession.getMapper(TissueDao.class);
			int result = dao.mentionInsert(email);
			return result;
		}
}
