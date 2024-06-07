# OA-yourkin666
#                                    	 OA(Office Automation) by java

暂时做了这些，以后有需求和实力，会去持续拓展此项目

### 涉及技术栈:

​		脚手架：Springboot

​		ORM框架：Mybatis

​		参数校验框架：Spring Validation

​		登陆注册：MD5加密、手动加盐实现

​		认证：JWT 、拦截器、ThreadLocal 工具类的使用，Redis

​		授权：手写@RoleCheck注解（AOP + ThreadLocal 实现）

​		异常处理：交给GlobalExceptionHandler

​		文件上传：阿里云OSS（Object Storage Service）

​		工作流框架：flowable

​		数据库：MySQL、Redis

​		集成AI: Spring AI框架 

​		聊天室：Websocket实现

​		部署上线：宝塔面板



### 实现的一些功能：

​		基础功能全部实现，加分项中除了分布式微服务相关的都尽量完成了
    这些接口都在相应的controller中实现

![屏幕截图 2024-06-02 220008](https://github.com/yourkin666/OA-yourkin666/assets/146162315/376431c1-4336-4a50-bb15-3ab7ac9d39cd)

![屏幕截图 2024-06-02 220019](https://github.com/yourkin666/OA-yourkin666/assets/146162315/8173d8bc-7783-4356-9bfd-ab74349152f1)





## 相关的技术选型，思考了几天：

### 1.

认证和授权是自己手动实现的，没有用到安全框架，且框架可能会局限某些语言，但自己实现的底层逻辑却是其他语言也通用的

{JWT、拦截器、ThreadLocal ，Redis }    实现认证

{手写@RoleCheck注解（具体用AOP + ThreadLocal 实现）}     实现授权



### 2.

另外选用flowable工作流框架，对我还是很新的东西

工作流框架可以说是技术框架和业务框架的结合

工作流框架并不属于系统分层开发中的某一层，它本身连接了几十张表，它是一个完整的项目，解决了审批/业务编排的痛点

单纯建表手动处理工作流的劣势（工作流框架的优点）：

流程比较复杂的时候，此时再用一个 status 字段去描述，就很难说的请到底是怎么回事了。每一步审批，都有可能批准也有可能拒绝，拒绝并不意味着流程结束，员工修改报销资料之后，还可以继续提交。此时如果还用 status 去描述，那么 status 将有 N 多个值去表示不同的情况，这个维护起来非常不便（简单说就是，用工作流框架实现复杂流程更简单，维护起来更容易）

考核的流程，我先按照自己逻辑完成了，后面结合flowable还做一个报销流程

![屏幕截图 2024-06-02 220417](https://github.com/yourkin666/OA-yourkin666/assets/146162315/d8624372-9070-411d-9da0-e1a9f45f2972)


### 3.

阿里云OSS实现头像或其他流媒体文件的上传保存，应该以后会有用到的时候，到时候来取，在OSS工具类里面配置好即插即用
![image](https://github.com/yourkin666/OA-yourkin666/assets/146162315/5cff62d3-bf2d-4507-89e6-d94d8a4cf008)



### 4.

Spring AI 也是才出的东西，额就是一个项目里调接口与ai聊天的功能，增强OA系统工作效率
我添加的是moonshot的免费api-key，以及代理域名base-url
或者去淘宝买key也是可以的

![屏幕截图 2024-05-25 165140](https://github.com/yourkin666/OA-yourkin666/assets/146162315/5ff60053-c11f-41d4-a34e-7a780d019bbf)

在yaml文件里面现用现配

### 5.

OA项目前刚学了计网，又了解一种网络协议Websocket，做个聊天室，相关后端代码放在了ws包里

### 6.

用validation框架实现了username和password的长度校验，还有email，url的格式检查

### 7.
使用redis存储tokem，实现修改密码，原先token失效，应重新登陆获取token的功能

### 心得：

1.更体会到了MVC架构的解耦合和专注业务开发的设计思想，改掉之前项目的坏毛病，尽可能的把所有业务处理放在ServiceImpl中实现

2.Threadlocal真的非常好用，应用场景很多  这是我写的一些理解https://blog.csdn.net/2302_80742310/article/details/139353133?spm=1001.2014.3001.5501

3.工作流那儿返回值的时候，遇到了Could not write JSON: lazy loading outside command context懒加载的报误，由于Task对象中的字段的原因可能会导致一直循环，会导致无法转换json，所以改变一下返回数据。可以用对象去接受，也可以用Map接收。返回相关数据返回就好了。
或者.includeTaskLocalVariables()  // 初始化表单键值也可以解决懒加载问题

4.在授权时改变了之前用拦截器的思路，使用了AOP，使代码更加优雅，尽管他们都说优雅这个词不属于java



## FInally

放一个我自己的博客：https://blog.csdn.net/2302_80742310?spm=1000.2115.3001.5343

里面是我从去年一个计算机小白学习java至今大约7，8个月的学习笔记（有些没整理）


最后再感谢一下蓝山的学长们，正如你们所说，做项目的收获是最大的，项目的需求会推动我去学习各种未知的技术，并且效率和专注远超平时。
通过这两次项目的考核，带给我的收获是非常大的，我也慢慢从小白摸索到了自己的方向，不管最后我是否通过这次考核，我还是想对学长们的无私指导和关心表达尊敬和感谢。
