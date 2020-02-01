package kr.or.scoop.controller;

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

import kr.or.scoop.dao.MyIssueDao;
import kr.or.scoop.dao.ProjectDao;
import kr.or.scoop.dao.TissueDao;
import kr.or.scoop.dto.BookMark;
import kr.or.scoop.dto.MyIssue;
import kr.or.scoop.dto.ProjectName;
import kr.or.scoop.dto.Tissue;
import kr.or.scoop.dto.Tpmember;
import kr.or.scoop.service.MemberService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;



@Controller
public class PrivateController {
	
	@Autowired
	private MemberService service;

	@Autowired
	private SqlSession sqlsession;
	
	//프라이빗 공간
	@RequestMapping(value="private.do" , method = RequestMethod.GET)
	public String privateIn(HttpSession session, Model model) {
		String email = "";
		email = (String)session.getAttribute("email");
		
		System.out.println("private Controller email : " + email);
		
		MyIssueDao myissuedao = sqlsession.getMapper(MyIssueDao.class);
		List<MyIssue> myissuelist = myissuedao.getMyissue(email);
		for(int i=0; i<myissuelist.size();i++) {
			myissuelist.get(i).setPicontent(myissuelist.get(i).getPicontent().replace("<br>", " "));
		}
		List<BookMark> bookMark = myissuedao.getBookMark(email);
		
		model.addAttribute("myissuelist", myissuelist);
		model.addAttribute("bookMark", bookMark);
		
		String viewpage = "private/private-place";
		
		return viewpage;
	}
	
	//북마크 페이지
	@RequestMapping(value = "/bookmark.do",method = RequestMethod.GET)
	public String bookmark(HttpSession session, Model model) {
		int tseq, tiseq;
		String pname;
		String email = (String)session.getAttribute("email");
		MyIssueDao dao = sqlsession.getMapper(MyIssueDao.class);
		
		List<BookMark> bookMarkList = dao.getBookMark(email);
		
		for(int i = 0; i < bookMarkList.size(); i++) {
			tseq = bookMarkList.get(i).getTseq();
			tiseq = bookMarkList.get(i).getTiseq();
			System.out.println("tseq : " + tseq + " / tiseq : " + tiseq);
			if(tseq > 0) {
				ProjectName projectName = dao.getPjtName(tseq, tiseq);
				pname = projectName.getPname();
				bookMarkList.get(i).setPname(pname);
			}
			System.out.println(i + " ------ " + bookMarkList.get(i));
		}
		
		model.addAttribute("bookMarkList", bookMarkList);
		
		return "private/private-bookmark";
	}
	
	@RequestMapping("/private-calendar.do")
	public String object(@RequestParam(required = false, name="lang") String language, HttpServletRequest request, HttpServletResponse response,Model model,HttpSession session) {
		System.out.println("privatecalendar 왔냐?");
		String email = (String)session.getAttribute("email");
		return "private/private-calendar";
	}
	
	@RequestMapping(value = "addPrivateCalendar.do", method = RequestMethod.POST)
	public String addPrivateCalendar(HttpSession session,String title, String start, String end, String description, String type, String username, String backgroundColor, String textColor, String allDay, String tseq) {
		int result = 0;
		System.out.println(title+"/"+start+"/"+end+"/"+description+"/"+type+"/"+username+"/"+allDay+"/"+tseq);
		String viewpage = "";
		MyIssue myissue = new MyIssue();
		System.out.println(start.length());
		MyIssueDao myissuedao = sqlsession.getMapper(MyIssueDao.class);
		myissue.setPititle(title);
		myissue.setEmail((String)session.getAttribute("email"));
		myissue.setPicontent(description);
		myissue.setBackgroundColor(backgroundColor);
		myissue.setTextColor(textColor);
		int alldayReturn = 0;
		if(allDay.equals("true")) {
			alldayReturn = 1;
		} else {
			alldayReturn = 0;
		}
		myissue.setAllDay(alldayReturn);
		if(start.length()==16) {
			System.out.println(start+":00");
			myissue.setPistart(java.sql.Timestamp.valueOf(start+":00"));
			myissue.setPiend(java.sql.Timestamp.valueOf(end+":00"));
			result = myissuedao.writeMyCalendar(myissue);
		} else {
			System.out.println(start+" 00:00:00");
			myissue.setPistart(java.sql.Timestamp.valueOf(start+" 00:00:00"));
			myissue.setPiend(java.sql.Timestamp.valueOf(end+" 00:00:00"));
			result = myissuedao.writeMyCalendar(myissue);
		}
		
		if(result>0) {
			System.out.println("성공");
			viewpage = "redirect:/private-calendar.do";
		} else {
			System.out.println("실패");
			viewpage = "redirect:/private-calendar.do";
		}
		
		return viewpage;
		
	}
	
	@RequestMapping(value = "editPrivateCalendar.do", method = RequestMethod.POST)
	public String editPrivateCalendar(int _id, String title, String start, String end, String description, String type, String backgroundColor, boolean allDay) {
		int result = 0;
		System.out.println(title+"/"+start+"/"+end+"/"+description+"/"+type+"/"+allDay+"/");
		String viewpage = "";
		MyIssue myissue = new MyIssue();
		System.out.println(start.length());
		System.out.println("idididididididididididid :"+_id);
		MyIssueDao myissuedao = sqlsession.getMapper(MyIssueDao.class);
		myissue.setPititle(title);
		myissue.setPicontent(description);
		myissue.setPiseq(_id);
		myissue.setBackgroundColor(backgroundColor);
		if(start.length()==16) {
			System.out.println(start+":00");
			myissue.setAllDay(0);
			myissue.setPistart(java.sql.Timestamp.valueOf(start+":00"));
			myissue.setPiend(java.sql.Timestamp.valueOf(end+":00"));
			result = myissuedao.editMyCalendar(myissue);
		} else {
			myissue.setAllDay(1);
			System.out.println(start+" 00:00:00");
			myissue.setTistart(java.sql.Timestamp.valueOf(start+" 00:00:00"));
			myissue.setTiend(java.sql.Timestamp.valueOf(end+" 00:00:00"));
			result = myissuedao.editMyCalendar(myissue);
		}
		
		if(result>0) {
			System.out.println("성공");
			viewpage = "redirect:/private-calendar.do";
		} else {
			System.out.println("실패");
			viewpage = "redirect:/private-calendar.do";
		}
		
		return viewpage;
		
	}
	
	@RequestMapping(value = "deletePrivateCalendar.do", method = RequestMethod.POST)
	public String deletePrivateCalendar(int piseq, String username, HttpSession session) {
		int result = 0;
		String viewpage = "";
		MyIssue myissue = new MyIssue();
		MyIssueDao myissuedao = sqlsession.getMapper(MyIssueDao.class);
		myissue.setPiseq(piseq);
		try {
			String name = (String)session.getAttribute("name");
			if(name.equals(username)) {
				result = myissuedao.myIssueDelete(piseq);
				if(result>0) {
					System.out.println("성공");
					viewpage = "redirect:/private-calendar.do";
				} else {
					System.out.println("실패");
					viewpage = "redirect:/private-calendar.do";
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return viewpage;
		
	}
	
	@ResponseBody
	@RequestMapping(value="getPrivateCalendar.do", method = RequestMethod.GET)
	public JSONArray getPrivateCalendar(HttpSession session, HttpServletResponse response, Model model) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		String email = (String)session.getAttribute("email");
		MyIssueDao myissuedao = sqlsession.getMapper(MyIssueDao.class);
		List<MyIssue> myissuelist = myissuedao.getMyissue(email);
		JSONArray jArray = new JSONArray();
		SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd'T'HH:mm" , Locale.KOREA );
		SimpleDateFormat sdft = new SimpleDateFormat( "yyyy-MM-dd");
		int z = 0;
		if(!myissuelist.isEmpty()){
			JSONObject data = new JSONObject();
			for(MyIssue myissue: myissuelist) {
				if(myissue.getPistart()!=null) {
				data.put("_id", myissue.getPiseq());
				data.put("title", myissue.getPititle());
				data.put("description", myissue.getPicontent());
				
				boolean allDay;
				z = myissue.getAllDay();
				if(z==0) {
					allDay = false;
					data.put("start", (String)sdf.format(myissue.getPistart()).toString());
					data.put("end", (String)sdf.format(myissue.getPiend()).toString());
				} else {
					allDay = true;
					data.put("start", (String)sdf.format(myissue.getPistart()).toString());
					data.put("end", (String)sdf.format(myissue.getPiend()).toString());
				}
				
				data.put("type", "프라이빗 공간");
				data.put("username", (String)session.getAttribute("name"));
				data.put("backgroundColor", myissue.getBackgroundColor());
				data.put("textColor", myissue.getTextColor());
				data.put("allDay", allDay);
				jArray.add(data);
			}
			}
		}
		System.out.println(jArray);		
		
		return jArray;
	}
}
