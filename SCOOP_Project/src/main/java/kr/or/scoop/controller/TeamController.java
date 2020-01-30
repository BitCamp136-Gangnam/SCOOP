package kr.or.scoop.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.scoop.dao.MemberDao;
import kr.or.scoop.dao.MyIssueDao;
import kr.or.scoop.dao.ProjectDao;
import kr.or.scoop.dao.TissueDao;
import kr.or.scoop.dto.BookMark;
import kr.or.scoop.dto.Member;
import kr.or.scoop.dto.MyIssue;
import kr.or.scoop.dto.Process;
import kr.or.scoop.dto.ProjectMemberlist;
import kr.or.scoop.dto.TeamPjt;
import kr.or.scoop.dto.Tissue;
import kr.or.scoop.dto.Tpmember;
import kr.or.scoop.service.BoardService;
import kr.or.scoop.service.PrivateService;
import kr.or.scoop.service.TeamService;
import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

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
		public String writeIssue(String issuetitle, String fileclick, String issuecontent, String selectTeam, Model model, String fromDate, String toDate,
				HttpSession session,HttpServletRequest request, String[] mentions, String[] toWork, String[] doWork, String[] googleDrive,@RequestParam(value="files") MultipartFile[] files) throws IOException {
			String path = "";
			System.out.println(fromDate);
			System.out.println(toDate);
			String email = (String)session.getAttribute("email");
			int tseq = 0;
			 //실 DB Insert
			if (selectTeam.equals((String) session.getAttribute("email")) || selectTeam == null) {
				System.out.println("이프문 타니??");
				MyIssue myissue = new MyIssue();
				myissue.setEmail((String) session.getAttribute("email"));
				myissue.setPititle(issuetitle);
				myissue.setPicontent(issuecontent);
				myissue.setIspibook(0);
				if(fromDate != null) {
					 myissue.setPistart(java.sql.Timestamp.valueOf(fromDate+" 00:00:00"));
					 myissue.setPiend(java.sql.Timestamp.valueOf(toDate+" 00:00:00"));
				}
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
				 if(mentions != null && mentions.length > 0) {
					 for(int i=0;i<mentions.length;i++) {
						 teamservice.myMentionInsert(mentions[i]);
					 }
				 }
				 if(googleDrive != null && googleDrive.length > 0) {
					 String gfilename = "";
					 String gfileurl = "";
					 for(int i=0;i<googleDrive.length;i++) {
						 gfileurl = googleDrive[i].split("~")[0];
						 gfilename = googleDrive[i].split("~")[1];
						 teamservice.myGoogleDriveInsert(gfilename, gfileurl);
					 }
				 }
				 if(toWork != null && toWork.length > 0) {
					 String fromWork = email;
					 for(int i=0;i<toWork.length;i++) {
						 teamservice.myDoWorkInsert(fromWork, toWork[i], doWork[i]);
					 }
				 }
				if(result >0) {
					path = "ajax/makeMyIssueSwal";
					System.out.println("success insert Myissue");
				}else {
					path = "ajax/makeMyIssueFailSwal";
					System.out.println("fail insert Myissue");
				}
				return path;
			} else {
				MyIssue tissue = new MyIssue();
				tissue.setTseq(Integer.parseInt(selectTeam));
				tissue.setEmail((String)session.getAttribute("email"));
				tissue.setTititle(issuetitle);
				tissue.setTicontent(issuecontent);
				if(fromDate != null) {
					 tissue.setTistart(java.sql.Timestamp.valueOf(fromDate+" 00:00:00"));
					 tissue.setTiend(java.sql.Timestamp.valueOf(toDate+" 00:00:00"));
				}
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
				 if(mentions != null && mentions.length > 0) {
					 for(int i=0;i<mentions.length;i++) {
						 teamservice.mentionInsert(mentions[i]);
					 }
				 }
				 if(googleDrive != null && googleDrive.length > 0) {
					 String gfilename = "";
					 String gfileurl = "";
					 for(int i=0;i<googleDrive.length;i++) {
						 gfileurl = googleDrive[i].split("~")[0];
						 gfilename = googleDrive[i].split("~")[1];
						 teamservice.googleDriveInsert(gfilename, gfileurl);
					 }
				 }
				 if(toWork != null && toWork.length > 0) {
					 String fromWork = email;
					 for(int i=0;i<toWork.length;i++) {
						 teamservice.doWorkInsert(fromWork, toWork[i], doWork[i]);
					 }
				 }
				if(result >0) {
					tseq = Integer.parseInt(selectTeam);
					model.addAttribute("tseq", tseq);
					path = "ajax/makeTeamIssueSwal";
					System.out.println("success insert tissue");
				}else {
					tseq = Integer.parseInt(selectTeam);
					model.addAttribute("tseq", tseq);
					path = "ajax/makeTeamIssueFailSwal";
					System.out.println("fail insert tissue");
				}
			}
			return path;

		}
	
	
	// 칸반 받기
	@RequestMapping(value = "cooperation-kanban.do", method = RequestMethod.GET)
	public String kanbanView(int tseq, Model model) {
		String path = "";
		ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
		List<Tissue> tissuelist = teamservice.loadKanban(tseq);
		TeamPjt pjt = dao.detailPJT(tseq);
		model.addAttribute("tpj",pjt); //프로젝트 이름 , 설명
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
		
		//result = teamservice.teamSetting(pjuserrank, tseq, email);
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
	@RequestMapping(value = "changeManager.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String changeManager(int tseq, String email, Model model, HttpSession session) {
		int result = 0;
		String viewpage;
		System.out.println("tseq" + tseq);
		System.out.println("email" + email);
		String myEmail = (String)session.getAttribute("email");
		result = teamservice.changeManager(tseq, email);
		result = teamservice.changeManagerTp(tseq, email);
		result = teamservice.changeManagerTp2(tseq, myEmail);
		if(result > 0) {
			System.out.println("관리자변경성공");
			//model.addAttribute("ajax", "관리자변경 성공했습니다");
			viewpage = "redirect:/projectDetail.do?tseq="+tseq;
		}else {
			System.out.println("멤버 탈퇴실패");
			//model.addAttribute("ajax", "관리자변경 실패했습니다");
			viewpage = "redirect:/projectDetail.do?tseq="+tseq;
		}
		return viewpage;
		
	}
	@RequestMapping(value = "dropProjet.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String dropProjet(int tseq, Model model) {
		int result = 0;
		String viewpage;
		System.out.println("tseq" + tseq);
		result = teamservice.dropProject(tseq);
		if(result > 0) {
			System.out.println("프로젝트 삭제 성공");
			//model.addAttribute("ajax", "관리자변경 성공했습니다");
			viewpage = "redirect:/userindex.do";
		}else {
			System.out.println("프로젝트 삭제 실패");
			//model.addAttribute("ajax", "관리자변경 실패했습니다");
			viewpage = "redirect:/userindex.do";
		}
		return viewpage;
		
	}
	
	@ResponseBody
	@RequestMapping(value="selectChart.do", method = RequestMethod.POST)
	public Process chart(int tseq) {
		System.out.println("차트 변경");
		System.out.println("tseq : " + tseq);
		
		Process processList = null;
		TissueDao dao = sqlsession.getMapper(TissueDao.class);
		
		processList = dao.chartData(tseq);
		
		return processList;
	}
	
	@RequestMapping(value = "addTeamCalendar.do", method = RequestMethod.POST)
	public String addTeamCalendar(HttpSession session,String title, String start, String end, String description, String type, String username, String backgroundColor, String textColor, boolean allDay, int tseq) {
		int result = 0;
		System.out.println(title+"/"+start+"/"+end+"/"+description+"/"+type+"/"+username+"/"+allDay+"/"+tseq);
		String viewpage = "";
		Tissue tissue = new Tissue();
		System.out.println(start.length());
		MyIssueDao myissuedao = sqlsession.getMapper(MyIssueDao.class);
		tissue.setTititle(title);
		tissue.setEmail((String)session.getAttribute("email"));
		tissue.setTicontent(description);
		tissue.setTseq(tseq);
		tissue.setBackgroundColor(backgroundColor);
		tissue.setTextColor(textColor);
		tissue.setAllDay((true ? 1 : 0));
		if(start.length()==16) {
			System.out.println(start+":00");
			tissue.setTistart(java.sql.Timestamp.valueOf(start+":00"));
			tissue.setTiend(java.sql.Timestamp.valueOf(end+":00"));
			result = myissuedao.writeCalendarTissue(tissue);
		} else {
			System.out.println(start+" 00:00:00");
			tissue.setTistart(java.sql.Timestamp.valueOf(start+" 00:00:00"));
			tissue.setTiend(java.sql.Timestamp.valueOf(end+" 00:00:00"));
			result = myissuedao.writeCalendarTissue(tissue);
		}
		
		if(result>0) {
			System.out.println("성공");
			viewpage = "redirect:/calendar.do";
		} else {
			System.out.println("실패");
			viewpage = "redirect:/calendar.do";
		}
		
		return viewpage;
		
	}
	
	@RequestMapping(value = "editTeamCalendar.do", method = RequestMethod.POST)
	public String editTeamCalendar(String title, String start, String end, String description, String type, String backgroundColor, boolean allDay, int tseq, int tiseq) {
		int result = 0;
		System.out.println(title+"/"+start+"/"+end+"/"+description+"/"+type+"/"+allDay+"/"+tseq);
		String viewpage = "";
		Tissue tissue = new Tissue();
		System.out.println(start.length());
		MyIssueDao myissuedao = sqlsession.getMapper(MyIssueDao.class);
		tissue.setTititle(title);
		tissue.setTicontent(description);
		tissue.setTseq(tseq);
		tissue.setTiseq(tiseq);
		tissue.setBackgroundColor(backgroundColor);
		if(start.length()==16) {
			System.out.println(start+":00");
			tissue.setAllDay(0);
			tissue.setTistart(java.sql.Timestamp.valueOf(start+":00"));
			tissue.setTiend(java.sql.Timestamp.valueOf(end+":00"));
			result = myissuedao.editTeamCalendar(tissue);
		} else {
			tissue.setAllDay(1);
			System.out.println(start+" 00:00:00");
			tissue.setTistart(java.sql.Timestamp.valueOf(start+" 00:00:00"));
			tissue.setTiend(java.sql.Timestamp.valueOf(end+" 00:00:00"));
			result = myissuedao.editTeamCalendar(tissue);
		}
		
		if(result>0) {
			System.out.println("성공");
			viewpage = "redirect:/calendar.do";
		} else {
			System.out.println("실패");
			viewpage = "redirect:/calendar.do";
		}
		
		return viewpage;
		
	}
	
	@RequestMapping(value = "deleteTeamCalendar.do", method = RequestMethod.POST)
	public String deleteTeamCalendar(int tiseq) {
		int result = 0;
		String viewpage = "";
		Tissue tissue = new Tissue();
		MyIssueDao myissuedao = sqlsession.getMapper(MyIssueDao.class);
		tissue.setTiseq(tiseq);
		result = myissuedao.deleteTeamCalendar(tissue);
		
		if(result>0) {
			System.out.println("성공");
			viewpage = "redirect:/calendar.do";
		} else {
			System.out.println("실패");
			viewpage = "redirect:/calendar.do";
		}
		
		return viewpage;
		
	}
	
	@ResponseBody
	@RequestMapping(value="getTeamCalendar.do", method = RequestMethod.GET)
	public JSONArray getTeamCalendar(HttpSession session, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		String email = (String)session.getAttribute("email");
		ProjectDao projectdao = sqlsession.getMapper(ProjectDao.class);
		TissueDao tissuedao = sqlsession.getMapper(TissueDao.class);
		List<Tpmember> pjtlist = projectdao.getPJT(email);
		List<Tissue> temptissuelist;
		Map<Integer, Tissue> sortlist = new HashMap<Integer, Tissue>();
		JSONArray jArray = new JSONArray();
		System.out.println("pjtlist"+pjtlist);
		System.out.println(pjtlist.size());
		int tempnum = 0;
		for(Tpmember tpmember : pjtlist) {
			 System.out.println("몇번도니?");
			 System.out.println(tpmember.getTseq());
			 temptissuelist = tissuedao.loadKanban(tpmember.getTseq());
			 System.out.println(temptissuelist.size());
			 System.out.println(temptissuelist);
			 for(Tissue tissue : temptissuelist) {
				 if(tissue.getTistart()!=null) {
					 System.out.println("caltissue 와따시");
					 sortlist.put(tempnum++, tissue);
				 }
				 
			 }
			 
//			 temptissuelist = tissuedao.loadKanban(pjtlist.get(i).getTseq());
			 
//			 for(int j = 0 ; j > temptissuelist.size() ; j++) {
//				 System.out.println("2중포문오니?");
//				 System.out.println("temptissue"+temptissuelist.get(j));
//				 caltissuelist.add(temptissuelist.get(j));
//			 }
			 
			 
		}
		try {
			System.out.println(sortlist);
			Iterator<Integer> tissueitor = sortlist.keySet().iterator();
			System.out.println(tissueitor);
			SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd'T'HH:mm" , Locale.KOREA );
			SimpleDateFormat sdft = new SimpleDateFormat( "yyyy-MM-dd");
			while(tissueitor.hasNext()) {
				int key =tissueitor.next();
				JSONObject data = new JSONObject();
				int z = sortlist.get(key).getAllDay();
				
				data.put("_id", key++);
				data.put("title", sortlist.get(key).getTititle());
				data.put("description", sortlist.get(key).getTicontent());
				boolean allDay;
				if(z==0) {
					allDay = false;
					data.put("start", (String)sdf.format(sortlist.get(key).getTistart()).toString());
					data.put("end", (String)sdf.format(sortlist.get(key).getTiend()).toString());
				} else {
					allDay = true;
					data.put("start", (String)sdft.format(sortlist.get(key).getTistart()).toString());
					data.put("end", (String)sdft.format(sortlist.get(key).getTiend()).toString());
				}
				data.put("type", String.valueOf(sortlist.get(key).getTiseq()));
				data.put("username", sortlist.get(key).getEmail());
				data.put("backgroundColor", sortlist.get(key).getBackgroundColor());
				data.put("textColor", sortlist.get(key).getTextColor());
				
				data.put("allDay", allDay);
				jArray.add(data);
				System.out.println("while문 도니?");
				System.out.println(data);
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		System.out.println("jArray 입니다"+jArray);
		/*
		System.out.println(caltissuelist);
		for(int i = 0 ; i > caltissuelist.size() ; i ++) {
			JSONObject data = new JSONObject();
			data.put("_id", i++);
			data.put("title", caltissuelist.get(i).getTititle());
			data.put("start", caltissuelist.get(i).getTistart());
			data.put("end", caltissuelist.get(i).getTiend());
			data.put("type", caltissuelist.get(i).getTiseq());
			data.put("username", caltissuelist.get(i).getEmail());
			data.put("backgroundColor", caltissuelist.get(i).getBackgroundColor());
			data.put("textColor", caltissuelist.get(i).getTextColor());
			int z = caltissuelist.get(i).getAllDay();
			boolean allDay;
			if(z==0) {
				allDay = false;
			} else {
				allDay = true;
			}
			data.put("allDay", allDay);
			jArray.add(i, data);
			
		}
		*/
		
		
		return jArray;
	}
}
