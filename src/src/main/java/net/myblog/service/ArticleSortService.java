package net.myblog.service;

import net.myblog.entity.ArticleSort;
import net.myblog.entity.dto.ArticleSortDto;
import net.myblog.repository.ArticleSortDtoRepository;
import net.myblog.repository.ArticleSortRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ArticleSortService {

	@Autowired ArticleSortRepository articleSortRepository;
	@Autowired
	ArticleSortDtoRepository articleSortDtoRepository;
	
	/**
	 * 获取所有的博客标签(类别)信息
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<ArticleSortDto> findAll(){
		return articleSortDtoRepository.findAll();
	}

	@Transactional
	public ArticleSort getArticleSort(int typeId) {
		return articleSortRepository.findOne(typeId);
	}
	
}
