package kr.ac.ync.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.ync.domain.BoardVO;
import kr.ac.ync.domain.Criteria;
import kr.ac.ync.domain.GameInfoVO;
import kr.ac.ync.domain.MemberVO;
import kr.ac.ync.domain.PageDTO;
import kr.ac.ync.service.BoardService;
import kr.ac.ync.service.GameInfoService;
import kr.ac.ync.service.NewsService;
import kr.ac.ync.util.UploadUtils;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/*")
public class BoardController {

	@Value("${globalConfig.uploadPath}")
	private String uploadPath;
	
	@Autowired
	private BoardService service;
	
	@Autowired
	private GameInfoService gs;	
	
	@Autowired
	private NewsService ns;
	
	@GetMapping(value = "/*")
    public String shop(Model model){
		log.info("index");
		model.addAttribute("sales", gs.getGamesListforSale());
		model.addAttribute("news", gs.getGamesListforNew());
		model.addAttribute("genre", gs.getGenre());
		model.addAttribute("size", gs.getSizeSpec());
		
		return "/board/index";
    }
	
	@GetMapping(value = "/sales")
    public String sales(Model model){
		model.addAttribute("sales", gs.getGamesListforSale());
		model.addAttribute("genre", gs.getGenre());
		model.addAttribute("size", gs.getSizeSpec());
		
		return "/search/sales";
    }
	
	@GetMapping(value = "/recent")
    public String recent(Model model){
		model.addAttribute("recent", gs.getGamesListforNew());
		model.addAttribute("genre", gs.getGenre());
		model.addAttribute("size", gs.getSizeSpec());
		
		return "/search/recent";
    }
	
	@GetMapping("/detail")
	public void getDetail(@RequestParam("game_num") Long game_num, Model model) {
		log.info("/detail");
		model.addAttribute("games", gs.getDetail(game_num));
		model.addAttribute("genre", gs.getGenre());
		model.addAttribute("size", gs.getSizeSpec());
	}
	
	
	@GetMapping("/signup")
    public String signup(){
		
        return "signup";
    }
	@GetMapping("/login")
    public String login(){
		
        return "login";
    }

	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public void register(Model model) {
		model.addAttribute("genre", gs.getGenre());
		model.addAttribute("size", gs.getSizeSpec());
	}

	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		log.info("list: " + cri);
//		model.addAttribute("pageMaker", new PageDTO(cri, 123));
		
		// 게시판의 글은 지속적으로 등록, 삭제 되기에 매번 list를 호출 할때 total을 구해와야 한다. 
		int total = service.getTotal(cri);
		log.info("total: " + total);
		model.addAttribute("list", service.getListWithPaging(cri));
		model.addAttribute("games", gs.getGamesList());
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
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
	
//	// 글 등록
//	// file upload가 추가된 게시판 등록
//	@PostMapping("/register")
//	@PreAuthorize("isAuthenticated()")
//	public String register(MultipartFile[] uploadFile, BoardVO board, RedirectAttributes rttr) {
//		
//		int index = 0;
//		for (MultipartFile multipartFile : uploadFile) {
//			if(multipartFile.getSize() > 0) {
//				switch (index) {
//				case 0:
//					board.setFile_1(UploadUtils.uploadFormPost(multipartFile, uploadPath));
//					break;
//				case 1:
//					board.setFile_2(UploadUtils.uploadFormPost(multipartFile, uploadPath));
//					break;
//				default:
//					board.setFile_3(UploadUtils.uploadFormPost(multipartFile, uploadPath));
//					break;
//				}
//			}
//			index++;
//		}
//		
//		log.info("register: " + board);
//		service.register(board);
//		rttr.addFlashAttribute("result", board.getBno());
//
//		return "redirect:/board/list";
//	}
	
	// 글 등록
	// file upload가 추가된 게시판 등록
	@PostMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public String register(MultipartFile[] uploadFile, GameInfoVO games, RedirectAttributes rttr) {
		
		int index = 0;
		for (MultipartFile multipartFile : uploadFile) {
			if(multipartFile.getSize() > 0) {
				switch (index) {
				case 0:
					games.setFile_1(UploadUtils.uploadFormPost(multipartFile, uploadPath));
					break;
				case 1:
					games.setFile_2(UploadUtils.uploadFormPost(multipartFile, uploadPath));
					break;
				default:
					games.setFile_3(UploadUtils.uploadFormPost(multipartFile, uploadPath));
					break;
				}
			}
			index++;
		}
		
		log.info("register: " + games);
		gs.registerGame(games);
		rttr.addFlashAttribute("result", games.getGame_num());

		return "redirect:/list";
	}

	// @ModelAttribute 는 model.addAttribute("cri", cri) 해주는거와 동일하다.
	@GetMapping({ "/get", "/modify" })
	public void get(@RequestParam("game_num") Long game_num, @ModelAttribute("cri") Criteria cri, Model model) {

		log.info("/get or modify");
		model.addAttribute("games", gs.getDetail(game_num));
		model.addAttribute("genre", gs.getGenre());
		model.addAttribute("size", gs.getSizeSpec());
	}
	
	@PostMapping("/modify")
	public String modify(MultipartFile[] uploadFile, GameInfoVO games, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		int index = 0;
		for (MultipartFile multipartFile : uploadFile) {
			// 실제로 upload된 file이 있을때만 upload 시킨다.
			if (multipartFile.getSize() > 0) {
				switch (index) {
				case 0:
					games.setFile_1(UploadUtils.uploadFormPost(multipartFile, uploadPath));
					break;
				case 1:
					games.setFile_2(UploadUtils.uploadFormPost(multipartFile, uploadPath));
					break;
				default:
					games.setFile_3(UploadUtils.uploadFormPost(multipartFile, uploadPath));
					break;
				}
			}
			index++;
		}
		
		log.info("modify:" + games);
		
		if (gs.modify(games)) {
			rttr.addFlashAttribute("result", "succeed");
		}

		return "redirect:/list" + cri.getListLink();
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("game_num") Long game_num, Criteria cri, RedirectAttributes rttr) {

		log.info("remove..." + game_num);
		if (gs.remove(game_num)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/list" + cri.getListLink();
	}
	
	@GetMapping("/search")
	public String search(Criteria cri, Model model, @RequestParam(value = "keyword", required=false) String keyword) {
		//int Total = gs.getTotal(cri);	
		model.addAttribute("games", gs.getGamesSearch(keyword));
		model.addAttribute("genre", gs.getGenre());
		model.addAttribute("size", gs.getSizeSpec());
			return "/search/search";
	}
	
	@GetMapping("/genre")
	public String genre(Criteria cri, Model model, @RequestParam(value = "keyword", required=false) String keyword) {
		//int Total = gs.getTotal(cri);	
		model.addAttribute("games", gs.searchGenre(keyword));
		model.addAttribute("genre", gs.getGenre());
		model.addAttribute("size", gs.getSizeSpec());
			return "/search/genre";
	}
	
	@GetMapping("/size")
	public String size(Criteria cri, Model model, @RequestParam(value = "keyword", required=false) String keyword) {
		//int Total = gs.getTotal(cri);	
		model.addAttribute("games", gs.searchSize(keyword));
		model.addAttribute("genre", gs.getGenre());
		model.addAttribute("size", gs.getSizeSpec());
			return "/search/size";
	}
}
