package kr.ac.ync.service;

import kr.ac.ync.domain.MemberVO;

public interface MemberService {
	
	public void memberJoin(MemberVO member);

	public int idChk(MemberVO mem);

}
