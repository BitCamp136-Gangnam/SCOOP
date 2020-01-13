package kr.or.scoop.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.scoop.dao.MyIssueDao;
import kr.or.scoop.dao.TissueDao;
import kr.or.scoop.dto.MyIssue;
import kr.or.scoop.dto.Tissue;

@Service
public class PrivateService {
	
	@Autowired
	private SqlSession sqlsession;
	
	public int writeMyissue(MyIssue myissue) {
		int result = 0 ;
		System.out.println("writeMyissue");
		MyIssueDao dao = sqlsession.getMapper(MyIssueDao.class);
		result = dao.writeMyissue(myissue);
		return result;
	}
}
