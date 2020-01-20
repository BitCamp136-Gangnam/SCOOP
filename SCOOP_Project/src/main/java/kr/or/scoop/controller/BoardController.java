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
import kr.or.scoop.dao.NoticeDao;
import kr.or.scoop.dao.ProjectDao;
import kr.or.scoop.dao.TissueDao;
import kr.or.scoop.dto.MyIssue;
import kr.or.scoop.dto.Notice;
import kr.or.scoop.dto.Reply;
import kr.or.scoop.dto.TeamPjt;
import kr.or.scoop.dto.Tissue;
import kr.or.scoop.service.BoardService;
import kr.or.scoop.service.TeamService;

@Controller
public class BoardController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private BoardService service;
	
	@Autowired
	private TeamService tservice;
	
	// 마이이슈 작성
	@RequestMapping(value = "/myissue.do", method = RequestMethod.GET)
	public String myissue(HttpSession session, Model model) {
		String email = "";
		email = (String)session.getAttribute("email");
		MyIssueDao dao = sqlSession.getMapper(MyIssueDao.class);
		List<MyIssue> ti = dao.MyWriteTiisueList(email);
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
	public String teamissueDetail(int tiseq, Model model){
		TissueDao dao = sqlSession.getMapper(TissueDao.class);
		Tissue tissue = dao.teamissueDetail(tiseq);
		List<Reply> reply = dao.teamCommentList(tiseq);
		model.addAttribute("tissue", tissue);
		model.addAttribute("reply",reply);
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
	
	@RequestMapping(value="/pibookmark.do", method=RequestMethod.POST)
	public String piBookMark(HttpSession session, int piseq, String status, Model model) {
		String email = (String)session.getAttribute("email");
		String viewpage = "";
		MyIssueDao dao = sqlSession.getMapper(MyIssueDao.class);
		int result = 0;
		if(status.equals("bookoff")) {
			result = dao.addBookMark(piseq, email);
		}else if(status.equals("bookon")) {
			result = dao.delBookMark(piseq, email);
		}
		
		System.out.println("piseq : " + piseq);
		System.out.println("email : " + email);
		
		if(status.equals("bookoff") && result > 0) {
			status = "bookon";
			viewpage = "redirect:private.do";
		}else if(status.equals("bookon") && result > 0) {
			status = "bookoff";
			viewpage = "redirect:private.do";
		}
		
		model.addAttribute("status", status);
		
		System.out.println(model);
		
		return viewpage;
	}
	
	@RequestMapping(value="/tibookmark.do", method = RequestMethod.POST)
	public String tiBookMark (HttpSession session, int tseq, int tiseq, String status, Model model) {
		String email = (String)session.getAttribute("email");
		String viewpage = "";
		int result = 0;
		if(status.equals("bookoff")) {
			
		}
		
		
		
		result = tservice.banMember(tseq, email);
		
		System.out.println("bookmark : " + status);
		System.out.println("result : " + result);
		
		if(status.equals("bookoff") && result > 0) {
			status = "bookon";
			viewpage = "redirect:projectDetail.do?tseq="+tseq;
		}else if(status.equals("bookon") && result > 0) {
			status = "bookoff";
			viewpage = "redirect:projectDetail.do?tseq="+tseq;
		}
		
		model.addAttribute("status", status);
		
		return viewpage;
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
	
	//팀이슈 댓글 비동기
	@RequestMapping(value = "teamComment.do", method = {RequestMethod.POST,RequestMethod.GET})
	public int teamCommentAjax(int tiseq,String rcontent,String email,Model model) {
		int result = 0;	
		System.out.println(tiseq + rcontent + email);
		String viewpage = "";
		result = tservice.teamComment(tiseq, rcontent, email);
		if(result > 0) {
			model.addAttribute("ajax","댓글 성공!");
			viewpage = "ajax/ajax";
			
		}else {
			model.addAttribute("ajax","댓글 실패ㅠㅠ");
			viewpage = "ajax/ajax";
		}
		return result;
	}
	
	
}
