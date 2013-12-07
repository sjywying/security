package com.crazy.pss.xss.controller;

import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import antlr.Utils;

import com.crazy.pss.common.config.GlobalConfiguration;
import com.crazy.pss.common.utils.Constants;
import com.crazy.pss.common.web.BaseController;

@Controller("xssController")
@RequestMapping("xss")
public class XSSController extends BaseController{

	@RequestMapping("non-persisent")
	public String login(Model model, String name){
		model.addAttribute("escapeName", StringEscapeUtils.escapeHtml4(name));
		model.addAttribute("name", name);
		model.addAttribute("replacename", name.replace("<script>", ""));
		return "xss/non-persisent";
	}
}
