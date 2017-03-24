package net.myblog.service;

import net.myblog.entity.Article;
import net.myblog.repository.ArticleRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

@Service
public class ArticleService {
	
	@Autowired ArticleRepository articleRepository;

	/**
	 * 获取所有的博客信息并分页显示
	 * @param pageNo
	 * 			当前页面数
	 * @param pageSize
	 * 			每一页面的页数
	 * @return
	 */
	public Page<Article> findAll(int pageNo, int pageSize){
		PageRequest request = buildPageRequest(pageNo, pageSize);
		Page<Article> articles = articleRepository.findAll(request);
		return articles;
	}
	
	
	/**
	 * 构建PageRequest
	 * @param pageNo
	 * 			当前页数
	 * @param pageSize
	 * 			每一页面的页数
	 * @return
	 */
	public PageRequest buildPageRequest(int pageNo, int pageSize){
		return new PageRequest(pageNo-1, pageSize,null);
	}
	
}
