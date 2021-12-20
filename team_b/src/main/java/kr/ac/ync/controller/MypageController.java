	package kr.ac.ync.controller;

import java.lang.ProcessBuilder.Redirect;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.ac.ync.domain.MemberVO;
import kr.ac.ync.security.domain.CustomUser;
import kr.ac.ync.service.CartService;
import kr.ac.ync.service.MemberService;

@Controller
public class MypageController {
	
	@Autowired
	private CartService cartservice;
	
	@Autowired
	private MemberService memberservice;
	
	@GetMapping("/user_detail")
	public String member_detail(Model model) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		CustomUser userid = (CustomUser) authentication.getPrincipal();
		
		model.addAttribute("memeber_info",memberservice.ReadMember(userid.getUsername()));
		
		return "";
	}
	@PostMapping("/user_modify")
	@PreAuthorize("isAuthenticated()")
	public String member_modify(MemberVO USERID,Redirect rttr) {
		memberservice.modify(USERID);
		rttr.addFlashAttribute("result", USERID.getUserid());
		return  null;
	}
}
