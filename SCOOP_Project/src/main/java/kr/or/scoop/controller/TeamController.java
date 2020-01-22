package kr.or.scoop.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
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
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import kr.or.scoop.dao.MemberDao;
import kr.or.scoop.dao.MyIssueDao;
import kr.or.scoop.dao.ProjectDao;
import kr.or.scoop.dto.BookMark;
import kr.or.scoop.dto.MyIssue;
import kr.or.scoop.dto.ProjectMemberlist;
import kr.or.scoop.dto.TeamPjt;
import kr.or.scoop.dto.Tissue;
import kr.or.scoop.service.BoardService;
import kr.or.scoop.service.PrivateService;
import kr.or.scoop.service.TeamService;

@Controller
public class TeamController {
	
	
	  @Autowired
	  private SqlSession sqlsession;
	
	@Autowired
	private BoardService service;
	
	@Autowired
	private TeamService teamservice;
	@Autowired
	private PrivateService privateservice;
	
	@RequestMapping(value = "team.do" , method= {RequestMethod.POST,RequestMethod.GET})
	public String CreateProject(TeamPjt team) {
		System.out.println("팀컨 와?" + team);
		int result = 0;
		String viewpage;
		
		System.out.println("팀컨 와?" + team);
		result = service.insertTeamPjt(team);
		
		if(result > 0) {
			System.out.println("프로젝트 생성성공");
			viewpage = "redirect:/userindex.do";
		}else {
			System.out.println("프로젝트 생성실패");
			viewpage = "redirect:/userindex.do";
		}
		return viewpage;
		
	}
	
	@RequestMapping(value = "inviteOk.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String normalInsert(HttpSession session) throws ClassNotFoundException, SQLException {
		int result = 0;
		String viewpage = "";
		String email = (String)session.getAttribute("mailTo");
		String temptseq = (String)session.getAttribute("tseq");
		int tseq = Integer.parseInt(temptseq);
		System.out.println("메일투"+email);
		System.out.println("티에스이큐"+tseq);
		result = service.insertTeamPjt2(email, tseq);
		if (result > 0) {
			System.out.println("협업공간 초대 성공");
			viewpage = "ajax/inviteSuccessSwal";
		} else {
			System.out.println("가입실패");
			viewpage = "ajax/inviteFailSwal";
		}

		return viewpage; // 주의 (website/index.htm

	}
	
	@RequestMapping(value = "/invitecertified.do")
	public String certified() {
		System.out.println("인바이트서티파이드");
		return "certified/InviteCertified";
	}
	
	//팀 디테일 
	@RequestMapping(value = "projectDetail.do" , method = RequestMethod.GET)
	public String projectDetail(HttpSession session, int tseq, Model model) {
		String email = (String)session.getAttribute("email");
		System.out.println(tseq);
		
		ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
		MemberDao md = sqlsession.getMapper(MemberDao.class);
		MyIssueDao mydao = sqlsession.getMapper(MyIssueDao.class);
		
		TeamPjt pjt = dao.detailPJT(tseq);
		List<Tissue> tp = dao.getTissue(tseq);
		List<ProjectMemberlist> projectMemberlist =md.projectMemberlist(tseq);
		List<BookMark> bookMark = mydao.getBookMark(email);
		
		System.out.println(pjt);
		System.out.println(tp);
		System.out.println(projectMemberlist);
		
		int rank = dao.searchRank(tseq, email);
		System.out.println("rank : " + rank);
		
		model.addAttribute("tpj",pjt); //프로젝트 이름 , 설명
		model.addAttribute("tp",tp); //프로젝트 글 목록
		model.addAttribute("projectmember", projectMemberlist);
		model.addAttribute("rank", rank);
		model.addAttribute("bookMark", bookMark);
		
		return "user/ProjectDetail";
		
	}
	
	// 이슈 작성
		@RequestMapping(value = "writeIssue.do", method = {RequestMethod.POST,RequestMethod.GET})
		public String writeIssue(String issuetitle, String fileclick, String issuecontent, String selectTeam, Model model,
				HttpSession session,HttpServletRequest request, String mentions, @RequestParam(value="files") MultipartFile[] files) throws IOException {
			String path = "";
			String email = (String)session.getAttribute("email");
			int tseq = 0;
			System.out.println("파일??"+files);
			 //실 DB Insert
			if (selectTeam.equals((String) session.getAttribute("email")) || selectTeam == null) {
				System.out.println("이프문 타니??");
				MyIssue myissue = new MyIssue();
				myissue.setEmail((String) session.getAttribute("email"));
				myissue.setPititle(issuetitle);
				myissue.setPicontent(issuecontent);
				myissue.setIspibook(0);
				myissue.setMymention(mentions);
				//myissue.setPfilename(dbFileName);
				//myissue.setPfilesize(dbFileSize);
				int result = privateservice.writeMyissue(myissue);
				 if(files != null && files.length > 0) {
					 //업로드한 파일이 하나라도 있다면
					 for(MultipartFile mutifile : files) {
						 String filename = mutifile.getOriginalFilename();
						 long fsize = mutifile.getSize();
						 String filepath = request.getServletContext().getRealPath("/upload");
						 String fpath = filepath + "\\" + filename;
						 System.out.println(filename + " , " + fpath);
						 if(!filename.equals("")) {
							 //서버에 파일 업로드 (write)
							 FileOutputStream fs = new FileOutputStream(fpath);
							 fs.write(mutifile.getBytes());
							 fs.close();
							 try {
								 teamservice.myFileInsert(filename, fsize, email);
							 } catch (Exception e) {
								 teamservice.myFileInsert(filename, fsize, email);
							 }
						 }
					 }
				 }
				if(result >0) {
					path = "redirect:/userindex.do";
					System.out.println("success insert Myissue");
				}else {
					path = "redirect:/userindex.do";
					System.out.println("fail insert Myissue");
				}
				return path;
			} else {
				MyIssue tissue = new MyIssue();
				tissue.setTseq(Integer.parseInt(selectTeam));
				tissue.setEmail((String)session.getAttribute("email"));
				tissue.setTititle(issuetitle);
				tissue.setTicontent(issuecontent);
				int result = privateservice.writeTissue(tissue);
				 if(files != null && files.length > 0) {
					 //업로드한 파일이 하나라도 있다면
					 for(MultipartFile mutifile : files) {
						 String filename = mutifile.getOriginalFilename();
						 long fsize = mutifile.getSize();
						 String filepath = request.getServletContext().getRealPath("/upload");
						 String fpath = filepath + "\\" + filename;
						 System.out.println(filename + " , " + fpath);
						 if(!filename.equals("")) {
							 //서버에 파일 업로드 (write)
							 FileOutputStream fs = new FileOutputStream(fpath);
							 fs.write(mutifile.getBytes());
							 fs.close();
							 try {
								 tseq = Integer.parseInt(selectTeam);
								 teamservice.fileInsert(tseq, filename, fsize, email);
							 } catch (Exception e) {
								 tseq = Integer.parseInt(selectTeam);
								 teamservice.fileInsert(tseq, filename, fsize, email);
							 }
						 }
					 }
				 }
				if(result >0) {
				    path = "user/ProjectDetail";
					System.out.println("success insert tissue");
				}else {
					System.out.println("에러다잉");
					path = "user/ProjectDetail";
					System.out.println("fail insert tissue");
				}
			}
			return path;

		}
	
	
	// 칸반 받기
	@RequestMapping(value = "cooperation-kanban.do", method = RequestMethod.GET)
	public String kanbanView(int tseq, Model model) {
		String path = "";
		List<Tissue> tissuelist = teamservice.loadKanban(tseq);
		if(tissuelist.isEmpty()) {
			path = "cooperation/cooperation-kanban";
		} else {
			path = "cooperation/cooperation-kanban";
			model.addAttribute("tissuelist", tissuelist);
			System.out.println();
		}
		return path;

	}
	
	//협업공간 권한설정
	@RequestMapping(value = "teamSetting.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String teamSetting(int tseq, String[] email, int[] pjuserrank, Model model,TeamPjt teampjt) {
		int result = 0;
		String viewpage;
		
		result = teamservice.teamSetting(pjuserrank, tseq, email);
		result = teamservice.teamUpdate(teampjt);
		
		if(result > 0) {
			System.out.println("권한 설정성공");
			viewpage = "redirect:/projectDetail.do?tseq="+tseq;
		}else {
			System.out.println("권한 설정 실패");
			viewpage = "redirect:/userindex.do";
		}
		return viewpage;
		
	}
	// 칸반 수정
	@RequestMapping(value = "kanbanEdit.do", method = RequestMethod.POST)
	public String kanbanEdit(int tseq, int tiseq, int isprocess, Model model) {
		String path = "";
		int result = 0;
		System.out.println("result kanban edit 전");
		result = teamservice.EditKanban(tseq, tiseq, isprocess);
		if(result>0) {
			path = "redirect:/cooperation-kanban.do?tseq="+tseq;
			System.out.println("result kanban edit 성공");
		} else {
			path = "redirect:/cooperation-kanban.do?tseq="+tseq;
			System.out.println("result kanban edit 실패");
		}
		return path;
	}

	//협업공간 멤버탈퇴
	@RequestMapping(value = "banMember.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String banMember(int tseq, String email, Model model) {
		int result = 0;
		String viewpage;
		System.out.println("tseq" + tseq);
		System.out.println("email" + email);
		result = teamservice.banMember(tseq, email);
		
		if(result > 0) {
			System.out.println("멤버 탈퇴성공");
			model.addAttribute("ajax", "멤버탈퇴 성공했습니다");
			viewpage = "ajax/ajax";
		}else {
			System.out.println("멤버 탈퇴실패");
			model.addAttribute("ajax", "멤버탈퇴 실패했습니다");
			viewpage = "ajax/ajax";
		}
		return viewpage;
		
	}
	
}
