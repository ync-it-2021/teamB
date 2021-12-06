package kr.ac.ync.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.ync.domain.CartDTO;
import kr.ac.ync.mapper.CartMapper;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private CartMapper cartMapper;

	@Override
	public int addCart(CartDTO cart) {

		CartDTO checkCart = cartMapper.checkCart(cart);
		if (checkCart != null) {
			return 2;
		}
		try {
			return cartMapper.addCart(cart);
		} catch (Exception e) {
			return 0;
		}
	}
	
	@Override
	public List<CartDTO>getCartList(String USERID){
		
		List<CartDTO> cart = cartMapper.getCart(USERID);
		
		for(CartDTO dto : cart) {
			dto.initSaleTotal();
		}
		return cart;
		
	}
}