package kr.or.scoop.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.scoop.dao.TissueDao;
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
}
