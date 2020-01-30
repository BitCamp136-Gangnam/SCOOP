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
	public String addPrivateCalendar(HttpSession session,String title, String start, String end, String description, String type, String username, String backgroundColor, String textColor, String allDay, int tseq) {
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
		int alldayReturn = 0;
		if(allDay.equals("true")) {
			alldayReturn = 1;
		} else {
			alldayReturn = 0;
		}
		tissue.setAllDay(alldayReturn);
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
	
	@RequestMapping(value = "editPrivateCalendar.do", method = RequestMethod.POST)
	public String editPrivateCalendar(int _id, String title, String start, String end, String description, String type, String backgroundColor, boolean allDay) {
		int result = 0;
		System.out.println(title+"/"+start+"/"+end+"/"+description+"/"+type+"/"+allDay+"/");
		String viewpage = "";
		Tissue tissue = new Tissue();
		System.out.println(start.length());
		System.out.println("idididididididididididid :"+_id);
		MyIssueDao myissuedao = sqlsession.getMapper(MyIssueDao.class);
		tissue.setTititle(title);
		tissue.setTicontent(description);
		tissue.setTiseq(_id);
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
	
	@RequestMapping(value = "deletePrivateCalendar.do", method = RequestMethod.POST)
	public String deletePrivateCalendar(int tiseq, String username, HttpSession session) {
		int result = 0;
		String viewpage = "";
		Tissue tissue = new Tissue();
		MyIssueDao myissuedao = sqlsession.getMapper(MyIssueDao.class);
		tissue.setTiseq(tiseq);
		try {
			String name = (String)session.getAttribute("name");
			if(name.equals(username)) {
				result = myissuedao.deleteTeamCalendar(tissue);
				if(result>0) {
					System.out.println("성공");
					viewpage = "redirect:/calendar.do";
				} else {
					System.out.println("실패");
					viewpage = "redirect:/calendar.do";
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
			 System.out.println(tpmember.getTseq());
			 temptissuelist = tissuedao.getTissueList(tpmember.getTseq());
			 System.out.println(temptissuelist.size());
			 System.out.println(temptissuelist);
			 for(Tissue tissue : temptissuelist) {
				 if(tissue.getTistart()!=null) {
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
				
				data.put("_id", sortlist.get(key).getTiseq());
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
				for(Tpmember tpmember : pjtlist) {
					if(tpmember.getTseq() == sortlist.get(key).getTseq()) {
						data.put("type", tpmember.getPname());
					}
				}
				
				data.put("username", sortlist.get(key).getName());
				data.put("backgroundColor", sortlist.get(key).getBackgroundColor());
				data.put("textColor", sortlist.get(key).getTextColor());
				
				data.put("allDay", allDay);
				data.put("tiseq", sortlist.get(key).getTiseq());
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
