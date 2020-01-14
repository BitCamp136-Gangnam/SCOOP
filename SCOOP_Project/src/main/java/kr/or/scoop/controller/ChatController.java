package kr.or.scoop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {
	@RequestMapping("/Chat.do")
	public String showView(String room, Model model) {
		model.addAttribute("room", room);
		return "/chat/Chat";
	}
}
