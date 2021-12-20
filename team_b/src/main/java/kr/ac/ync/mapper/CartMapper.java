package kr.ac.ync.mapper;

import java.util.List;

import kr.ac.ync.domain.CartDTO;
import kr.ac.ync.domain.Criteria;

public interface CartMapper {

	public int addCart(CartDTO cart);
	
	public boolean deleteCart(Long cart_num); //삭제
	
	public List<CartDTO> getCart(String USERID);
	
	public CartDTO checkCart(CartDTO cart);
	
	public int getTotal(String USERID);
	
	public int getTotalCount(Criteria cri);
	
}
