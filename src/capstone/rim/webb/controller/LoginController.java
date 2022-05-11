package capstone.rim.webb.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Locale locale, @RequestParam(value="error", required=false) 
	String error, Model model) {		
		if(error != null) {
		    model.addAttribute("errorMsg", "Invalid username and password");
		    
		 }
		logger.info("home/login");
		
		
		return "login";
	}
}