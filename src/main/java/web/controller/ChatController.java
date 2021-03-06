package web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import web.dto.User;

@Controller
public class ChatController {

	private final static Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	@RequestMapping(value="/chat")
	public void chatJoin(HttpSession session, @RequestParam String chatNick, HttpServletRequest request, User user) {
		logger.info("nick {}",session.getAttribute("nick"));
		session.setAttribute("id", session.getAttribute("nick"));
		logger.info("userNo {}",session.getAttribute("userNo"));
		user.setUserNo((Integer)session.getAttribute("userNo"));
		session.setAttribute("chatNick", chatNick);
	}

}
