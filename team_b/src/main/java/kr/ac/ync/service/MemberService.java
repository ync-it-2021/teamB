package kr.ac.ync.service;

import kr.ac.ync.domain.MemberVO;

public interface MemberService {
	//회원가입
	public void memberJoin(MemberVO member);
	
	public int idChk(MemberVO member);
	//회원정보
	public MemberVO ReadMember(String string);
	//회원정보 수정
	public void modify(MemberVO member);
}
