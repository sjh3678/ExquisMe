package web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dto.Notice;
import web.service.face.NoticeService;
import web.util.PagingNotice;

@Controller
@RequestMapping(value="/admin/notice")
public class AdminNoticeController {

	@Autowired NoticeService noticeService;
	
	@RequestMapping(value="/list")
	public void noticeList(Model model, HttpServletRequest req) {
		
		//페이징
		PagingNotice paging = noticeService.getPaging(req);
		model.addAttribute("paging", paging);
		
		//전체 리스트 조회
		List<Notice> noticeList = noticeService.getNoticeList(paging);
		model.addAttribute("noticeList", noticeList);
		
		//paging.jsp에 쓰일 현재 URL
		model.addAttribute("linkUrl", "/admin/notice/list");
		
	}
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public void noticeWrite() {}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public void noticeWriteProc(Notice notice) {}
	
	@RequestMapping(value="/view")
	public void noticeView(Notice notice) {}
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public void noticeUpdate(Notice notice) {}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public void noticeUpdateProc(Notice notice) {}

	@RequestMapping(value="/delete")
	public void noticeDelete(Notice notice) {}
	
}
