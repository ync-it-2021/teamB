package kr.ac.ync.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.ac.ync.domain.FAQVO;
import kr.ac.ync.mapper.FAQMapper;
import kr.ac.ync.mapper.NewsMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class FAQServiceImpl implements FAQService {
	private FAQMapper mapper;
	
	@Override
	public List<FAQVO> getFaqList() {
	 log.info("getList all");
		
	 return mapper.getFaqList();
	}

	@Override
	public FAQVO getFaqDetail(Long faq_num) {
		log.info("get faq : " + faq_num);

		return mapper.getFaqDetail(faq_num);
	}

	@Override
	public void registerFAQ(FAQVO faq) {
		log.info("reg_news : " + faq);

		mapper.insertSelectKey(faq);
	}

	@Override
	public boolean modfaq(FAQVO faq) {
		return mapper.update(faq) == 1;
	}

	@Override
	public boolean removefaq(Long faq_num) {
		log.info("delete faq : " + faq_num);

		return mapper.delete(faq_num) == 1;
	}

}
