package net.myblog.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;


public class BaseController {

	Logger LOGGER = LoggerFactory.getLogger(getClass());

	public void debug(String message){
		LOGGER.debug(message);
	}

	public void debug(String message , Exception e){
		LOGGER.debug(message , e);
	}

	public void info(String message) {
		LOGGER.info(message);
	}

	public void info(String message,Exception e){
		LOGGER.info(message , e);
	}

	public void error(String message) {
		LOGGER.error(message);
	}

	public void error(String message,Exception e){
		LOGGER.error(message , e);
	}

	/**
	 * 得到request对象
	 */
	public HttpServletRequest getRequest() {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		
		return request;
	}
	
	/**
	 * 得到ModelAndView
	 */
	public ModelAndView getModelAndView(){
		return new ModelAndView();
	}

}
