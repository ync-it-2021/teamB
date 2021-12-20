package kr.ac.ync.mapper;

import kr.ac.ync.domain.MemberVO;

public interface MemberMapper {
	//회원정보
	public MemberVO read(String userid);
	//회원가입
	public void memberJoin(MemberVO member);
	
	public int idChk(MemberVO member);
	
	//회원정보 수정
	public int update(MemberVO memeber);
	
	//회원 탈퇴
	public int delete(String userid);
}
