package net.myblog.web.controller;

import javax.annotation.Resource;

import net.myblog.service.FriendlyLinkService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(name="/link")
public class FriendlyLinkController extends BaseController{
	
	@Autowired 
	FriendlyLinkService friendlyLinkService;
	

}
