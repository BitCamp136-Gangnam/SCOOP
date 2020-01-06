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
	
	public int loginMember(String email, String pwd) {
		int result = 0;
		System.out.println("여기어디");
		System.out.println(email+"/"+pwd);
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		result = dao.loginCheck(email,pwd);
		
		return result;
		
	}
	
	public Member pwdCheck(String email) {
		String result = "";
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		result = dao.
		return result;
	}
	
}
