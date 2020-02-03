package kr.or.scoop.controller;

import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.or.scoop.dao.MemberDao;
import kr.or.scoop.dao.MyIssueDao;
import kr.or.scoop.dao.NoticeDao;
import kr.or.scoop.dao.ProjectDao;
import kr.or.scoop.dao.TissueDao;
import kr.or.scoop.dto.DoWork;
import kr.or.scoop.dto.FileDrive;
import kr.or.scoop.dto.GoogleDrive;
import kr.or.scoop.dto.Mention;
import kr.or.scoop.dto.MyIssue;
import kr.or.scoop.dto.Notice;
import kr.or.scoop.dto.PjNotice;
import kr.or.scoop.dto.ProjectMemberlist;
import kr.or.scoop.dto.Reply;
import kr.or.scoop.dto.TeamPjt;
import kr.or.scoop.dto.Tissue;
import kr.or.scoop.service.BoardService;
import kr.or.scoop.service.PrivateService;
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
	@Autowired
	private PrivateService privateservice;
	
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
		List<Mention> mentions = dao.getMyMentions(piseq);
		List<GoogleDrive> googledrive = dao.getMyGoogleDrive(piseq);
		List<DoWork> dowork = dao.getMyDoWork(piseq);
		List<FileDrive> files = dao.getMyFiles(piseq);
		model.addAttribute("myissue", myissue);
		model.addAttribute("mymention", mentions);
		model.addAttribute("mygdrive", googledrive);
		model.addAttribute("mydowork", dowork);
		model.addAttribute("files", files);
		return "issue/myissueDetail";
	}
	
	// 팀이슈디테일 
	@RequestMapping(value="/teamissueDetail.do",method = {RequestMethod.POST,RequestMethod.GET})
	public String teamissueDetail(int tiseq, Model model){
		TissueDao dao = sqlSession.getMapper(TissueDao.class);
		Tissue tissue = dao.teamissueDetail(tiseq);
		List<Reply> reply = dao.teamCommentOk(tiseq);
		List<Mention> mentions = dao.getMentions(tiseq);
		List<GoogleDrive> googledrive = dao.getGoogleDrive(tiseq);
		List<DoWork> dowork = dao.getDoWork(tiseq);
		List<FileDrive> files = dao.getFiles(tiseq);
		model.addAttribute("tissue", tissue);
		model.addAttribute("reply",reply);
		model.addAttribute("mentions",mentions);
		model.addAttribute("gdrive", googledrive);
		model.addAttribute("dowork", dowork);
		model.addAttribute("files", files);
		return "issue/teamissueDetail";
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
		Notice notice = dao.detailNotice(bnseq);
		model.addAttribute("notice",notice);
		
		return "issue/noticeDetail";
	}
	
	// 개인 이슈 북마크
	@RequestMapping(value="/pibookmark.do", method=RequestMethod.POST)
	public String piBookMark(HttpSession session, int piseq, String status, Model model) {
		String email = (String)session.getAttribute("email");
		String viewpage = "";
		MyIssueDao dao = sqlSession.getMapper(MyIssueDao.class);
		int result = 0;
		
		
		// 북마크 추가/제거
		if(status.equals("bookoff")) {
			result = dao.addPBookMark(piseq, email);
		}else if(status.equals("bookon")) {
			result = dao.delPBookMark(piseq, email);
		}
		
		
		// 북마크 성공시 북마크 상태 변경
		if(status.equals("bookoff") && result > 0) {
			status = "bookon";
			viewpage = "redirect:private.do";
		}else if(status.equals("bookon") && result > 0) {
			status = "bookoff";
			viewpage = "redirect:private.do";
		}
		
		model.addAttribute("status", status);
		
		
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
	
	@RequestMapping(value="noticeEdit.do" , method=RequestMethod.GET)
	public String noticeUpdate(int bnseq,Notice notice,Model model) {
		String viewpage = "";
		NoticeDao dao = sqlSession.getMapper(NoticeDao.class);
		Notice n = dao.detailNotice(bnseq);
				
		model.addAttribute("n",n);
				
	viewpage = "issue/noticeEdit";
		
			
		return viewpage;
	}
	
	@RequestMapping(value="noticeEditOk.do" , method=RequestMethod.POST)
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
		String viewpage = "";
		NoticeDao dao = sqlSession.getMapper(NoticeDao.class);
		List<MyIssue> teamIssue = dao.searchTeamIssue(email, word);
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
		String viewpage = "";
		result = tservice.teamComment(tiseq, rcontent, email);
		
		if(result > 0) {
			model.addAttribute("ajax","댓글 성공");
			viewpage = "utils/ajax";
			
		}else {
			model.addAttribute("ajax","댓글 실패ㅠㅠ");
			viewpage = "utils/ajax";
		}
		return viewpage;
	}
	//팀이슈 댓글 비동기 뿌리기
	@RequestMapping(value = "teamCommentOk.do",method = {RequestMethod.POST,RequestMethod.GET})
	public String teamCommentOk(int tiseq,Model model) {
		String viewpage = "utils/ajax";
		List<Reply> reply = tservice.teamCommentOk(tiseq);
		JSONArray jsonlist = JSONArray.fromObject(reply);
		model.addAttribute("ajax",jsonlist);
		return viewpage;
	}
	
	//팀이슈 댓글 삭제
	@RequestMapping(value = "delComment.do",method = {RequestMethod.POST,RequestMethod.GET})
	public String delComment(int replyseq,Model model) {
		int result = 0;	
		String viewpage = "";
		result = tservice.delComment(replyseq);
		
		if(result > 0) {
			model.addAttribute("ajax","댓글 성공");
			viewpage = "utils/ajax";
			
		}else {
			model.addAttribute("ajax","댓글 실패ㅠㅠ");
			viewpage = "utils/ajax";
		}
		return viewpage;
	}
	
	//공지사항 삭제 처리 
	@RequestMapping(value="deleteNoitce.do",method = {RequestMethod.POST, RequestMethod.GET})
	public String deleteNotice(int bnseq) {
		int result = 0;
		String viewpage;
		
		result = service.deleteNotice(bnseq);
		if(result > 0) {
			viewpage = "redirect:/notice.do";
		}else {
			viewpage = "redirect:/index.do";
		}
				
		return viewpage;
	}
	
	//프로젝트 공지사항 페이지 이동
	@RequestMapping(value="projectNotice.do", method = RequestMethod.GET)
	public String pjNotice(int tseq,Model model,HttpSession session) {
		String email = (String)session.getAttribute("email");
		ProjectDao dao = sqlSession.getMapper(ProjectDao.class);
		MemberDao md = sqlSession.getMapper(MemberDao.class);
		List<PjNotice> pj = dao.getPjNotice(tseq);
		TeamPjt pjt = dao.detailPJT(tseq);
		int rank = dao.searchRank(tseq, email);
		List<ProjectMemberlist> projectMemberlist =md.projectMemberlist(tseq);
		model.addAttribute("tpj", pjt);
		model.addAttribute("pjn", pj);	
		model.addAttribute("rank", rank);
		model.addAttribute("projectmember", projectMemberlist);
		
		
		return "user/ProjectNotice";
	}
	//프로젝트 공지사항 작성처리
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
	//프로젝트 공지사항 상세보기
	@RequestMapping(value="pjNoticeDetail.do",method=RequestMethod.GET)
	public String pjNoticeDetail(int pnseq,Model model,HttpSession session,int tseq) {
		String email = (String)session.getAttribute("email");
		ProjectDao dao = sqlSession.getMapper(ProjectDao.class);
		int rank = dao.searchNoticeRank(pnseq, email, tseq);
		PjNotice Detail = dao.pjNoticeDetail(pnseq);
		model.addAttribute("rank", rank);
		model.addAttribute("detail", Detail);
		return "user/projectDetailNotice";
	}
	//프로젝트 공지사항 수정 
	@RequestMapping(value="pjNoticeEdit.do",method=RequestMethod.GET)
	public String pjNoticeEdit(int pnseq,Model model) {
		ProjectDao dao = sqlSession.getMapper(ProjectDao.class);
		PjNotice edit = dao.pjNoticeDetail(pnseq);
		
		model.addAttribute("edit",edit);
		return "user/projectEditNotice";
	}
	
	//프로젝트 공지사항 수정 처리 
	@RequestMapping(value="pjNoticeEditOk.do", method = RequestMethod.POST)
	public String pjNoticeEditOk(PjNotice pjnotice,int tseq) {
		String viewpage;
		int result = 0;
		result = tservice.pjNoticeEdit(pjnotice);
		if(result > 0) {
			viewpage = "redirect:/pjNoticeDetail.do?pnseq="+pjnotice.getPnseq()+"&tseq="+tseq;
		}else {
			viewpage = "user/projectNotice";
		}
		return viewpage;
	}
	
	//프로젝트 공지사항 삭제
	@RequestMapping(value="pjNoticeDelete.do" , method = {RequestMethod.POST, RequestMethod.GET})
	public String pjNoticeDelete(int pnseq,int tseq) {
		ProjectDao dao = sqlSession.getMapper(ProjectDao.class);
		int result = dao.deletePjNotice(pnseq);
		String viewpage;
		
		if(result > 0) {
			viewpage="redirect:/projectNotice.do?tseq="+tseq;
		}else {
			viewpage="user/ProjectNotice";
		}
		
		return viewpage;
	}
	@RequestMapping(value="myissueEdit.do" , method = {RequestMethod.POST, RequestMethod.GET})
	public String myissueEdit(int piseq, Model model) {
		MyIssueDao dao = sqlSession.getMapper(MyIssueDao.class);
		MyIssue myissue = dao.myissueDetail(piseq);
		myissue.setPicontent(myissue.getPicontent().replace("<br>", "\n"));
		try {
			List<Mention> mentions = dao.getMyMentions(piseq);
			List<GoogleDrive> googledrive = dao.getMyGoogleDrive(piseq);
			List<DoWork> dowork = dao.getMyDoWork(piseq);
			List<FileDrive> files = dao.getMyFiles(piseq);
			model.addAttribute("myissue", myissue);
			model.addAttribute("mentions", mentions);
			model.addAttribute("gdrive", googledrive);
			model.addAttribute("dowork", dowork);
			model.addAttribute("files", files);
		} catch (Exception e) {
			model.addAttribute("myissue", myissue);
		}
		return "issue/myissueEdit";
	}
	@RequestMapping(value="teamIssueEdit.do" , method = {RequestMethod.POST, RequestMethod.GET})
	public String teamIssueEdit(int tiseq, Model model) {
		TissueDao dao = sqlSession.getMapper(TissueDao.class);
		Tissue tissue = dao.teamissueDetail(tiseq);
		tissue.setTicontent(tissue.getTicontent().replace("<br>", "\n"));
		try {
			//List<Reply> reply = dao.teamCommentOk(tiseq);
			List<Mention> mentions = dao.getMentions(tiseq);
			List<GoogleDrive> googledrive = dao.getGoogleDrive(tiseq);
			List<DoWork> dowork = dao.getDoWork(tiseq);
			List<FileDrive> files = dao.getFiles(tiseq);
			//model.addAttribute("reply",reply);
			model.addAttribute("mentions",mentions);
			model.addAttribute("gdrive", googledrive);
			model.addAttribute("dowork", dowork);
			model.addAttribute("files", files);
			model.addAttribute("tissue", tissue);
		} catch (Exception e) {
			model.addAttribute("tissue", tissue);
		}
		return "issue/teamIssueEdit";
	}
	@RequestMapping(value="myissueEditOk.do" , method = {RequestMethod.POST, RequestMethod.GET})
	public String myissueEditOk(int piseq,Model model, String[] editMention, String[] editGfilename, HttpSession session, HttpServletRequest request
			, String[] editGurl, String[] editToname, String[] editOriFile,String[] editDowork, String title, String editIssuecontent, String editFrom, String editTo, @RequestParam(value="editFile") MultipartFile[] editFile) throws Exception {
		String path = "";
		MyIssue tissue = new MyIssue();
		String email = (String)session.getAttribute("email");
		//tissue.setTseq(tseq);
		tissue.setPiseq(piseq);
		tissue.setEmail(email);
		tissue.setPititle(title);
		tissue.setPicontent(editIssuecontent);
		if(editFrom != null) {
			tissue.setPistart(java.sql.Timestamp.valueOf(editFrom+" 00:00:00"));
			tissue.setPiend(java.sql.Timestamp.valueOf(editTo+" 00:00:00"));
		}
		int result = privateservice.editMyissue(tissue);
		if(editFile != null && editFile.length > 0) {
			//업로드한 파일이 하나라도 있다면
			for(MultipartFile mutifile : editFile) {
				String filename = mutifile.getOriginalFilename();
				long fsize = mutifile.getSize();
				String filepath = request.getServletContext().getRealPath("/upload");
				String fpath = filepath + "\\" + filename;
				if(!filename.equals("")) {
					//서버에 파일 업로드 (write)
					FileOutputStream fs = new FileOutputStream(fpath);
					fs.write(mutifile.getBytes());
					fs.close();
					try {
						privateservice.pfileEdit(filename, fsize, email, piseq);
					} catch (Exception e) {
						privateservice.pfileEdit(filename, fsize, email, piseq);
					}
				}
			}
		}
		if(editOriFile != null && editOriFile.length > 0) {
			for(int i=0;i<editOriFile.length;i++) {
				if(editOriFile[i].contains("~delete")) {
					int pdseq = Integer.parseInt(editOriFile[i].split("~")[1]);
					privateservice.pfileDelete(pdseq);
				}
			}
		}
		if(editMention != null && editMention.length > 0) {
			for(int i=0;i<editMention.length;i++) {
				if(editMention[i].contains("~delete")) {
					int pmseq = Integer.parseInt(editMention[i].split("~")[1]);
					privateservice.pmentionDelete(pmseq);
				}else {
					if(!editMention[i].contains("~")) {
						//editMention[i] = editMention[i].split("~")[0];
						privateservice.pmentionEdit(editMention[i], piseq);
					}
				}
			}
		}
		if(editGfilename != null && editGfilename.length > 0) {
			for(int i=0;i<editGfilename.length;i++) {
				if(editGfilename[i].contains("~delete")) {
					int pgseq = Integer.parseInt(editGfilename[i].split("~")[1]);
					privateservice.pgoogleDriveDelete(pgseq);
				}else {
					if(!editGfilename[i].contains("~")) {
						//editGfilename[i] = editGfilename[i].split("/")[0];
						//editGurl[i] = editGurl[i].split("/")[0];
						privateservice.pgoogleDriveEdit(editGfilename[i], editGurl[i], piseq);
					}
				}
			}
		}
		if(editToname != null && editToname.length > 0) {
			String fromWork = email;
			for(int i=0;i<editToname.length;i++) {
				if(editToname[i].contains("~delete")) {
					int pwseq = Integer.parseInt(editToname[i].split("~")[1]);
					privateservice.pdoWorkDelete(pwseq);
				}else {
					if(!editToname[i].contains("~")) {
						//editToname[i] = editToname[i].split("/")[0];
						//editDowork[i] = editDowork[i].split("/")[0];
						privateservice.pdoWorkEdit(fromWork, editToname[i], editDowork[i], piseq);
					}
				}
			}
		}
		if(result >0) {
			model.addAttribute("piseq", piseq);
			path = "utils/editMyIssueSwal";
		}else {
			model.addAttribute("piseq", piseq);
			path = "utils/editMyIssueFailSwal";
		}
		return path;
	}
	@RequestMapping(value="teamIssueEditOk.do" , method = {RequestMethod.POST, RequestMethod.GET})
	public String teamIssueEditOk(int tseq, int tiseq,Model model, String[] editMention, String[] editGfilename, HttpSession session, HttpServletRequest request
			, String[] editGurl, String[] editToname, String[] editOriFile,String[] editDowork, String title, String editIssuecontent, String editFrom, String editTo, @RequestParam(value="editFile") MultipartFile[] editFile) throws Exception {
		String path = "";
		MyIssue tissue = new MyIssue();
		String email = (String)session.getAttribute("email");
		tissue.setTseq(tseq);
		tissue.setTiseq(tiseq);
		tissue.setEmail(email);
		tissue.setTititle(title);
		tissue.setTicontent(editIssuecontent);
		if(editFrom != null) {
			 tissue.setTistart(java.sql.Timestamp.valueOf(editFrom+" 00:00:00"));
			 tissue.setTiend(java.sql.Timestamp.valueOf(editTo+" 00:00:00"));
		}
		int result = privateservice.editTissue(tissue);
		 if(editFile != null && editFile.length > 0) {
			 //업로드한 파일이 하나라도 있다면
			 for(MultipartFile mutifile : editFile) {
				 String filename = mutifile.getOriginalFilename();
					 long fsize = mutifile.getSize();
					 String filepath = request.getServletContext().getRealPath("/upload");
					 String fpath = filepath + "\\" + filename;
					 if(!filename.equals("")) {
						 //서버에 파일 업로드 (write)
						 FileOutputStream fs = new FileOutputStream(fpath);
						 fs.write(mutifile.getBytes());
						 fs.close();
						 try {
							 tservice.fileEdit(tseq, filename, fsize, email, tiseq);
						 } catch (Exception e) {
							 tservice.fileEdit(tseq, filename, fsize, email, tiseq);
						 }
					 }
			 }
		 }
		 if(editOriFile != null && editOriFile.length > 0) {
			 for(int i=0;i<editOriFile.length;i++) {
				 if(editOriFile[i].contains("~delete")) {
					 int fdseq = Integer.parseInt(editOriFile[i].split("~")[1]);
					 tservice.fileDelete(fdseq);
				 }
			 }
		 }
		 if(editMention != null && editMention.length > 0) {
			 for(int i=0;i<editMention.length;i++) {
				 if(editMention[i].contains("~delete")) {
					 int tmseq = Integer.parseInt(editMention[i].split("~")[1]);
					 tservice.mentionDelete(tmseq);
				 }else {
					 if(!editMention[i].contains("~")) {
						 //editMention[i] = editMention[i].split("~")[0];
						 tservice.mentionEdit(editMention[i], tiseq);
					 }
				 }
			 }
		 }
		 if(editGfilename != null && editGfilename.length > 0) {
			 for(int i=0;i<editGfilename.length;i++) {
				 if(editGfilename[i].contains("~delete")) {
					 int tgseq = Integer.parseInt(editGfilename[i].split("~")[1]);
					 tservice.googleDriveDelete(tgseq);
				 }else {
					 if(!editGfilename[i].contains("~")) {
						 //editGfilename[i] = editGfilename[i].split("/")[0];
						 //editGurl[i] = editGurl[i].split("/")[0];
					 }else {
						 tservice.googleDriveEdit(editGfilename[i], editGurl[i], tiseq);
					 }
				 }
			 }
		 }
		 if(editToname != null && editToname.length > 0) {
			 String fromWork = email;
			 for(int i=0;i<editToname.length;i++) {
				 if(editToname[i].contains("~delete")) {
					 int tdseq = Integer.parseInt(editToname[i].split("~")[1]);
					 tservice.doWorkDelete(tdseq);
				 }else {
					 if(!editToname[i].contains("~")) {
						 //editToname[i] = editToname[i].split("/")[0];
						 //editDowork[i] = editDowork[i].split("/")[0];
						 tservice.doWorkEdit(fromWork, editToname[i], editDowork[i], tiseq);
					 }
				 }
			 }
		 }
		if(result >0) {
			model.addAttribute("tiseq", tiseq);
			path = "utils/editTeamIssueSwal";
		}else {
			model.addAttribute("tiseq", tiseq);
			path = "utils/editTeamIssueFailSwal";
		}
	return path;
	}
	@RequestMapping(value="deleteMyIssue.do" , method = {RequestMethod.POST, RequestMethod.GET})
	public String deleteMyIssue(int piseq, Model model) {
		privateservice.myIssueFileDelete(piseq);
		privateservice.myIssueMentionDelete(piseq);
		privateservice.myIssueGoogleDriveDelete(piseq);
		privateservice.myIssueDoWorkDelete(piseq);
		privateservice.myIssueDelete(piseq);
		return "utils/myIssueDelete";
	}
	@RequestMapping(value="deleteTeamIssue.do" , method = {RequestMethod.POST, RequestMethod.GET})
	public String deleteTeamIssue(int tiseq,int tseq, Model model) {
		tservice.teamIssueFileDelete(tiseq);
		tservice.teamIssueMentionDelete(tiseq);
		tservice.teamIssueGoogleDriveDelete(tiseq);
		tservice.teamIssueDoWorkDelete(tiseq);
		tservice.teamIssueDelete(tiseq);
		model.addAttribute("tseq", tseq);
		return "utils/teamIssueDelete";
	}
}
