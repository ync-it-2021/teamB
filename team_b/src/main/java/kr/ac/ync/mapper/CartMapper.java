package kr.ac.ync.mapper;

import java.util.List;

import kr.ac.ync.domain.CartDTO;

public interface CartMapper {

	public int addCart(CartDTO cart);
	
	public int deleteCart(int cart_num);
	
	public List<CartDTO> getCart(String USERID);
	
	public CartDTO checkCart(CartDTO cart);
	
	public int getTotal(String USERID);
	
	
}
