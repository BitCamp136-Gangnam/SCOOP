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
		int isIdCheck = idCheck(member.getEmail());
		if(isIdCheck>0) {
		} else {
			MemberDao dao = sqlsession.getMapper(MemberDao.class);
			result = dao.insertMember(member);
		}
		
		return result;
	}
	
	public int loginMember(String email, String pwd) {
		int result = 0;
		try {
			Member member = pwdCheck(email);
			String encodePwd = member.getPwd();
			boolean istrue = bCryptPasswordEncoder.matches(pwd, encodePwd);
			MemberDao dao = sqlsession.getMapper(MemberDao.class);
			if(istrue) {
				result = dao.loginCheck(email,encodePwd);
			} else {
				result = 0;
			}
		} catch (Exception e) {
			result = 0;
		}
		return result;
		
	}
	
	// 비밀번호 확인 
	public Member pwdCheck(String email) {
		Member member = null;
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		member = dao.pwdCheck(email);
		return member;
	}
	
	public int googleIdCheck(String email, String name) {
		int result = 0;
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		result = dao.googleIdCheck(email, name);
		if(result>0) {
		} else {
			int googleInsertCheck = 0;
			googleInsertCheck = dao.googleInsertCheck(email, name);
			if(googleInsertCheck>0) {
				result = googleInsertCheck;
			}else {
			}
		}
		return result;
		
	}
	
	public int issueCheck() {
		return 0;
		
	}

	public int naverIdCheck(String email, String name) {
		int result = 0;
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		result = dao.googleIdCheck(email, name);
		if(result>0) {
		} else {
			int naverInsertCheck = 0;
			naverInsertCheck = dao.naverInsertCheck(email, name);
			if(naverInsertCheck>0) {
				result = naverInsertCheck;
			}else {
			}
		}
		return result;
	}

	public int idCheck(String email) {
		int result = 0;
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		result = dao.idCheck(email);
		return result;
	}
	
	public int updateRole(String email) {
		int result = 0;
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		result = dao.updateRole(email);
		return result;
	}
	
	public int deleteMember(String email) {
		int result = 0;
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		result = dao.deleteMember(email);
		return result;
	}
	
}
