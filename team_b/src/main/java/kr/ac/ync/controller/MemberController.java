package kr.ac.ync.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ac.ync.domain.MemberVO;
import kr.ac.ync.service.MemberService;

public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	private MemberService memberservice;
	//회원가입
	@RequestMapping(value = "join", method =RequestMethod.POST)
	public String joinPOST(MemberVO member) {
		logger.info("join 진입");
		
		//회원가입 서비스 실행
		memberservice.memberJoin(member);
		
		logger.info("join Service 성공");
		
		return "redirect:/index";
		
	}

}
