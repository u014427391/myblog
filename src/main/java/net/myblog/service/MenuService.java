package net.myblog.service;

import java.util.List;

import net.myblog.entity.Menu;
import net.myblog.repository.MenuRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MenuService {
	
	@Autowired MenuRepository menuRepository;
	
	/**
	 * 查询所有的菜单
	 * @return
	 */
	@Transactional
	public List<Menu> findAll(){
		return menuRepository.findAll();
	}

}
