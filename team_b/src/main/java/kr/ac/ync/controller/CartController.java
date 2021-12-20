package kr.ac.ync.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.ync.domain.CartDTO;
import kr.ac.ync.domain.MemberVO;
import kr.ac.ync.service.CartService;
import kr.ac.ync.service.GameInfoService;

@Controller
public class CartController {

	@Autowired
	private CartService cartService;
	
	@Autowired
	private GameInfoService gs;	
	
	@PostMapping("/detail")
	@PreAuthorize("isAuthenticated()")
	public String addCartPOST(CartDTO cart, HttpServletRequest request,Model model) {
		
		cartService.addCart(cart);
		return "redirect:/cart/" + cart.getUSERID();
	}
	
	@PostMapping("/cart/delete")
	public String deleteCart (CartDTO cart, @RequestParam("cart_num") Long cart_num) {
		cartService.deleteCart(cart_num);

		return "redirect:/cart/"+cart.getUSERID();
	}
	
	@GetMapping("/cart/{userid}")
	@PreAuthorize("isAuthenticated()")
	public String cartPageGET(@PathVariable("userid") String userid, Model model ) {
		model.addAttribute("sales", gs.getGamesListforSale());
		model.addAttribute("genre", gs.getGenre());
		model.addAttribute("size", gs.getSizeSpec());
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    String name = auth.getName(); //get logged in username
	    
	    model.addAttribute("username", name);
		
		model.addAttribute("cartInfo", cartService.getCartList(userid));
		int total = cartService.getTotal(userid);
		model.addAttribute("total", total);
		return "/cart";
	}
}
