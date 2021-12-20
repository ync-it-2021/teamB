package kr.ac.ync.controller;

import java.lang.ProcessBuilder.Redirect;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.ync.domain.Criteria;
import kr.ac.ync.domain.MemberVO;
import kr.ac.ync.domain.PageDTO;
import kr.ac.ync.security.domain.CustomUser;
import kr.ac.ync.service.CartService;
import kr.ac.ync.service.GameInfoService;
import kr.ac.ync.service.MemberService;

@Controller
public class MypageController {
	
	@Autowired
	private GameInfoService gs;
	
	@Autowired
	private CartService cartservice;
	
	@Autowired
	private MemberService memberservice;
	
	@RequestMapping(value = "user_detail/{userid}", method = RequestMethod.GET)
	@PreAuthorize("isAuthenticated()")
	public String member_detail(Model model, @PathVariable("userid") String userid) {
		
	//	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	
		model.addAttribute("sales",gs.getGamesListforSale());
		model.addAttribute("genre",gs.getGenre());
		model.addAttribute("size",gs.getSizeSpec());
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String name = auth.getName();
		
		model.addAttribute("username",name);
		model.addAttribute("member_info",memberservice.ReadMember(userid));
		
		return "/user_detail";
	}
	
	@GetMapping("/user_modify")
	public String member_modify(Model model) {
		Authentication ahAuthentication = SecurityContextHolder.getContext().getAuthentication();
		CustomUser USERID = (CustomUser) ahAuthentication.getPrincipal();
		model.addAttribute("member_info",memberservice.ReadMember(USERID.getUsername()));
		return "/user_modify";
	}
	
	@RequestMapping(value = "/user_modify", method = RequestMethod.POST)
	@PreAuthorize("isAuthenticated()")
	public String member_modify(MemberVO USERID, RedirectAttributes redirectAttrs, BindingResult result) {
		memberservice.modify(USERID);
		redirectAttrs.addFlashAttribute("result", USERID.getUserid());
		return "redirect:/user_detail";
	}
	
	@GetMapping("/user_cart")
	public String UserCart(@ModelAttribute("cri") Criteria cri, Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		CustomUser user = (CustomUser) authentication.getPrincipal();
		
		model.addAttribute("cart",cartservice.getCartList(user.getUsername()));
		int total = cartservice.getTotalCount(cri);
		model.addAttribute("pagemaker",new PageDTO(cri,total));
		return "user_cart";
	
	}
}