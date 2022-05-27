package capstone.rim.webb.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import capstone.rim.webb.model.Post;
import capstone.rim.webb.model.User;
import capstone.rim.webb.model.Medilist;
import capstone.rim.webb.service.TakeService;
import capstone.rim.webb.model.Authorities;
import capstone.rim.webb.model.Board;
import capstone.rim.webb.model.Comment;
import capstone.rim.webb.model.Medi;

@Controller
public class OfferController {
	
	@Autowired
	private TakeService takeService;
	
	private static final Logger logger = LoggerFactory.getLogger(OfferController.class);

	
	@RequestMapping(value = "/signup")
	public String signup(Locale locale, Model model) {
		
		
		logger.info("home/signup");
		model.addAttribute("user", new User());
		
		return "signup";
	}
	
	@RequestMapping(value = "/suc_signup")
	public String new_member(Model model, @Validated User user, BindingResult result,
			@RequestParam("user_id") String user_id, Authorities auth) {
		
		logger.info("home/suc_signup");
		
		if(result.hasErrors()) {
			//Error발생 시 수행되는 부분
			
			System.out.println("===Form data does not validated===");
			List<ObjectError> errors = result.getAllErrors();
			
			for(ObjectError error: errors) {
				System.out.println(error.getDefaultMessage());
			}
			return "signup"; //error발생하면 다시 사용자 입력 페이지로 돌려보내기
		}
		
		takeService.insertUser(user);
		takeService.insertUserAuth( user_id , auth);
		
		return "suc_signup";
	}
	
	@RequestMapping(value = "/postform")
	public String postform(Model model) {
		
		logger.info("home/postform");
		
		model.addAttribute("post", new Post());
		
		
		return "postform";
	}
	
	@RequestMapping(value = "/suc_post")
	public String suc_post(Model model, @Validated Post post, BindingResult result) {
		
		logger.info("home/suc_post");
		
			if(result.hasErrors()) {
			//Error발생 시 수행되는 부분
			
			System.out.println("===Form data does not validated===");
			List<ObjectError> errors = result.getAllErrors();
			
			for(ObjectError error: errors) {
				System.out.println(error.getDefaultMessage());
			}
			return "postform"; //error발생하면 다시 사용자 입력 페이지로 돌려보내기
			}
			
		System.out.println(post);
		takeService.insertPost(post);
		
		return "suc_post";
	}
	
	@RequestMapping("/viewBoard")
	public String viewBoard(Model model, @RequestParam("board") int board_title, HttpServletRequest request) {

		List<Post> post = takeService.getPost_board(board_title);
		model.addAttribute("post", post);
		
		model.addAttribute("board", board_title);
		
		logger.info("home/viewBoard");
		//전송으로 검색 키워드 받아오기
		String table = request.getParameter("table");
		String search = request.getParameter("search");

		if("search" != null) {
			List<Post> post1 = takeService.getPost_search(table, search);
			model.addAttribute("post1", post1);
			model.addAttribute("table", table);
		}
		

		return "viewBoard";
	}
	
	@GetMapping("/viewPost")
	public String viewPost(Model model, @RequestParam("post_id") int post_id) {
		
		logger.info("home/viewpost");
		
		
		logger.info("param: {}",post_id);
		
		List<Post> post = takeService.getPost_one(post_id);
		model.addAttribute("post", post);
		
		List<Comment> comment = takeService.getComment(post_id);
		model.addAttribute("comment", comment);
				
		model.addAttribute("new_comment", new Comment());
		
		return "viewPost";
	}
	
	@RequestMapping(value = "/suc_comment")
	public String suc_comment(Model model, @Validated Comment comment,
		BindingResult result, @RequestParam("post_id") int post_id) {
		
		takeService.insertComment(comment);	
		return "suc_comment";
	}
	
	@RequestMapping("editPost")
	public String editPost(Model model, @RequestParam("post_id") int post_id) {
		
		logger.info("home/editPost");
		
		List<Post> post = takeService.getPost_one(post_id);
		model.addAttribute("post1", post );
		
		model.addAttribute("post", new Post() );

		
		return "editPost";
	}
	@RequestMapping("suc_edit")
	public String suc_edit(Model model,Post post) {
		
		logger.info("home/suc_edit");
		
		System.out.println(post);
		takeService.updatePost(post);
		
		return "suc_edit";
	}
	@RequestMapping("suc_del")
	public String suc_del(Model model,@RequestParam("post_id") int post_id) {
		
		logger.info("home/suc_del");
		
		takeService.deletePost(post_id);
		
		return "suc_del";
	}
	
	@RequestMapping("del_comment")
	public String del_comment(Model model, @RequestParam("comment_id") int comment_id) {
		
		logger.info("home/suc_del_comment");
		
		takeService.deleteComment(comment_id);
		
		return "suc_del_comment";
	}
	
	@RequestMapping("manage")
	public String manage(Model model, @RequestParam("user_id") String user_id) {
		
		logger.info("home/magage");
		
		List<Medi> medi = takeService.getMedi();
		model.addAttribute("medi1", medi);
		
		model.addAttribute("medi", new Medi());
		
		List<Medilist> medilist = takeService.getMediList();
		model.addAttribute("medilist", medilist);
		
		return "manage";
	}
	@RequestMapping("suc_medi")
	public String suc_medi(Model model, Medi medi) {
		
		logger.info("home/suc_medi");
		takeService.insertMedi(medi);	
		
		return "suc_medi";
	}
	
	@RequestMapping(value = "/error", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public String error(Locale locale, Model model) {
		
		logger.info("home/error");
		
		return "error";
	}
	
	@RequestMapping(value="del_medi")
	public String del_medi(Model model, @RequestParam("medi_id") int medi_id,
		@RequestParam("user_id") String user_id) {
		
		logger.info("home/suc_del_manage");
		
		takeService.deleteMedi(user_id, medi_id);
		return "suc_del_manage";
	}
	
}
