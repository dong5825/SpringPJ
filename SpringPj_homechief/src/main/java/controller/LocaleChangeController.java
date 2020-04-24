package controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.LocaleResolver;


@Controller
public class LocaleChangeController {
	@Autowired
	private LocaleResolver localeResolver;
	
	@RequestMapping("/changeLanguage")
	public String change(@RequestParam("lang") String language, HttpServletRequest request,HttpServletResponse response){
		Locale locale=new Locale(language);
		localeResolver.setLocale(request, response, locale);
		String redirectURL="redirect:"+request.getHeader("referer");
	/*	String redirectURL2="redirect:"+request.getServletPath();
		System.out.println(request.getRequestURI());*/
		//return redirectURL;
		
		return redirectURL;
		
		
	}
	public void setLocaleResolver(LocaleResolver localeResolver){
		this.localeResolver=localeResolver;
	}
}
