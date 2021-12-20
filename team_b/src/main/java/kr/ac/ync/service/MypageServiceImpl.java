package kr.ac.ync.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.ync.domain.CartDTO;
import kr.ac.ync.domain.Criteria;
import kr.ac.ync.mapper.CartMapper;
import kr.ac.ync.mapper.MemberMapper;
import kr.ac.ync.mapper.MypageMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MypageServiceImpl implements MypageService{
	@Autowired
	private CartMapper cartMapper;
	@Autowired
	private MypageMapper mapper;
	
	@Override
	public List<CartDTO>getCartList(String USERID){
		
		List<CartDTO> cart = cartMapper.getCart(USERID);
		
		for(CartDTO dto : cart) {
			dto.initSaleTotal();
		}
		return cart;
		
	}

	@Override
	public int getCount(Criteria cri) {
		
		log.info("get total count");
		
		return mapper.getBoardCount(cri);
		
	}
}
