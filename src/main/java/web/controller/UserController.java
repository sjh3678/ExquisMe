package web.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import web.dto.ExComm;
import web.dto.Extagram;
import web.dto.SocialAccount;
import web.dto.User;
import web.service.face.UserService;

@Controller
@RequestMapping(value="/user")
public class UserController {
		
	private Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired UserService userService;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void login() {
		logger.info("/login [GET]");
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginProc(
			@RequestParam(value="id", required=false) String id
			, @RequestParam(value="pw", required=false) String pw
			, HttpSession session){
		logger.info("/login [POST]");
		User user = new User();
		user.setId(id);
		String salt = pw;//암호화....
		user.setSalt(salt);//암호화시 고정되는 솔트값
		boolean isLogin = userService.getLoginCheck(user);
		if(isLogin) {
			user = userService.getUserInfo(user);
			
			session.setAttribute("login", isLogin);
			session.setAttribute("nick", user.getNick() );
			session.setAttribute("userNo", user.getUserNo() );
		
		}else {
			
		}
		return null;
	}
	
	@RequestMapping(value="/logout")
	public void logout() {
		logger.info("/logout");
	}
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public void join() {
		logger.info("/join [GET]");
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinProc(User user) {
		logger.info("/join [POST]");
		boolean isJoin = userService.getJoinCheck(user);
		return null;
	}
	
	//이거도 아직...
	@RequestMapping(value="/social/join")
	public String socialJoin(SocialAccount social) {
		logger.info("/social/join");
		return null;
	}
	
	//이거 모름....
	@RequestMapping(value="/social/join")
	public String socialLogin() {
		logger.info("/social/login");
		return null;
	}
	
	@RequestMapping(value="/mypage")
	public void myPage() {
		logger.info("/mypage");
	}
	
	@RequestMapping(value="/check/password", method=RequestMethod.GET)
	public void checkPassword() {
		logger.info("/check/password [GET]");
	}
	
	@RequestMapping(value="/check/password", method=RequestMethod.POST)
	public void checkPasswordProc(String pw, HttpSession session) {
		
		logger.info("/check/password [POST]");
		
		String pwSalt = pw;
		
		int userno = (int) session.getAttribute("userNo");
		
		boolean pwCheck = userService.getCheckPassword(pwSalt, userno);
	}
	
	@RequestMapping(value="/pw/update", method=RequestMethod.GET)
	public void pwUpdate() {
		logger.info("/pw/update [GET]");
	}
	
	@RequestMapping(value="/pw/update", method=RequestMethod.POST)
	public String pwUpdateProc(String pw, String pwChk, HttpSession session) {
		logger.info("/pw/update [POST]");
		int userno = (int) session.getAttribute("userNo");
		
		String pwSalt = pw;
		String pwChkSalt = pwChk;
		
		boolean isUpdate = userService.setUpdatePw(pwSalt, pwChkSalt, userno);
		
		return null;
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public void userDelete(int userno) {
		logger.info("/delete [GET]");
		userService.deleteUser(userno);
	}
	
	@RequestMapping(value="/view/history", method=RequestMethod.POST)
	public void viewExtraHistory(int userNo) {
		logger.info("/search/history");
		Extagram extagram = userService.getExtraHistory(userNo);
	}
	
	@RequestMapping(value="/search/history", method=RequestMethod.POST)
	public void searchExtraHistory(int userNo, String search) {
		logger.info("/search/history");
		Extagram extagram = userService.searchExtraHistory(search, userNo);
	}
	
	@RequestMapping(value="/view/history", method=RequestMethod.POST)
	public void viewCommentHistory(int userNo) {
		logger.info("/search/history");
		ExComm exComm = userService.getHistory(userNo);
		
	}

	
	@RequestMapping(value="/search/history", method=RequestMethod.POST)
	public void searchCommentHistory(int userNo, String search) {
		logger.info("/search/history");
		Extagram extragram = userService.searchCommentHistory(search, userNo);
	}
}
