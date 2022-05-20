package capstone.rim.webb.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import capstone.rim.webb.model.Comment;
import capstone.rim.webb.model.Post;
import capstone.rim.webb.model.User;
import capstone.rim.webb.service.TakeService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	
	@Autowired
	private TakeService offerService;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest request) {

		List<Post> post = offerService.getPost();
		model.addAttribute("post", post);
		
		//전송으로 검색 키워드 받아오기
				String table = request.getParameter("table");
				String search = request.getParameter("search");

				if("search" != null) {
					List<Post> post1 = offerService.getPost_search(table, search);
					model.addAttribute("post1", post1);
					model.addAttribute("table", table);
				}
		return "home";
	}
	
}
