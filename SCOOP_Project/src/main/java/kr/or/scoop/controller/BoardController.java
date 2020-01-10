package kr.or.scoop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.scoop.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="writeIssue.do", method = RequestMethod.POST)
	public String writeIssuePost(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String select = request.getParameter("selectTeam");
		String content = request.getParameter("test");
		String email = (String)session.getAttribute("email");
		String issue = request.getParameter("issuecontent");
		String googleurl = request.getParameter("gurl");
		
		
		System.out.println("구글 드라이브 : " + googleurl);
		System.out.println("선택한 팀(post) : " + select);
		System.out.println("세션 id : " + email);
		System.out.println("컨텐츠 : " + content);
		System.out.println("이슈 : " + issue);
		return "sidebar/app-myissue";
	}
}
