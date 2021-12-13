package kr.ac.ync.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.ac.ync.domain.MemberVO;
import kr.ac.ync.service.MemberService;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
public class CommonController {
	
	@Autowired
	private MemberService ms;
	
	@Autowired
	BCryptPasswordEncoder pwen;

	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {

		log.info("access Denied : " + auth);

		model.addAttribute("msg", "Access Denied");
	}
	
	@GetMapping("/signup")
    public void signup(){
		
    }
	
	@PostMapping("/signup")
	public String signup(MemberVO member) {
				log.info("sign up");
//				String inputPass = mem.getUserpw();
//				String pass = pwen.encode(inputPass);
//				mem.setUserpw(pass);
				ms.memberJoin(member);

		return "redirect:/login";
	}
	
//	@ResponseBody
//	@RequestMapping(value="/idChk", method = RequestMethod.POST)
//	public int idChk(MemberVO mem) throws Exception {
//		int result = ms.idChk(mem);
//		return result;
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
	
	@GetMapping("/login")
	public void FrontLoginInput(String error, String logout, Model model) {

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
