# EFWithDapper

#### 介绍
.NET6.0+EF Core 6.0+Dapper的一个Demo示例，包括增删改和批量使用EFcore，查询主要采用Dapper。

#### 软件架构
软件架构说明


#### 安装教程

1.  git clone https://gitee.com/dongfangshuo/efwith-dapper.git 下载源码。
2.  找到DataBak文件夹里用sql脚本文件执行。
3.  安装最新的Visual Studio 2022，然后打开sln，运行EFWithDapper项目。

#### Demo的技术说明

1.  数据库：SqlServer 2008 R2/2012/2014
2.  开发语言：C#
3.  开发环境：Visual Studio 2022
#### 各个项目简要说明 ：
1. EFWithDapper：Web Api层，采用asp.net core web api+Swagger。
2. EFWithDapper.Core：基础设施层，所有用到的包几乎都放到这一层方便其他层引用，还有用到的一些公共类。
3. EFWithDapper.DB：ORM映射层，存放数据库表对应的实体类和上下文类，通常这些文件通过Entity Framework Core的命令行根据已经设计好的数据库表生成。
4. EFWithDapper.Model：存放ViewModel层，一般对WebApi屏蔽DB层的实体，将DB层实体转换为Model层实体。
5. EFWithDapper.ObjectMapper:AutoMapper库对DB和Model两层映射关系的文件存放层。
6. EFWithDapper.IServices：业务接口层，定义一些用到的业务接口。
7. EFWithDapper.Services：业务实现层，集中处理webapi层传递过来的Model实体，最核心的业务代码写在这个层。

引入Autofac来注入整个dll项目
常见的动态where条件拼接用到LinqKit库，Dapper则是DapperQueryBuilder库，还有Z.EntityFramework.Plus.EFCore用于批量更新和删除，都是开源不收费的。

#### 参与贡献

1.  Fork 本仓库
2.  新建 EFWithDapper_xxx 分支
3.  提交代码
4.  新建 Pull Request

