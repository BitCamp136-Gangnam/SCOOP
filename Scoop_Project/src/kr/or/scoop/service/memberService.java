package kr.or.scoop.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import kr.or.scoop.dao.MemberDao;
import kr.or.scoop.vo.Member;

@Service
public class memberService {
	

	private SqlSession sqlsession;

	public int insertMember(Member member){
		int result = 0;
		System.out.println(member.toString());
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		
		
		result = dao.insertMember(member);
		return result;
	}
	
}
