package kr.ac.ync.service;

import org.springframework.beans.factory.annotation.Autowired;

import kr.ac.ync.domain.MemberVO;
import kr.ac.ync.mapper.MemberMapper;

public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberMapper mapper;
	
	@Override
	public void memberJoin(MemberVO member) {
		mapper.memberJoin(member);
	}

}
