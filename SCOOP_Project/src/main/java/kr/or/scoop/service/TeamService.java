package kr.or.scoop.service;

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
}
