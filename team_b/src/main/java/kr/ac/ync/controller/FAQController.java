package kr.ac.ync.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.ync.domain.Criteria;
import kr.ac.ync.domain.FAQVO;
import kr.ac.ync.domain.NewsVO;
import kr.ac.ync.domain.PageDTO;
import kr.ac.ync.service.BoardService;
import kr.ac.ync.service.FAQService;
import kr.ac.ync.service.GameInfoService;
import kr.ac.ync.util.UploadUtils;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class FAQController {
	@Autowired
	private BoardService service;
	
	@Autowired
	private GameInfoService gs;	
	
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
		model.addAttribute("games", gs.getGamesList());
		model.addAttribute("genre", gs.getGenre());
		model.addAttribute("size", gs.getSizeSpec());
		
		return "/faq";
    }
	
	@GetMapping("/reg_faq")
	@PreAuthorize("isAuthenticated()")
	public void reg_faq(Model model) {
		
	}
	
	// 글 등록
		@PostMapping("/reg_faq")
		@PreAuthorize("isAuthenticated()")
		public String reg_faq(FAQVO faq, RedirectAttributes rttr) {
			
			log.info("register: " + faq);
			fs.registerFAQ(faq);
			rttr.addFlashAttribute("result", faq.getFaq_num());

			return "redirect:/faqlist";
		}
		
		@GetMapping({ "/mod_faq" })
		public void get(@RequestParam("faq_num") Long faq_num, @ModelAttribute("cri") Criteria cri, Model model) {

			log.info("/mod_faq");
			model.addAttribute("faq", fs.getFaqDetail(faq_num));
		}
		
		@PostMapping("/mod_faq")
		public String modfaq(FAQVO faq, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
			
			log.info("modnews:" + faq);
			
			if (fs.modfaq(faq)) {
				rttr.addFlashAttribute("result", "succeed");
			}

			return "redirect:/faqlist" + cri.getListLink();
		}
		
		@PostMapping("/removefaq")
		public String removefaq(@RequestParam("faq_num") Long faq_num, Criteria cri, RedirectAttributes rttr) {

			log.info("remove..." + faq_num);
			if (fs.removefaq(faq_num)) {
				rttr.addFlashAttribute("result", "success");
			}

			return "redirect:/faqlist" + cri.getListLink();
		}
}
