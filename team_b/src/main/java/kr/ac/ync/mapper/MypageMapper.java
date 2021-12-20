package kr.ac.ync.mapper;

import java.util.List;

import kr.ac.ync.domain.CartDTO;
import kr.ac.ync.domain.Criteria;
import kr.ac.ync.domain.MemberVO;

public interface MypageMapper {

	//장바구니 목록
	public List<CartDTO> getCart(String USERID);
	
	//회원정보
	public MemberVO read(String userid);
	
	//업로드한 게시물의 수
	public int getBoardCount(Criteria cri);
}
