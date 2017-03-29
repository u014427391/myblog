package net.myblog.web.controller;

import java.util.ArrayList;
import java.util.List;

import net.myblog.entity.Menu;
import net.myblog.service.MenuService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MenuController extends BaseController{
	
	@Autowired MenuService menuService;
	
	@RequestMapping(value="/loadMenu", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String doLoadMenu(){
		List<Menu> menuList = new ArrayList<Menu>();
		menuList = menuService.findAll();
		List<Menu> menus = new ArrayList<Menu>(); 
		for(Menu m : menuList){
			if(m.getMenuType().equals("1")){
				List<Menu> subMenu = menuService.findSubMenuById(m.getMenuId());
				m.setSubMenu(subMenu);
				menus.add(m);
			}
		}
		JSONArray jsonArray = JSONArray.fromObject(menus);
		
		return jsonArray.toString();
	}

}
