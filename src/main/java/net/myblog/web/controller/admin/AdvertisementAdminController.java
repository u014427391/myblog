package net.myblog.web.controller.admin;

import java.util.List;

import net.myblog.entity.Advertisement;
import net.myblog.service.AdvertisementService;
import net.myblog.web.controller.BaseController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/adv")
@Controller
public class AdvertisementAdminController extends BaseController{

	@Autowired AdvertisementService advertisementService;
	
	@RequestMapping("/advList")
	public String findAll(Model model){
		List<Advertisement> list = advertisementService.findAll();
		model.addAttribute("list", list);
		return "admin/adv/adv_list";
	}
	
}
