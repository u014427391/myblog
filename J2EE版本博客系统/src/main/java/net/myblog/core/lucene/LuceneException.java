package net.myblog.core.lucene;

import org.springframework.dao.DataAccessException;

/**
 * @description 自定义的Lucene异常类
 * @author Nicky
 * @date 2017年3月22日
 */
public class LuceneException extends DataAccessException{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public LuceneException(String message) {
		super(message);
	}
	
	public LuceneException(String message, Throwable t){
		super(message,t);
	}

}
