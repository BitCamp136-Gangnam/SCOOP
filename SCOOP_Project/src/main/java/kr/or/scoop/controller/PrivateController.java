package kr.or.scoop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PrivateController {
	
	//프라이빗 공간 이동
	@RequestMapping(value="private.do" , method = RequestMethod.GET)
	public String privateIn(HttpSession session) {
		session.getAttribute("email");
		String viewpage = "private/private-place";
		return viewpage;
		
	}
	
	//북마크 공간 이동
		@RequestMapping(value = "/bookmark.do",method = RequestMethod.GET)
		public String bookmark() {
			return "private/private-bookmark";
		}
		
		
	
	/*
	 * //북마크 처리
	 * 
	 * @RequestMapping(value = "/bookmark.do",method = RequestMethod.POST) public
	 * String bookmarkcheck() { return null;
	 * 
	 * }
	 */
	
	
}
