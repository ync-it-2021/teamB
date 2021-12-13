package kr.ac.ync.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.ync.domain.FAQVO;
import kr.ac.ync.domain.MemberVO;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {
	
//	@Autowired
//	private MemberService ms;

	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {

		log.info("access Denied : " + auth);

		model.addAttribute("msg", "Access Denied");
	}
	
	@GetMapping("/signup")
    public void signup(){
		
    }
	
//	@PostMapping("/signup")
//	@PreAuthorize("isAuthenticated()")
//	public String signup(MemberVO mem, RedirectAttributes rttr) {
//		
//		log.info("register: " + mem);
//		fs.signup(mem);
//		rttr.addFlashAttribute("result", mem.get());
//
//		return "redirect:/";
//	}

	@GetMapping("/customLogin")
	public void loginInput(String error, String logout, Model model) {

		log.info("error: " + error);
		log.info("logout: " + logout);

		if (error != null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}

		if (logout != null) {
			model.addAttribute("logout", "Logout!!");
		}
	}

	@GetMapping("/customLogout")
	public void logoutGET() {

		log.info("custom logout");
	}

	@PostMapping("/customLogout")
	public void logoutPost() {

		log.info("post custom logout");
	}
}
