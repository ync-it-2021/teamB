package kr.ac.ync.mapper;

import java.util.List;

import kr.ac.ync.domain.FAQVO;

public interface FAQMapper {
	List<FAQVO> getFaqList();

	public FAQVO getFaqDetail(Long faq_num);
	
	public void insert(FAQVO faq);

	public Integer insertSelectKey(FAQVO faq);

	public int update(FAQVO faq);
	
	public int delete(Long faq_num);
}
