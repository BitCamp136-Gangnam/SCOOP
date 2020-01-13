package kr.or.scoop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.scoop.dao.NoticeDao;
import kr.or.scoop.dto.Notice;
import kr.or.scoop.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private BoardService boardService;
	
	// 마이이슈 작성
	@RequestMapping(value = "/myissue.do", method = RequestMethod.GET)
	public String myissue() {
		return "sidebar/app-myissue";
	}

	// 캘린더
	@RequestMapping(value = "/calendar.do", method = RequestMethod.GET)
	public String calendar() {
		return "sidebar/app-calender";
	}

	// 이슈 작성
	@RequestMapping(value="writeIssue.do", method=RequestMethod.POST)
	public String writeIssue(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		String email = (String)session.getAttribute("email");
		String title = request.getParameter("issuetitle");
		String content = request.getParameter("issuecontent");
		String mention = request.getParameter("mention");
		
		System.out.println("id : " + email);
		System.out.println("title : " + title);
		System.out.println("content : " + content);
		System.out.println("mention : " + mention);
		
		
		return "private/private-place";
	}
	
	@RequestMapping(value="notice.do" , method = RequestMethod.GET)
	public String noticeJoin(Notice notice, Model model) {
		NoticeDao dao = sqlSession.getMapper(NoticeDao.class);
		List<Notice> n = dao.getNotice();
		model.addAttribute("notice",n);
		return "issue/notice";
	}
}
