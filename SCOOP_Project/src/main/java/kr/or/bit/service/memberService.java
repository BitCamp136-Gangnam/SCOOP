package kr.or.bit.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.bit.dao.MemberDao;
import kr.or.bit.dto.Member;

@Service
public class memberService {
	
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
	
}
