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
	//팀 파일 업로드
	public int fileEdit(int tseq, String fdname, long fdcapa, String email, int tiseq) {
		TissueDao dao = sqlsession.getMapper(TissueDao.class);
		System.out.println("파일 에딧");
		int result = dao.fileEdit(tseq, fdname, fdcapa, email, tiseq);
		return result;
	}
	public int fileDelete(int fdseq) {
		TissueDao dao = sqlsession.getMapper(TissueDao.class);
		int result = dao.fileDelete(fdseq);
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
	//팀 멘션 생성
	public int mentionEdit(String email, int tiseq) {
		System.out.println("멘션 에딧");
		System.out.println("멘션후에딧"+tiseq);
		TissueDao dao = sqlsession.getMapper(TissueDao.class);
		int result = dao.mentionEdit(email, tiseq);
		return result;
	}
	//팀 멘션 삭제
	public int mentionDelete(int tmseq) {
		TissueDao dao = sqlsession.getMapper(TissueDao.class);
		int result = dao.mentionDelete(tmseq);
		return result;
	}
	
	//나의 멘션 생성
	public int myMentionInsert(String email) {
		TissueDao dao = sqlsession.getMapper(TissueDao.class);
		int result = dao.myMentionInsert(email);
		return result;
	}
	//팀 구글드라이브 생성
	public int googleDriveInsert(String gfilename, String gurl) {
		TissueDao dao = sqlsession.getMapper(TissueDao.class);
		int result = dao.googleDriveInsert(gfilename, gurl);
		return result;
	}
	//팀 구글드라이브 생성
	public int googleDriveEdit(String gfilename, String gurl, int tiseq) {
		System.out.println("구글 에딧");
		TissueDao dao = sqlsession.getMapper(TissueDao.class);
		int result = dao.googleDriveEdit(gfilename, gurl, tiseq);
		return result;
	}
	//팀 구글드라이브 삭제
	public int googleDriveDelete(int tgseq) {
		TissueDao dao = sqlsession.getMapper(TissueDao.class);
		int result = dao.googleDriveDelete(tgseq);
		return result;
	}
	//개인 구글드라이브 생성
	public int myGoogleDriveInsert(String pgfilename,String pgurl) {
		TissueDao dao = sqlsession.getMapper(TissueDao.class);
		int result = dao.myGoogleDriveInsert(pgfilename, pgurl);
		return result;
	}
	//팀 할일 생성
	public int doWorkInsert(String fromWork, String toWork, String doWork) {
		TissueDao dao = sqlsession.getMapper(TissueDao.class);
		System.out.println(fromWork+ toWork+ doWork);
		int result = dao.doWorkInsert(fromWork, toWork, doWork);
		return result;
	}
	public int doWorkEdit(String fromWork, String toWork, String doWork, int tiseq) {
		System.out.println("두워크 에딧");
		TissueDao dao = sqlsession.getMapper(TissueDao.class);
		System.out.println(fromWork+ toWork+ doWork);
		int result = dao.doWorkEdit(fromWork, toWork, doWork, tiseq);
		return result;
	}
	//팀 할일 제거
	public int doWorkDelete(int tdseq) {
		TissueDao dao = sqlsession.getMapper(TissueDao.class);
		int result = dao.doWorkDelete(tdseq);
		return result;
	}
	//개인 할일 생성
	public int myDoWorkInsert(String fromWork, String toWork, String doWork) {
		TissueDao dao = sqlsession.getMapper(TissueDao.class);
		System.out.println(fromWork+ toWork+ doWork);
		int result = dao.myDoWorkInsert(fromWork, toWork, doWork);
		return result;
	}

	//프로젝트 공지사항 수정
	public int pjNoticeEdit(PjNotice pjnotice) {
		ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
		int result = dao.updatePjNotice(pjnotice);
		return result;
	}
	
	public int teamIssueFileDelete(int tiseq) {
		TissueDao dao = sqlsession.getMapper(TissueDao.class);
		int result = dao.teamIssueFileDelete(tiseq);
		return result;
	}
	public int teamIssueMentionDelete(int tiseq) {
		TissueDao dao = sqlsession.getMapper(TissueDao.class);
		int result = dao.teamIssueMentionDelete(tiseq);
		return result;
	}
	public int teamIssueGoogleDriveDelete(int tiseq) {
		TissueDao dao = sqlsession.getMapper(TissueDao.class);
		int result = dao.teamIssueGoogleDriveDelete(tiseq);
		return result;
	}
	public int teamIssueDoWorkDelete(int tiseq) {
		TissueDao dao = sqlsession.getMapper(TissueDao.class);
		int result = dao.teamIssueDoWorkDelete(tiseq);
		return result;
	}
	public int teamIssueDelete(int tiseq) {
		TissueDao dao = sqlsession.getMapper(TissueDao.class);
		int result = dao.teamIssueDelete(tiseq);
		return result;
	}
}
