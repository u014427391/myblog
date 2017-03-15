package net.myblog.service;

import java.util.List;

import net.myblog.entity.WebAd;
import net.myblog.repository.WebAdRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WebAdService {

	@Autowired WebAdRepository webAdRepository;
	
	/**
	 * 查询所有的广告信息
	 * @return
	 */
	public List<WebAd> findAll(){
		return webAdRepository.findAll();
	}
	
}
