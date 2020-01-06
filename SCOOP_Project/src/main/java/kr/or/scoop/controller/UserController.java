package kr.or.scoop.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

@Controller
@RequestMapping("/user/")
public class UserController {
	
	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private View jsonview;
	
	@RequestMapping(value="userindex.do", method= RequestMethod.GET)
	public String userindex() {
		String viewpage = "userindex";
		return viewpage;
	}
	
	@RequestMapping(value="logout.do")
	public String logOut(HttpSession session, HttpServletResponse response ) {
		String viewpage = "";
		try {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('로그아웃');");
			out.print("</script>");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		viewpage="index.do";
		session.invalidate();
		return viewpage;
		
	}
}
