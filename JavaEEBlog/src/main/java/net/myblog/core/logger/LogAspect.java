package net.myblog.biz.aop;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.alibaba.fastjson.JSON;



@Aspect
@Component
public class LogAspect {
	
	private final Logger log = LoggerFactory.getLogger(LogAspect.class);

	@Pointcut("execution(public * net.myblog.service..*.**(..))")
	public void serviceAspect(){}
	
	@Pointcut("execution(public * net.myblog.web.controller..*.*(..))")
	public void controllerAspect(){}
	
	/**
	 * 环绕方法
	 * @param joinPoint
	 * @return
	 * @throws Throwable
	 */
	@Around("controllerAspect()")
	public Object doControllerAround(ProceedingJoinPoint joinPoint) throws Throwable{
		ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.getRequestAttributes();
		HttpServletRequest request = attr.getRequest();
		
		Object result = new Object();
		try{
			log.info("====Controller前置通知开始====");
			log.info("请求参数："+request.getQueryString());
			log.info("请求接口："+request.getMethod() + "["+request.getRequestURI()+"]");
			
			result = joinPoint.proceed();
			log.info("=====Controller后置通知开始=====");
			log.info("返回结果："+JSON.toJSONString(result));
			
		}catch(Exception e){
			log.error("====Controller全局异常====");
			log.error("异常信息:{}"+e.getMessage());
			Map<String, Object> map = new HashMap<String, Object>(16);
			map.put("className", e.getClass().getName());
			map.put("responseCode", HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			return new ResponseEntity(map, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
	}
	
	/**
	 * 业务层环绕增强
	 * @param joinPoint
	 * @param e
	 * @return
	 */
	@AfterThrowing(pointcut="serviceAspect()", throwing="e")
	public  Object serviceAround(JoinPoint joinPoint , Exception e){
		ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.getRequestAttributes();
		HttpServletRequest request = attr.getRequest();
		
		Object result = new Object();
		String param ="";
		if(joinPoint.getArgs()!=null && joinPoint.getArgs().length >0){
			for(int i = 0; i < joinPoint.getArgs().length ; i++) {
				param += JSON.toJSONString(joinPoint.getArgs()[i])+";";
			}
		}
		try{
			log.info("====Service环绕增强开始====");
			log.info("异常代码："+request.getClass().getName());
			log.info("异常方法："+(joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()"));
			log.info("请求参数："+param);
		}catch(Exception ex){
			log.error("====Service环绕增强异常====");
			log.error("异常信息:{}"+ex.getMessage());
			Map<String, Object> map = new HashMap<String, Object>(16);
			map.put("className", ex.getClass().getName());
			map.put("responseCode", HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			return new ResponseEntity(map, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
	}
}
