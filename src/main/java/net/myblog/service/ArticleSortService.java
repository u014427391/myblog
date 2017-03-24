package net.myblog.service;

import java.util.List;

import net.myblog.entity.ArticleSort;
import net.myblog.repository.ArticleSortRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ArticleSortService {

	@Autowired ArticleSortRepository articleSortRepository;
	
	/**
	 * 获取所有的博客标签(类别)信息
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<ArticleSort> findAll(){
		return articleSortRepository.findAll();
	}
	
}
