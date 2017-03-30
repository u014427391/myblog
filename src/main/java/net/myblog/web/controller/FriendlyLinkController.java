package net.myblog.web.controller;

import java.util.ArrayList;
import java.util.List;

import net.myblog.entity.FriendlyLink;
import net.myblog.service.FriendlyLinkService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/link")
public class FriendlyLinkController extends BaseController{
	
	@Autowired 
	FriendlyLinkService friendlyLinkService;
	
	@RequestMapping("/doLoadData")
	public String doLoadData(Model model){
		List<FriendlyLink> list = new ArrayList<FriendlyLink>();
		list = friendlyLinkService.findAll();
		model.addAttribute("links", list);
		return "admin/link/link_list";
	}
	
}
