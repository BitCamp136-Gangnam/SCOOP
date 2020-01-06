package kr.or.scoop.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.scoop.dao.MemberDao;
import kr.or.scoop.dto.Member;

@Service
public class MemberService {
	
	@Autowired
	private SqlSession sqlsession;

	public int insertMember(Member member){
		int result = 0;
		System.out.println(member.toString());
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		System.out.println("여기좀 와주라 ㅠㅠㅠㅠ");
		
		result = dao.insertMember(member);
		return result;
	}
	
	public int loginMember(Member member) {
		int result = 0;
		
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		
		result = dao.loginCheck(member);
		
		return result;
		
	}
	
}
