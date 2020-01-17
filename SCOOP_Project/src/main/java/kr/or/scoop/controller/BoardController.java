package kr.or.scoop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.scoop.dao.MyIssueDao;
import kr.or.scoop.dao.NoticeDao;
import kr.or.scoop.dao.TissueDao;
import kr.or.scoop.dto.MyIssue;
import kr.or.scoop.dto.Notice;
import kr.or.scoop.dto.Tissue;
import kr.or.scoop.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private BoardService service;
	
	// 마이이슈 작성
	@RequestMapping(value = "/myissue.do", method = RequestMethod.GET)
	public String myissue(HttpSession session, Model model) {
		String email = "";
		email = (String)session.getAttribute("email");
		MyIssueDao dao = sqlSession.getMapper(MyIssueDao.class);
		List<Tissue> ti = dao.MyWriteTiisueList(email);
		List<MyIssue> pi = dao.MyWriteIssueList(email);
		model.addAttribute("pi",pi);
		model.addAttribute("ti",ti);
		return "issue/myissue";
	}
	
	// 마이이슈디테일 
	@RequestMapping(value = "/myissueDetail.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String myissueDetail(int piseq, Model model) {
		
		MyIssueDao dao = sqlSession.getMapper(MyIssueDao.class);
		MyIssue myissue = dao.myissueDetail(piseq);
		model.addAttribute("myissue", myissue);
		return "issue/myissueDetail";
	}
	
	// 팀이슈디테일 
	@RequestMapping(value="/teamissueDetail.do",method = {RequestMethod.POST,RequestMethod.GET})
	public String teamissueDetail(int tiseq, Model model) {
		TissueDao dao = sqlSession.getMapper(TissueDao.class);
		Tissue tissue = dao.teamissueDetail(tiseq);
		model.addAttribute("tissue", tissue);
		return "issue/teamissueDetail";
	}

	// 캘린더
	@RequestMapping(value = "/calendar.do", method = RequestMethod.GET)
	public String calendar() {
		return "sidebar/app-calender";
	}

	@RequestMapping(value="notice.do" , method = RequestMethod.GET)
	public String noticeJoin(Notice notice, Model model) {
		NoticeDao dao = sqlSession.getMapper(NoticeDao.class);
		List<Notice> n = dao.getNotice();
		model.addAttribute("notice",n);
		return "issue/notice";
	}
	
	@RequestMapping(value="noticeWrite.do" , method=RequestMethod.POST)
	public String noticeWrite(Notice notice) {
		int result = 0;
		String viewpage;
		System.out.println(notice);
		result = service.insertNotice(notice);
		
		if(result > 0) {
			viewpage = "redirect:/notice.do";
		}else {
			viewpage = "user/userindex";
		}
		
		return viewpage;
	
	}
	
	@RequestMapping(value="noticeDetail.do" , method=RequestMethod.GET)	
	public String noticeDetail(int bnseq,Model model) {
		NoticeDao dao = sqlSession.getMapper(NoticeDao.class);
		System.out.println(bnseq);
		Notice notice = dao.detailNotice(bnseq);
		model.addAttribute("n",notice);
		
		return "issue/noticeDetail";
	}
	
	@ResponseBody 
	@RequestMapping("/bookmark.do")
	public Map<String, Object> bookMark(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		System.out.println(request.getParameter("piseq"));
		/*
		String piseq = request.getParameter("piseq"); String status =
		request.getParameter("status");


		System.out.println("piseq: "+piseq);
		System.out.println("status: "+status);

		*/
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		MyIssueDao dao = sqlSession.getMapper(MyIssueDao.class);

		
		
		return null;
	}
	
	@RequestMapping(value="noticeEdit.do" , method=RequestMethod.POST)
	public String noticeUpdateCheck(int bnseq,Notice notice,Model model) {
		int result = 0;
		String viewpage = "";
		result = service.updateNotice(notice);
		if(result > 0) {
			model.addAttribute("notice",notice);
			viewpage = "redirect:/notice.do";
			
		}else {
			viewpage = "issue/notice";
		}
			
	
		return viewpage;
	}
}
