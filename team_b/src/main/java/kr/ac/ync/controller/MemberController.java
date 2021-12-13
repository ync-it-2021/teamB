package kr.ac.ync.controller;

import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ac.ync.domain.MemberVO;
import kr.ac.ync.service.MemberService;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MemberController {

//	@Autowired
//	private MemberService MemberService;
	//회원가입
//	@RequestMapping(value = "join", method =RequestMethod.POST)
//	public String joinPOST(MemberVO member) {
//		logger.info("join 진입");
//		
//		//회원가입 서비스 실행
//		memberservice.memberJoin(member);
//		
//		logger.info("join Service 성공");
//		
//		return "redirect:/index";
//		
//	}
	
//	@GetMapping("/signup")
//    public String signup(){
//		
//        return "signup";
//    }
	
	/*
	 * @GetMapping("/login") public void loginInput(String error, String logout,
	 * Model model) {
	 * 
	 * log.info("error: " + error); log.info("logout: " + logout);
	 * 
	 * if (error != null) { model.addAttribute("error",
	 * "Login Error Check Your Account"); }
	 * 
	 * if (logout != null) { model.addAttribute("logout", "Logout!!"); } }
	 * 
	 * @GetMapping("/logout") public void logoutGET() {
	 * 
	 * log.info("custom logout"); }
	 * 
	 * @PostMapping("/logout") public void logoutPost() {
	 * 
	 * log.info("post custom logout"); }
	 */
}
