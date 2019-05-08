package com.ms_prj.spring_mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IndexController {

	@RequestMapping(value="/", method=RequestMethod.GET)
	public String index_view() throws Exception {
		return "/index";
	}
	@RequestMapping(value="/intro", method=RequestMethod.GET)
	public String intro_view() throws Exception {
		return "/intro";
	}
	
}
