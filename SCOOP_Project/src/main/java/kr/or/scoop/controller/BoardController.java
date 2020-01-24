package kr.or.scoop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.scoop.dao.MemberDao;
import kr.or.scoop.dao.MyIssueDao;
import kr.or.scoop.dao.NoticeDao;
import kr.or.scoop.dao.ProjectDao;
import kr.or.scoop.dao.TissueDao;
import kr.or.scoop.dto.Mention;
import kr.or.scoop.dto.MyIssue;
import kr.or.scoop.dto.Notice;
import kr.or.scoop.dto.PjNotice;
import kr.or.scoop.dto.ProjectMemberlist;
import kr.or.scoop.dto.Reply;
import kr.or.scoop.dto.TeamPjt;
import kr.or.scoop.dto.Tissue;
import kr.or.scoop.service.BoardService;
import kr.or.scoop.service.TeamService;
import net.sf.json.JSONArray;

@Controller
public class BoardController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private BoardService service;
	
	@Autowired
	private TeamService tservice;
	
	// 내가 작성한 이슈
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
	// 내가 작성한 이슈
	@RequestMapping(value = "/myissueReply.do", method = RequestMethod.GET)
	public String myissueReply(HttpSession session, Model model) {
		String email = "";
		email = (String)session.getAttribute("email");
		MyIssueDao dao = sqlSession.getMapper(MyIssueDao.class);
		List<Reply> reply = dao.MyWriteReplyList(email);
		model.addAttribute("re",reply);
		return "issue/myissueReply";
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
		List<Reply> reply = dao.teamCommentOk(tiseq);
		List<Mention> mentions = dao.getMentions(tiseq);
		model.addAttribute("tissue", tissue);
		model.addAttribute("reply",reply);
		model.addAttribute("mentions",mentions);
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
	
	// 개인 이슈 북마크
	@RequestMapping(value="/pibookmark.do", method=RequestMethod.POST)
	public String piBookMark(HttpSession session, int piseq, String status, Model model) {
		String email = (String)session.getAttribute("email");
		String viewpage = "";
		MyIssueDao dao = sqlSession.getMapper(MyIssueDao.class);
		int result = 0;
		
		System.out.println(email);
		System.out.println("pibookmark");
		
		// 북마크 추가/제거
		if(status.equals("bookoff")) {
			result = dao.addPBookMark(piseq, email);
		}else if(status.equals("bookon")) {
			result = dao.delPBookMark(piseq, email);
		}
		
		System.out.println("piseq : " + piseq);
		System.out.println("email : " + email);
		
		// 북마크 성공시 북마크 상태 변경
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
	// 팀이슈 북마크
	@RequestMapping(value="/tibookmark.do", method = RequestMethod.POST)
	public String tiBookMark (HttpSession session, int tseq, int tiseq, String status, Model model) {
		String email = (String)session.getAttribute("email");
		String viewpage = "";
		int result = 0;
		TissueDao dao = sqlSession.getMapper(TissueDao.class);
		
		// 북마크 추가/제거
		if(status.equals("bookoff")) {
			result = dao.addTBookMark(tiseq, email);
		}else if(status.equals("bookon")) {
			result = dao.delTBookMark(tiseq, email);
		}
		
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
		System.out.println(model);
		
		return viewpage;
	}
	
	@RequestMapping("delbook.do")
	public String delBookMark(HttpSession session, int piseq, int tiseq) {
		String email = (String)session.getAttribute("email");
		String viewpage = "";
		int result = 0;
		
		MyIssueDao pidao = sqlSession.getMapper(MyIssueDao.class);
		TissueDao tidao = sqlSession.getMapper(TissueDao.class);
		
		if(tiseq > 0) {
			result = tidao.delTBookMark(tiseq, email);
		}else if(piseq > 0) {
			result = pidao.delPBookMark(piseq, email);
		}
		viewpage = "redirect:bookmark.do";
		
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
	@RequestMapping(value="searchIssue.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String searchIssue(String email,String word,Model model) {
		int result = 0;
		System.out.println(email + word);
		String viewpage = "";
		NoticeDao dao = sqlSession.getMapper(NoticeDao.class);
		List<MyIssue> teamIssue = dao.searchTeamIssue(email, word);
		System.out.println(teamIssue);
		List<MyIssue> myIssue = dao.searchMyIssue(email, word);
		model.addAttribute("teamIssue", teamIssue);
		model.addAttribute("myIssue", myIssue);
		if(result > 0) {
			viewpage = "issue/searchIssue";
			
		}else {
			viewpage = "issue/searchIssue";
		}
		
		
		return viewpage;
	}
	
	//팀이슈 댓글 비동기
	@RequestMapping(value = "teamComment.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String teamCommentAjax(int tiseq,String rcontent,String email,Model model) {
		int result = 0;	
		System.out.println(tiseq + rcontent + email);
		String viewpage = "";
		result = tservice.teamComment(tiseq, rcontent, email);
		
		if(result > 0) {
			model.addAttribute("ajax","댓글 성공");
			viewpage = "ajax/ajax";
			
		}else {
			model.addAttribute("ajax","댓글 실패ㅠㅠ");
			viewpage = "ajax/ajax";
		}
		return viewpage;
	}
	//팀이슈 댓글 비동기 뿌리기
	@RequestMapping(value = "teamCommentOk.do",method = {RequestMethod.POST,RequestMethod.GET})
	public String teamCommentOk(int tiseq,Model model) {
		String viewpage = "ajax/ajax";
		List<Reply> reply = tservice.teamCommentOk(tiseq);
		JSONArray jsonlist = JSONArray.fromObject(reply);
		model.addAttribute("ajax",jsonlist);
		return viewpage;
	}
	
	@RequestMapping(value="noticeDelete.do",method = RequestMethod.POST)
	public String deleteNotice(int bnseq) {
		int result = 0;
		String viewpage;
		
		result = service.deleteNotice(bnseq);
		if(result > 0) {
			viewpage = "ajax/adminService";
		}else {
			viewpage = "redirect:/index.do";
		}
				
		return viewpage;
	}
	
	@RequestMapping(value="projectNotice.do", method = RequestMethod.GET)
	public String pjNotice(int tseq,Model model,HttpSession session) {
		String email = (String)session.getAttribute("email");
		ProjectDao dao = sqlSession.getMapper(ProjectDao.class);
		MemberDao md = sqlSession.getMapper(MemberDao.class);
		List<PjNotice> pj = dao.getPjNotice(tseq);
		System.out.println("플젝" + pj);
		TeamPjt pjt = dao.detailPJT(tseq);
		int rank = dao.searchRank(tseq, email);
		List<ProjectMemberlist> projectMemberlist =md.projectMemberlist(tseq);
		model.addAttribute("tpj", pjt);
		model.addAttribute("pjn", pj);	
		model.addAttribute("rank", rank);
		model.addAttribute("projectmember", projectMemberlist);
		
		
		return "user/ProjectNotice";
	}
	
	@RequestMapping(value = "PnoticeWrite.do" , method = RequestMethod.POST)
	public String pjNoticeWrite(PjNotice pjnotice) {
		int result = 0;
		String viewpage;
		
		result = tservice.pjNoticeWrite(pjnotice);
		
		if(result > 0) {
			viewpage = "redirect:/projectNotice.do?tseq="+pjnotice.getTseq();
		}else {
			viewpage = "user/userindex";
		}
		
		
		return viewpage;
	}
	
	@RequestMapping(value="pjNoticeDetail.do",method=RequestMethod.GET)
	public String pjNoticeDetail(int pnseq,Model model,HttpSession session) {
		ProjectDao dao = sqlSession.getMapper(ProjectDao.class);
		PjNotice Detail = dao.pjNoticeDetail(pnseq);
		model.addAttribute("detail", Detail);
		return "user/projectDetailNotice";
	}
	
	@RequestMapping(value="pjNoticeEdit.do",method=RequestMethod.GET)
	public String pjNoticeEdit(int pnseq,Model model) {
		ProjectDao dao = sqlSession.getMapper(ProjectDao.class);
		PjNotice edit = dao.pjNoticeDetail(pnseq);
		
		model.addAttribute("edit",edit);
		
		return "user/projectEditNotice";
	}
	
	@RequestMapping(value="pjNoticeEditOk.do", method = RequestMethod.POST)
	public String pjNoticeEditOk(PjNotice pjnotice) {
		
		return null;
	}
	
	@RequestMapping(value="dashboard.do")
	public String dashBoard() {
		return "user/dashBoard";
	}
}
