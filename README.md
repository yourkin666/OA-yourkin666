# OA-yourkin666
#                                    	 OA(Office Automation) by java

暂时做了这些，以后有需求和实力，会去持续拓展此项目

### 涉及技术栈:

​		脚手架：Springboot

​		ORM框架：Mybatis

​		参数校验框架：Spring Validation

​		登陆注册：MD5加密、手动加盐实现

​		认证：JWT(Json Web Token) 、拦截器、ThreadLocal 工具类的使用，Redis

​		授权：手写@RoleCheck注解（具体用拦截器 + ThreadLocal 实现）

​		异常处理：交给GlobalExceptionHandler

​		文件上传：阿里云OSS（Object Storage Service）

​		工作流框架：Camunda

​		数据库：MySQL、Redis

​		集成AI: Spring AI框架 

​		聊天室：Websocket实现

​		部署上线：docker



### 实现的一些功能：

​		基础功能全部实现，加分项中除了分布式微服务都尽量完成了

![屏幕截图 2024-05-25 014308](https://github.com/yourkin666/OA-yourkin666/assets/146162315/1c2c3132-3e4f-4170-a162-de4f821a63e8)



申请相关的功能，我先按照自己逻辑手写完成了，毕竟自己第一次写这些东西，留做纪念还是没有删掉，结合工作流框架的实现在这。。。。。。。。。



## 相关的技术选型，思考了几天：

### 1.

本想用sa-token或shiro解决，在查申请实现方法时，了解到工作流框架，工作流框架又说是默认继承Spring Security

又想要不就用Spring Security做认证授权，不想安全框架在项目里太杂了

后来没用，确实重且麻烦，不如自己手动实现，且框架可能会局限某些语言，但自己实现的底层逻辑却是其他语言也通用的

{JWT、拦截器、ThreadLocal ，Redis }    实现认证

{手写@RoleCheck注解（具体用拦截器 + ThreadLocal 实现）}     实现授权



### 2.

另外选用Camunda工作流框架，对我还是很新的东西

单纯建表处理工作流的劣势（工作流框架的优点）：

流程比较复杂的时候，此时再用一个 status 字段去描述，就很难说的请到底是怎么回事了。每一步审批，都有可能批准也有可能拒绝，拒绝并不意味着流程结束，员工修改报销资料之后，还可以继续提交。此时如果还用 status 去描述，那么 status 将有 N 多个值去表示不同的情况，这个维护起来非常不便



### 3.

阿里云OSS实现文件上传，应该以后会有用到的时候，到时候来取，配置好即插即用





### 4.

Spring AI 也是才出的东西，额就是一个项目里调接口与ai聊天的功能，增强OA系统完整度

我添加的是moonshot的免费api-key，以及代理域名base-url

![屏幕截图 2024-05-25 165140](https://github.com/yourkin666/OA-yourkin666/assets/146162315/5ff60053-c11f-41d4-a34e-7a780d019bbf)



### 5.

OA项目前刚学了计网，又了解一种网络协议Websocket,做个聊天室，提高OA的工作效率



### 心得：

1.更体会到了MVC架构的思想，改掉之前项目的坏毛病，尽可能的把所有业务处理放在ServiceImpl中实现

2.Threadlocal真的非常好用，应用场景很多



## FInally

最后放一个我自己的博客：https://blog.csdn.net/2302_80742310?spm=1000.2115.3001.5343

里面是我从去年一个计算机小白学习java至今大约7，8个月的学习笔记（有些没整理）


最后再感谢一下蓝山的学长们，正如你们所说，做项目的收获是最大的，项目的需求会推动我去学习各种未知的技术，并且效率和专注远超平时
通过这两次项目的考核，带给我的收获是非常大的，我也慢慢从小白摸索到了自己的方向，不管最后我是否通过这次考核，我还是想表达学长们对我无私的指导的尊敬和感谢。
