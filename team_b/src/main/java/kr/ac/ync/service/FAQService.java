package kr.ac.ync.service;

import java.util.List;

import kr.ac.ync.domain.FAQVO;

public interface FAQService {
	public List<FAQVO> getFaqList();
	
	public FAQVO getFaqDetail(Long faq_num);

		//등록
	public void registerFAQ(FAQVO faq);

	public boolean modfaq(FAQVO faq);
	
	public boolean removefaq(Long faq_num);
}
