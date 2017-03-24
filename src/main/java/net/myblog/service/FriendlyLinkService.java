package net.myblog.service;

import java.util.List;

import net.myblog.entity.FriendlyLink;
import net.myblog.repository.FriendlyLinkRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class FriendlyLinkService {
	
	@Autowired
	FriendlyLinkRepository friendlyLinkRepository;

	/**
	 * 获取所有的友情链接信息
	 * @return
	 */
	@Transactional
	public List<FriendlyLink> findAll(){
		return friendlyLinkRepository.findAll();
	}

}
