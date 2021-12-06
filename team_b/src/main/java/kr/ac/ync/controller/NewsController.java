package kr.ac.ync.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.ync.domain.Criteria;
import kr.ac.ync.domain.GameInfoVO;
import kr.ac.ync.domain.NewsVO;
import kr.ac.ync.domain.PageDTO;
import kr.ac.ync.service.BoardService;
import kr.ac.ync.service.NewsService;
import kr.ac.ync.util.UploadUtils;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class NewsController {
	@Value("${globalConfig.uploadPath}")
	private String uploadPath;
	
	@Autowired
	private BoardService service;
	
	@Autowired
	private NewsService ns;
	
	@GetMapping("/newslist")
	public void newslist(Criteria cri, Model model) {
		log.info("newslist: " + cri);
//		model.addAttribute("pageMaker", new PageDTO(cri, 123));
		
		// 게시판의 글은 지속적으로 등록, 삭제 되기에 매번 list를 호출 할때 total을 구해와야 한다. 
		int total = service.getTotal(cri);
		log.info("total: " + total);
		model.addAttribute("list", service.getListWithPaging(cri));
		model.addAttribute("news", ns.getNewsList());
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping("/news")
    public String news(Model model){
		log.info("index");
		model.addAttribute("news", ns.getNewsList());
		
		return "/news";
    }
	
	@GetMapping("/reg_news")
	@PreAuthorize("isAuthenticated()")
	public void reg_news(Model model) {
		
	}
	
	// 글 등록
		// file upload가 추가된 게시판 등록
		@PostMapping("/reg_news")
		@PreAuthorize("isAuthenticated()")
		public String reg_news(MultipartFile[] uploadFile, NewsVO news, RedirectAttributes rttr) {
			
			int index = 0;
			for (MultipartFile multipartFile : uploadFile) {
				if(multipartFile.getSize() > 0) {
					switch (index) {
					case 0:
						news.setFile_1(UploadUtils.uploadFormPost(multipartFile, uploadPath));
						break;
					case 1:
						news.setFile_2(UploadUtils.uploadFormPost(multipartFile, uploadPath));
						break;
					default:
						news.setFile_3(UploadUtils.uploadFormPost(multipartFile, uploadPath));
						break;
					}
				}
				index++;
			}
			
			log.info("register: " + news);
			ns.registerNews(news);
			rttr.addFlashAttribute("result", news.getNews_num());

			return "redirect:/newslist";
		}
}
