package kr.ac.ync.service;

import java.util.List;

import kr.ac.ync.domain.CartDTO;
import kr.ac.ync.domain.Criteria;

public interface MypageService {
	
	public int getCount (Criteria cri);
	
	public List<CartDTO> getCartList(String USERID);

}
