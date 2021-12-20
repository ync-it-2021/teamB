package kr.ac.ync.service;

import org.springframework.stereotype.Service;

import kr.ac.ync.domain.MemberVO;
import kr.ac.ync.mapper.FAQMapper;
import kr.ac.ync.mapper.MemberMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService{
	MemberMapper mapper;
	
	@Override
	public void memberJoin(MemberVO member) {
		mapper.memberJoin(member);
	}

	@Override
	public int idChk(MemberVO member) {
		return mapper.idChk(member);
	}
	
	@Override
	public MemberVO ReadMember(String USERID) {
		return mapper.read(USERID);
	}

	
	@Override
	public void modify(MemberVO member) {
		
	}
}
