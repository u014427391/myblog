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
	
	/**
	 * 获取所有友情链接信息
	 * @param model
	 * @return
	 */
	@RequestMapping("/doLoadData")
	public String doLoadData(Model model){
		List<FriendlyLink> list = new ArrayList<FriendlyLink>();
		list = friendlyLinkService.findAll();
		model.addAttribute("links", list);
		return "admin/link/link_list";
	}
	
	/**
	 * 保存友情链接信息
	 * @param request
	 * @return
	 */
	@RequestMapping("/save")
	@ResponseBody
	public String saveL(HttpServletRequest request){
		JSONObject obj = new JSONObject();
		FriendlyLink link = new FriendlyLink();
		String linkName = request.getParameter("linkName");
		String linkUrl = request.getParameter("linkUrl");
		link.setLinkName(linkName);
		link.setLinkUrl(linkUrl);
		boolean flag = friendlyLinkService.saveLink(link);
		if(flag){
			obj.put("result", "success");
		}else{
			obj.put("result", "error");
		}
		return obj.toString();
	}
	
	/**
	 * 编辑友情链接信息
	 * @param request
	 * @return
	 */
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
