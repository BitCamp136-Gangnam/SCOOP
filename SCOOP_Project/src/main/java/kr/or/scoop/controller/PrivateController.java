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
import kr.or.scoop.dto.BookMark;
import kr.or.scoop.dto.MyIssue;
import kr.or.scoop.dto.ProjectName;
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
		List<BookMark> bookMark = myissuedao.getBookMark(email);
		
		System.out.println("bookMark" + bookMark);
		
		model.addAttribute("myissuelist", myissuelist);
		model.addAttribute("bookMark", bookMark);
		
		System.out.println(myissuelist);
		System.out.println("bookMark : " + bookMark);
		
		String viewpage = "private/private-place";
		
		return viewpage;
		
	}
	
	//북마크 공간 이동
	@RequestMapping(value = "/bookmark.do",method = RequestMethod.GET)
	public String bookmark(HttpSession session, Model model) {
		int tseq, tiseq;
		String pname;
		String email = (String)session.getAttribute("email");
		MyIssueDao dao = sqlsession.getMapper(MyIssueDao.class);
		
		List<BookMark>bookMarkList = dao.getBookMark(email);
		
		

		for(int i = 0; i < bookMarkList.size(); i++) {
			System.out.println(i + " ------ " + bookMarkList.get(i));
			tseq = bookMarkList.get(i).getTseq();
			tiseq = bookMarkList.get(i).getTiseq();
			System.out.println("tseq : " + tseq + " / tiseq : " + tiseq);
			if(tseq > 0) {
				ProjectName projectName = dao.getPjtName(tseq, tiseq);
				System.out.println("pjn : " + projectName);
				
				pname = projectName.getPname();
				bookMarkList.get(i).setPname(pname);
			}
			System.out.println(i + " ------ " + bookMarkList.get(i));
		}
		
		model.addAttribute("bookMarkList", bookMarkList);
		
		return "private/private-bookmark";
	}
}
