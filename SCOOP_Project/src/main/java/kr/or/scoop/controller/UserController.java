package kr.or.scoop.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

@Controller
@RequestMapping("/user/")
public class UserController {
	
	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private View jsonview;
	
	@RequestMapping(value="userindex.do", method= RequestMethod.GET)
	public String userindex() {
		String viewpage = "userindex";
		
		return viewpage;
	}
}
