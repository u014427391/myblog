package net.myblog.web.controller.admin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.myblog.entity.FriendlyLink;
import net.myblog.service.FriendlyLinkService;
import net.myblog.web.controller.BaseController;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/link")
public class FriendlyLinkAdminController extends BaseController{
	
	@Autowired 
	FriendlyLinkService friendlyLinkService;
	
	@RequestMapping("/doLoadData")
	public String doLoadData(Model model){
		List<FriendlyLink> list = new ArrayList<FriendlyLink>();
		list = friendlyLinkService.findAll();
		model.addAttribute("links", list);
		return "admin/link/link_list";
	}
	
	@RequestMapping("/save")
	@ResponseBody
	public String saveL(HttpServletRequest request){
		FriendlyLink link = new FriendlyLink();
		String linkName = request.getParameter("linkName");
		String linkUrl = request.getParameter("linkUrl");
		link.setLinkName(linkName);
		link.setLinkUrl(linkUrl);
		JSONObject obj = new JSONObject();
		obj.put("", "");
		return obj.toString();
	}
	
	
	@RequestMapping("/edit")
	@ResponseBody
	public String editL(HttpServletRequest request){
		FriendlyLink link = new FriendlyLink();
		String linkId = request.getParameter("linkId");
		String linkName = request.getParameter("linkName");
		String linkUrl = request.getParameter("linkUrl");
		link.setLinkId(Integer.parseInt(linkId));
		link.setLinkName(linkName);
		link.setLinkUrl(linkUrl);
		int i = friendlyLinkService.updateLink(link);
		JSONObject obj = new JSONObject();
		obj.put("totalNum", i);
		return obj.toString();
	}
	
}
