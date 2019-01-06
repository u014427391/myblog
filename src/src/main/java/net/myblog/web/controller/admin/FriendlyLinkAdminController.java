package net.myblog.web.controller.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.myblog.entity.FriendlyLink;
import net.myblog.service.FriendlyLinkService;
import net.myblog.web.controller.BaseController;


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
	public Map<String,String> saveL(HttpServletRequest request){
		Map<String,String> result = new HashMap<String,String>(16);
		FriendlyLink link = new FriendlyLink();
		String linkName = request.getParameter("linkName");
		String linkUrl = request.getParameter("linkUrl");
		link.setLinkName(linkName);
		link.setLinkUrl(linkUrl);
		boolean flag = friendlyLinkService.saveLink(link);
		if(flag){
			result.put("result", "success");
		}else{
			result.put("result", "error");
		}
		return result;
	}
	
	/**
	 * 编辑友情链接信息
	 * @param request
	 * @return
	 */
	@RequestMapping("/edit")
	@ResponseBody
	public Map<String,Object> editL(HttpServletRequest request){
		FriendlyLink link = new FriendlyLink();
		String linkId = request.getParameter("linkId");
		String linkName = request.getParameter("linkName");
		String linkUrl = request.getParameter("linkUrl");
		link.setLinkId(Integer.parseInt(linkId));
		link.setLinkName(linkName);
		link.setLinkUrl(linkUrl);
		int i = friendlyLinkService.updateLink(link);
		Map<String,Object> result = new HashMap<String,Object>(16);
		result.put("totalNum", i);
		return result;
	}
	
}
