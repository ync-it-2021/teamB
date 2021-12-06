package kr.ac.ync.service;

import java.util.List;

import kr.ac.ync.domain.CartDTO;

public interface CartService {
	
	//장바구니 추가
	public int addCart(CartDTO cart);
	
	//장바구니 리스트
	public List<CartDTO> getCartList(String USERID);
	
	//장바구니 삭제
	public int deleteCart(int cart_num);

}
