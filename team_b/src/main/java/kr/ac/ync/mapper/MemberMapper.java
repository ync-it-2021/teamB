package kr.ac.ync.mapper;

import kr.ac.ync.domain.MemberVO;

public interface MemberMapper {

	public MemberVO read(String userid);
	
	public void memberJoin(MemberVO member);

	public int idChk(MemberVO member);
}
