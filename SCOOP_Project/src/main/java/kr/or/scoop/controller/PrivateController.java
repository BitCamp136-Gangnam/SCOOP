package kr.or.scoop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.scoop.dao.MyIssueDao;
import kr.or.scoop.dto.MyIssue;
import kr.or.scoop.service.MemberService;



@Controller
public class PrivateController {
	@Autowired
	private MemberService service;

	
	@Autowired
	private SqlSession sqlsession;
	//프라이빗 공간 이동
	@RequestMapping(value="private.do" , method = RequestMethod.GET)
	public String privateIn(HttpSession session, Model model) {
		String email = "";
		email = (String)session.getAttribute("email");
		System.out.println("private Controller email : " + email);
		MyIssueDao myissuedao = sqlsession.getMapper(MyIssueDao.class);
		List<MyIssue> myissuelist = myissuedao.getMyissue(email);
		model.addAttribute("myissuelist", myissuelist);
		System.out.println(myissuelist);
		String viewpage = "private/private-place";
		return viewpage;
		
	}
	
	//북마크 공간 이동
		@RequestMapping(value = "/privatebookmark.do",method = RequestMethod.GET)
		public String bookmark() {
			return "private/private-bookmark";
		}
		
		
	
	
	 @RequestMapping(value = "/bookmark.do",method = RequestMethod.POST) public
	 String bookMarkList() { 
		 
		 
		 return "private/private-bookmark";
	 }
}
