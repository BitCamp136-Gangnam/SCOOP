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
	public int writeTissue(MyIssue tissue) {
		int result = 0 ;
		System.out.println("writetissue");
		MyIssueDao dao = sqlsession.getMapper(MyIssueDao.class);
		result = dao.writeTissue(tissue);
		System.out.println("writetissue2");
		return result;
	}
	public int writeMyissue(MyIssue myissue) {
		int result = 0 ;
		System.out.println("writeMyissue");
		System.out.println(myissue);
		MyIssueDao dao = sqlsession.getMapper(MyIssueDao.class);
		result = dao.writeMyissue(myissue);
		return result;
	}
	public int editTissue(MyIssue tissue) {
		int result = 0 ;
		System.out.println("edittissue");
		System.out.println(tissue);
		MyIssueDao dao = sqlsession.getMapper(MyIssueDao.class);
		result = dao.editTissue(tissue);
		System.out.println("edittissue2");
		return result;
	}
	public int editMyissue(MyIssue myissue) {
		int result = 0 ;
		System.out.println("editmyissue");
		System.out.println(myissue);
		MyIssueDao dao = sqlsession.getMapper(MyIssueDao.class);
		result = dao.editMyissue(myissue);
		System.out.println("editmyissue2");
		return result;
	}
	//마이파일 수정
	public int pfileEdit(String pfdname, long pdcapa, String email, int piseq) {
		MyIssueDao dao = sqlsession.getMapper(MyIssueDao.class);
		System.out.println("파일 에딧");
		int result = dao.pfileEdit(pfdname, pdcapa, email, piseq);
		return result;
	}
	//마이파일 삭제
	public int pfileDelete(int pdseq) {
		MyIssueDao dao = sqlsession.getMapper(MyIssueDao.class);
		int result = dao.pfileDelete(pdseq);
		return result;
	}
	//마이 멘션 삭제
	public int pmentionDelete(int pmseq) {
		MyIssueDao dao = sqlsession.getMapper(MyIssueDao.class);
		int result = dao.pmentionDelete(pmseq);
		return result;
	}
	//마이 멘션 수정
	public int pmentionEdit(String email, int piseq) {
		System.out.println("멘션 에딧");
		System.out.println("멘션후에딧"+piseq);
		MyIssueDao dao = sqlsession.getMapper(MyIssueDao.class);
		int result = dao.pmentionEdit(email, piseq);
		return result;
	}
	//마이 구글드라이브 삭제
	public int pgoogleDriveDelete(int pgseq) {
		MyIssueDao dao = sqlsession.getMapper(MyIssueDao.class);
		int result = dao.pgoogleDriveDelete(pgseq);
		return result;
	}
	//마이 구글드라이브 수정
	public int pgoogleDriveEdit(String pgfilename, String pgurl, int piseq) {
		System.out.println("구글 에딧");
		MyIssueDao dao = sqlsession.getMapper(MyIssueDao.class);
		int result = dao.pgoogleDriveEdit(pgfilename, pgurl, piseq);
		return result;
	}
	//팀 할일 제거
	public int pdoWorkDelete(int pwseq) {
		MyIssueDao dao = sqlsession.getMapper(MyIssueDao.class);
		int result = dao.pdoWorkDelete(pwseq);
		return result;
	}
	//팀 할일 수정
	public int pdoWorkEdit(String fromWork, String toWork, String pdoWork, int piseq) {
		System.out.println("두워크 에딧");
		MyIssueDao dao = sqlsession.getMapper(MyIssueDao.class);
		System.out.println(fromWork+ toWork+ pdoWork);
		int result = dao.pdoWorkEdit(fromWork, toWork, pdoWork, piseq);
		return result;
	}
	public int myIssueFileDelete(int piseq) {
		MyIssueDao dao = sqlsession.getMapper(MyIssueDao.class);
		int result = dao.myIssueFileDelete(piseq);
		return result;
	}
	public int myIssueMentionDelete(int piseq) {
		MyIssueDao dao = sqlsession.getMapper(MyIssueDao.class);
		int result = dao.myIssueMentionDelete(piseq);
		return result;
	}
	public int myIssueGoogleDriveDelete(int piseq) {
		MyIssueDao dao = sqlsession.getMapper(MyIssueDao.class);
		int result = dao.myIssueGoogleDriveDelete(piseq);
		return result;
	}
	public int myIssueDoWorkDelete(int piseq) {
		MyIssueDao dao = sqlsession.getMapper(MyIssueDao.class);
		int result = dao.myIssueDoWorkDelete(piseq);
		return result;
	}
	public int myIssueDelete(int piseq) {
		MyIssueDao dao = sqlsession.getMapper(MyIssueDao.class);
		int result = dao.myIssueDelete(piseq);
		return result;
	}
}
