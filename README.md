## 简介 
开源博客系统，开发中...<br>
开源博客系统项目方案<br>
【前言】<br>
项目：一款Github上开源的博客系统项目<br>
目的：对学到的JavaEE框架、开源组件、前端技术进行应用学习。同时开发完成后写技术博客，开源到Github上获取star和fork(切勿用于商业用途)<br>
## 开源
前端是采用一个个人网站分享的前端模板
http://www.yangqq.com/download/div/2013-06-15/272.html

## 【技术介绍】<br>
JavaEE后端技术：<br>
JPA产品：Hibernate JPA(JPA产品还有OpenJPA等)<br>
Web框架：SpringMVC<br>
数据库层框架：Spring Data<br>
权限安全：Shiro(会话管理、加密、认证、授权)<br>
连接池：Druid(阿里开源的)<br>
页面静态化处理：Velocity(听说淘宝用过Velocity做页面静态化处理，当然淘宝很厉害的在大数据和分布式架构)<br>
Excel表操作：POI(Apache开源)<br>
全文搜索引擎：Lucene(开源中国搜索功能就是基于全文搜索引擎和IKAnalyzer开发的，不过后台应该有分布式的设计)<br>

前端技术：<br>
Easyui、Bootstrap现在后台管理系统开发还是很多使用easyui或者Bootstrap框架的<br>
Html5、CSS3、Jquery<br>

数据库：MYSQL<br>

其它技术：Ajax、JSON、XML…<br>

网络安全：仿XSS攻击…<br>

项目管理系统：Maven、Git<br>

##【项目结构】<br>
 

Biz：业务接口代码<br>
Core：表示项目的基础框架，即一些通用的代码层代码<br>
Web：一般放JavaEE项目里的controller、filter、interceptor等等类<br>

## 【平台功能演示】

博客主页
![Image text](https://github.com/u014427391/myblog/raw/master/src/screenshot/博客主页.png)

运营平台主页
![Image text](https://github.com/u014427391/myblog/raw/master/src/screenshot/运营平台主页.png)

运营平台登录页面
![Image text](https://github.com/u014427391/myblog/raw/master/src/screenshot/运营平台登录页面.png)



##【附录】
JPA介绍：JPA(Java 持久化 API)全称 Java Persistence API，是由 Sun 引入的 ORM 规范，
目的是为了简化现有 Java 应用的对象持久化的开发工作并且整合 ORM 技术。目
前 Hibernate、OpenJPA、TopLink 都提供了 JPA 的实现<br>
Spring Data：Spring框架子框架，为了简化构建基于 Spring 框架应用的数据访问计数，包括非关系数据库、Map-Reduce 框架、云数据服务等等；另外也包含对关系数据库的访问支持。<br>
Spring Data JPA：Spring Data框架的一个子模块，主要是简化数据操作<br>
...

编程bug修复记录：
fastjson$ref循环引用问题：http://www.cnblogs.com/zjrodger/p/4630237.html