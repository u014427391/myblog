package net.myblog.core.velocity;

import org.springframework.dao.DataAccessException;

/**
 * @description 自定义异常类，继承Spring框架的DataAccessException
 * @author Nicky
 * @date 2017年3月23日
 */
public class VelocityException extends DataAccessException{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public VelocityException(String msg){
		super(msg);
	}

	public VelocityException(String msg, Throwable cause) {
		super(msg, cause);
	}

}
