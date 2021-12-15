package kr.ac.ync.service;

import kr.ac.ync.domain.MemberVO;

public interface MemberService {
	
	// 글 상세보기
	public MemberVO getMember(String userid);
	
	public void memberJoin(MemberVO member);

	public int idChk(MemberVO mem);

}
