package net.myblog.junit.test;

import java.io.StringWriter;
import java.util.Properties;

import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;

public class MyTest {
	
	public static void main(String[] args) throws Exception {
		  //初始化参数
        Properties properties=new Properties();
        //设置velocity资源加载方式为file
        //配置Velocity日志文件存放位置
      	properties.put("runtime.log", "/WEB-INF/log/velocity.log");
      	//配置Velocity模板文件存放位置
      	properties.put("file.resource.loader.path", "/WEB-INF/vm");
      	//配置输入编码格式
      	properties.put("input.encoding", "UTF-8");
      	//配置输出编码格式
      	properties.put("output.encoding", "UTF-8");
        //实例化一个VelocityEngine对象
        VelocityEngine velocityEngine=new VelocityEngine();
        
        //实例化一个VelocityContext
        VelocityContext context=new VelocityContext();
        //向VelocityContext中放入键值
        context.put("username", "张三");
        context.put("password", "123456789");
        context.put("age", "20");
        context.put("address", "陕西西安"); 
        context.put("blog", "http://blogjava.net/sxyx2008");
        //实例化一个StringWriter
        StringWriter writer=new StringWriter();
        //从vm目录下加载hello.vm模板,在eclipse工程中该vm目录与src目录平级
        velocityEngine.mergeTemplate("vm/article.vm", "UTF-8", context, writer);
        System.out.println(writer.toString());
	}

}
