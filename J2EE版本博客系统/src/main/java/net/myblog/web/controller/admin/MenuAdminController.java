package net.myblog.web.controller.admin;

import java.util.ArrayList;
import java.util.List;

import net.myblog.entity.Menu;
import net.myblog.service.MenuService;
import net.myblog.web.controller.BaseController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/menu")
@Controller
public class MenuAdminController extends BaseController{

	@Autowired MenuService menuService;
	
	/**
	 * 菜单主页
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/listMenu",produces="text/html;charset=UTF-8")
	public ModelAndView toMenuList(){
		List<Menu> menuList = menuService.findAllParentMenu();
		List<Menu> menus = new ArrayList<Menu>();
		List<Menu> subMenu = new ArrayList<Menu>();
		for(Menu m:menuList){
			System.out.println(m.getName());
			subMenu = menuService.findSubMenuById(m.getMenuId());
			for(Menu s:subMenu){
				System.out.println(s.getName());
			}
			if(subMenu!=null&&subMenu.size()>0){
				m.setSubMenu(subMenu);
				m.setHasMenu(Boolean.TRUE);
				menus.add(m);
			}
		}
		
		ModelAndView mv = this.getModelAndView();
		mv.addObject("menus", menus);
		mv.setViewName("admin/menu/menu_list");
		return mv;
	}
}
