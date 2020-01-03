package kr.or.scoop.controller;

import java.sql.SQLException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.scoop.dao.MemberDao;
import kr.or.scoop.vo.Member;

@Controller
public class memberController {
	

	private SqlSessionTemplate sqlsession;
	
	@Autowired
	public void setSqlsession(SqlSessionTemplate sqlsession) {
		this.sqlsession = sqlsession;
	}

	private BCryptPasswordEncoder bCryptPasswordEncoder;
		
	@RequestMapping(value="frontpage.htm",method=RequestMethod.POST)
	public String register(Member member) throws ClassNotFoundException, SQLException {
		
		int result = 0;
		String viewpage = "";
	
		member.setPwd(this.bCryptPasswordEncoder.encode(member.getPwd()));
		MemberDao memberdao = sqlsession.getMapper(MemberDao.class);
		result = memberdao.insertMember(member);
		if (result > 0) {
			System.out.println("삽입 성공");
			viewpage = "redirect:/index.htm";
		} else {
			System.out.println("삽입 실패");
			viewpage = "frontpage.htm";
		}
		return viewpage;
	}
	

}
