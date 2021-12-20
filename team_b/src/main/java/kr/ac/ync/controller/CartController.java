package kr.ac.ync.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	@PostMapping("/cart/add")
	@ResponseBody
	public String addCartPOST(CartDTO cart, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		if(mvo == null) {
			return "";
		}
		
		int result =  cartService.addCart(cart);
		
		return result + "";
	}
	
//	@GetMapping("/cart/{USERID}")
//	public String cartPageGET (@PathVariable("USERID") String userId, Model model) {
//		model.addAttribute("cartInfo",cartService.getCartList(userId));
//		
//		return "/cart";
//	}
	
//	@GetMapping("/cart")
//    public String cart(Model model){
//		model.addAttribute("sales", gs.getGamesListforSale());
//		model.addAttribute("genre", gs.getGenre());
//		model.addAttribute("size", gs.getSizeSpec());
//		
//        return "cart";
//    }
//	
	@PostMapping("/cart/delete")
	public String deleteCart (CartDTO cart) {
		cartService.deleteCart(cart.getCart_num());
		
		return "redirect:/cart/"+cart.getUSERID();
	}//
	
	@GetMapping("/cart/{userid}")
	public String cartPageGET(@PathVariable("userid") String userid, Model model ) {
		model.addAttribute("sales", gs.getGamesListforSale());
		model.addAttribute("genre", gs.getGenre());
		model.addAttribute("size", gs.getSizeSpec());
		
		model.addAttribute("cartInfo", cartService.getCartList(userid));
		int total = cartService.getTotal(userid);
		model.addAttribute("total", total);
		return "/cart";
	}
}
