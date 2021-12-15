package kr.ac.ync.controller;

import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ac.ync.domain.MemberVO;
import kr.ac.ync.service.MemberService;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/*")
public class MemberController {
	@Autowired
	private MemberService MemberService;
	
	//회원가입
	@GetMapping("/signup")
    public String signup(){
		
        return "signup";
    }
	
	@PostMapping("/signup")
	public String signup(MemberVO member) {
		BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
		member.setUserpw(scpwd.encode(member.getUserpw()));
//		log.warn(member.getUserName());
//		log.warn(member.getUserid());
//		log.warn(member.getUserpw());
//		log.warn(member.getUserPhone());
//		log.warn(member.getUserMail());
	
		
		MemberService.memberJoin(member);
		return "redirect:/";
	}
	
	@GetMapping("/login")
    public String login(){
		
        return "login";
    }

}
