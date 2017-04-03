package net.myblog.core.velocity;

import java.io.BufferedWriter;
import java.io.File;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import net.myblog.entity.Article;
import net.myblog.utils.DateUtils;
import net.myblog.utils.FileUtils;

import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 * @description 
 * @author Nicky
 * @date 2017年3月24日
 */
public class VelocityManager {
	
	/**
	 * 加载文章的模板页面
	 */
	public static void doLoadActiceVM(){
		
	}

	/**
	 * 创建静态模板页面
	 * @param article
	 * @param text
	 * @param savePath
	 * @throws Exception
	 */
	public static void doCreateArticleVM(Article article, String text, File savePath) 
			throws Exception 
			{
		doInit();
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		VelocityContext context = new VelocityContext();
		context.put("basePath", request.getContextPath());
		context.put("article", article);
		context.put("text", text);
		context.put("createTime", DateUtils.formatDate(article.getArticleTime()));
		
		BufferedWriter writer = FileUtils.fileInit(savePath);
		Template template = Velocity.getTemplate("article.vm");
		template.merge(context, writer);
	}
	
	/**
	 * 初始化操作，配置日志文件位置，静态页面存放位置，输出输入编码
	 */
	public static void doInit(){
		Properties prop = new Properties();
		prop.put("runtime.log","/WEB-INF/log/velocity.log");
		prop.put("file.resource.loader.path","/WEB-INF/vm");
		prop.put("input.encoding","UTF-8");
		prop.put("output.encoding","UTF-8");
		try {
			Velocity.init(prop);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
