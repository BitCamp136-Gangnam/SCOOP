package kr.or.scoop.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.or.scoop.dao.MemberDao;
import kr.or.scoop.dto.Member;

@Service
public class MemberService {
	
	@Autowired
	private SqlSession sqlsession;
	
	@Autowired 
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	public PasswordEncoder passwordEncoder;
	
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
		Member member = pwdCheck(email);
		String encodePwd = member.getPwd();
		boolean istrue = bCryptPasswordEncoder.matches(pwd, encodePwd);
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		if(istrue) {
			System.out.println("true");
			result = dao.loginCheck(email,encodePwd);
		} else {
			System.out.println("false");
			result = 0;
		}
		return result;
		
	}
	
	public Member pwdCheck(String email) {
		Member member = null;
		System.out.println("pwd check");
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		member = dao.pwdCheck(email);
		return member;
	}
	
}
