package kr.or.scoop.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.scoop.dao.ProjectDao;
import kr.or.scoop.dao.TissueDao;
import kr.or.scoop.dto.Reply;
import kr.or.scoop.dto.TeamPjt;
import kr.or.scoop.dto.Tissue;

@Service
public class TeamService {
	
	@Autowired
	private SqlSession sqlsession;
	
	public int writeTissue(Tissue tissue) {
		int result = 0 ;
		System.out.println("writetissue");
		TissueDao dao = sqlsession.getMapper(TissueDao.class);
		result = dao.writeTissue(tissue);
		return result;
	}
	
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
	public int teamUpdate(TeamPjt teampjt) {
		int result = 0;
		ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
		result = dao.updatePjt(teampjt);
		return result;
	}
	
	// 안씀
	public int bookMark(int tiseq, int istbook, String email) {
		TissueDao dao = sqlsession.getMapper(TissueDao.class);
		
		int result = dao.addBookMark(tiseq, email);
		System.out.println("service result : " + result);
		return result;
	}
	public int teamComment(int tiseq,String rcontent,String email) {
		TissueDao dao = sqlsession.getMapper(TissueDao.class);
		System.out.println("가나다라"+tiseq+rcontent+email);
		int result = dao.teamComment(tiseq,rcontent,email);
		System.out.println("마바사아"+tiseq+rcontent+email);

		return result;
	}
	public List<Reply> teamCommentOk(int tiseq){
		TissueDao dao = sqlsession.getMapper(TissueDao.class);
		
		List<Reply> result = dao.teamCommentOk(tiseq);
		return result;
	}
	
	public int fileInsert(int tseq, String fdname, long fdcapa, String email) {
		TissueDao dao = sqlsession.getMapper(TissueDao.class);
		int result = dao.fileInsert(tseq, fdname, fdcapa, email);
		
		return result;
	}
	public int myFileInsert(String pfdname, long pdcapa, String email) {
		TissueDao dao = sqlsession.getMapper(TissueDao.class);
		int result = dao.myFileInsert(pfdname, pdcapa, email);
		
		return result;
	}
	
}
