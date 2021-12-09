package kr.ac.ync.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.ac.ync.domain.Criteria;
import kr.ac.ync.domain.PageDTO;
import kr.ac.ync.service.BoardService;
import kr.ac.ync.service.FAQService;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class FAQController {
	@Autowired
	private BoardService service;
	
	@Autowired
	private FAQService fs;
	
	@GetMapping("/faqlist")
	public void newslist(Criteria cri, Model model) {
		log.info("faqlist: " + cri);
//		model.addAttribute("pageMaker", new PageDTO(cri, 123));
		
		// 게시판의 글은 지속적으로 등록, 삭제 되기에 매번 list를 호출 할때 total을 구해와야 한다. 
		int total = service.getTotal(cri);
		log.info("total: " + total);
		model.addAttribute("list", service.getListWithPaging(cri));
		model.addAttribute("faq", fs.getFaqList());
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping("/faq")
    public String news(Model model){
		log.info("index of faq");
		model.addAttribute("faq", fs.getFaqList());
		
		return "/faq";
    }
}
