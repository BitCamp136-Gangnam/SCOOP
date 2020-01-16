package kr.or.scoop.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.or.scoop.dao.MemberDao;
import kr.or.scoop.dao.ProjectDao;
import kr.or.scoop.dao.TissueDao;
import kr.or.scoop.dto.MyIssue;
import kr.or.scoop.dto.ProjectMemberlist;
import kr.or.scoop.dto.TeamPjt;
import kr.or.scoop.dto.Tifile;
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
			viewpage = "redirect:/userindex.do";
		} else {
			System.out.println("가입실패");
			viewpage = "index";
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
	public String JoinProject(int tseq, Model model) {
		System.out.println(tseq);
		ProjectDao dao = sqlsession.getMapper(ProjectDao.class);
		MemberDao md = sqlsession.getMapper(MemberDao.class);
		TeamPjt pjt = dao.detailPJT(tseq);
		List<Tissue> tp = dao.getTissue(tseq);
		List<ProjectMemberlist> projectMemberlist =md.projectMemberlist(tseq);
		System.out.println(pjt);
		System.out.println(tp);
		System.out.println(projectMemberlist);
		model.addAttribute("tpj",pjt); //프로젝트 이름 , 설명
		model.addAttribute("tp",tp); //프로젝트 글 목록
		model.addAttribute("projectmember", projectMemberlist);
		return "user/ProjectDetail";
		
	}
	
	// 이슈 작성
	@RequestMapping(value = "writeIssue.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String writeIssue(String issuetitle, String fileclick, String issuecontent, String selectTeam, Model model,
			HttpSession session, String mentions, MultipartHttpServletRequest request,Tifile tf) {
		String path = "";
		System.out.println("????"+selectTeam);
		System.out.println("????"+(String) session.getAttribute("email"));
		if (selectTeam.equals((String) session.getAttribute("email")) || selectTeam == null) {
			System.out.println("이프문 타니??");
			MyIssue myissue = new MyIssue();
			myissue.setEmail((String) session.getAttribute("email"));
			myissue.setPititle(issuetitle);
			myissue.setPicontent(issuecontent);
			myissue.setIspibook(0);
			myissue.setMymention(mentions);
			int result = privateservice.writeMyissue(myissue);
			if(result >0) {
				path = "redirect:/userindex.do";
				System.out.println("success insert Myissue");
			}else {
				path = "redirect:/userindex.do";
				System.out.println("fail insert Myissue");
			}
			return path;
		} else {
			
			Tissue tissue = new Tissue();
			tissue.setEmail((String)session.getAttribute("email"));
			tissue.setTititle(issuetitle);
			tissue.setTicontent(issuecontent);
			tissue.setTseq(Integer.parseInt(selectTeam));
			String realFolder = "c:/upload2/";
	        File dir = new File(realFolder);
	        if (!dir.isDirectory()) {
	            dir.mkdirs();
	        }
	 
	        // 넘어온 파일을 리스트로 저장
	       
			int result = teamservice.writeTissue(tissue);
			if(result >0) {
				// 여기는 insert 성고
				int upload = 0;
				TissueDao dao = sqlsession.getMapper(TissueDao.class);
				upload = dao.getSeq(tissue);
				// 여기는 이제 select문해서 마지막 sequence값 받기
					if(upload > 0) {
						 List<MultipartFile> mf = new ArrayList<>();
					        mf.add(request.getFile("files[]"));
					        if (mf.size() == 0 && mf.get(0).getOriginalFilename().equals("")) {
					             System.out.println("파일이없는경우");
					        } else {
					        	System.out.println("파일은있다");
					            for (int i = 0; i < mf.size(); i++) {
					            	
					                // 파일 중복명 처리
					                String genId = UUID.randomUUID().toString();
					                // 본래 파일명
					                String originalfileName = mf.get(i).getOriginalFilename();
					                 Tifile tifile = null;
					                int tiseq = 0; 
					                tifile.setTiseq(tissue.getTiseq());
					                tiseq = tifile.getTiseq();
					                // 저장되는 파일 이름
					 
					                String savePath = realFolder; // 저장 될 파일 경로
					 
					                long fileSize = mf.get(i).getSize(); // 파일 사이즈
					 
					                try {
										mf.get(i).transferTo(new File(savePath));
									} catch (IllegalStateException e) {
										// TODO Auto-generated catch block
										e.printStackTrace();
										System.out.println("파일 저장 전에 터짐");
									} catch (IOException e) {
										// TODO Auto-generated catch block
										e.printStackTrace();
									} // 파일 저장
					 
					                teamservice.fileUpload(originalfileName, fileSize, tf);
					                System.out.println(originalfileName);
					                System.out.println(fileSize);
					            }
					            
					        }
						 	System.out.println("result가 들어간다잉");
					}
				// 여기서 select한 값을 가지고 dto.getTiseq를 리턴
				
				// 리턴값에 Tifile.setTiseq(tissue.getTiseq);
				
				// 다음은 tifile insert into .... mapper . return 받아서 page뿌려줌
				
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
}
