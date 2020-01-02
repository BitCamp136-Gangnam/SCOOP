package kr.or.scoop.service;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.scoop.dao.MemberDao;
import kr.or.scoop.vo.Member;

@Service
public class MemberService {
	
	@Autowired
	private SqlSession sqlsession;
	
	public int insertMember(String email, String pwd, String name){
		int result = 0;
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		result = dao.insertMember(email,pwd,name);
		return result;
	}
}
