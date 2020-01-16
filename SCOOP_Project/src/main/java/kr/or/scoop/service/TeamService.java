package kr.or.scoop.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.scoop.dao.TissueDao;
import kr.or.scoop.dto.Tifile;
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
	

	public int fileUpload(String originalfileName, long fileSize,Tifile tf) {
		int upload = 0;
		System.out.println("파일 서비스 왐마");
		TissueDao dao = sqlsession.getMapper(TissueDao.class);
		upload = dao.uploadFiles(tf);
		return upload;
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
}
