package web.controller;

import java.util.List;

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
import web.util.UserSHA256;

@Controller
@RequestMapping(value="/user")
public class UserController {
		
	private Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired UserService userService;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void login() {
		logger.info("/login [GET]");
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginProc( User user, HttpSession session){
		logger.info("/login [POST]");
		
		//비밀번호 암호화
		String encPw = UserSHA256.encrypt(user);
		
		user.setPw(encPw);
		
		boolean isLogin = userService.getLoginCheck(user);
		
		if(isLogin) {
			
			user = userService.getUserInfo(user);
			
			session.setAttribute("login", isLogin);
			session.setAttribute("nick", user.getNick() );
			session.setAttribute("userNo", user.getUserNo() );
			
			return "redirect:/user/main";
		}else {
			return "redirect:/user/login";
		}
		
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		logger.info("/logout");
		session.invalidate();
		
		return "redirect:/user/main";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public void join() {
		logger.info("/join [GET]");
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinProc(User user, String pwCheck) {
		logger.info("/join [POST]");
		if(user.getPw().equals(pwCheck)) {
			String encPw = UserSHA256.encrypt(user);
			user.setPw(encPw);
			boolean isJoin = userService.getJoinCheck(user);
			if(isJoin) {
				return "redirect:/user/main";	
			}else {
				return "redirect:/user/join";
			}
		}else {
			//회원가입 페이지 리다이렉트
			return "redirect:/user/join";
		}
		
	}
	
	//이거도 아직...
	@RequestMapping(value="/social/join", method=RequestMethod.GET)
	public String socialJoin(SocialAccount social) {
		logger.info("/social/join");
		return null;
	}
	
	//이거 모름....
	@RequestMapping(value="/social/join", method=RequestMethod.POST)
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
		
		int userno = 0;
		
		boolean pwCheck = userService.getCheckPassword(pwSalt, userno);
	}
	
	@RequestMapping(value="/pw/update", method=RequestMethod.GET)
	public void pwUpdate() {
		logger.info("/pw/update [GET]");
	}
	
	@RequestMapping(value="/pw/update", method=RequestMethod.POST)
	public String pwUpdateProc(String pw, String pwChk, HttpSession session) {
		logger.info("/pw/update [POST]");
		int userno = 0;
		
		String pwSalt = pw;
		String pwChkSalt = pwChk;
		
		boolean isUpdate = userService.setUpdatePw(pwSalt, pwChkSalt, userno);
		
		return null;
	}
	
	@RequestMapping(value="/delete")
	public void userDelete(int userno) {
		logger.info("/delete [GET]");
		userService.deleteUser(userno);
	}
	
	@RequestMapping(value="/view/extagram/history", method=RequestMethod.GET)
	public void viewExtraHistory(int userNo) {
		logger.info("/search/history [GET]");
		List<Extagram> extagram = userService.getExtaHistory(userNo);
		
	}
	
	@RequestMapping(value="/search/extagram/history", method=RequestMethod.POST)
	public void searchExtaHistory(int userNo, String search) {
		logger.info("/search/history [POST]");
		List<Extagram> extagram = userService.searchExtaHistory(search, userNo);
	}
	
	@RequestMapping(value="/view/comment/history", method=RequestMethod.GET)
	public void viewCommentHistory(int userNo) {
		logger.info("/search/history [GET]");
		List<ExComm> exComm = userService.getHistory(userNo);
		
	}

	
	@RequestMapping(value="/search/comment/history", method=RequestMethod.POST)
	public void searchCommentHistory(int userNo, String search) {
		logger.info("/search/history [POST]");
		List<ExComm> exComm = userService.searchCommentHistory(search, userNo);
	}
	@RequestMapping(value="/main")
	public void main() {
		logger.info("임시 메인 페이지 접속");
	}
}
