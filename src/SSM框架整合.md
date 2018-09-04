### SSM框架整合

#### 整合技术

```java
spring springmvc mybatis maven mysql jsp html
```

### 整合步骤

#### 1：创建maven工程

##### 1.1：导入相关必须依赖

```xml
spring相关包 4.3.14
mybatis相关包
spring-mybatis整合包
mysql包
spring-test测试包
common log包
servlet包
dbcp
fileupload
standard
```

##### 1.2：完善工程目录以及权限分配

```xml
目录结构：net.togogo
包结构：
	bean：与数据库对应的实体类
	mapper：接口
	service：接口
		impl：实现类
	controller：控制器
资源文件：resources
		mapper(映射文件)
	spring-mybatis.xml
	spring-tx.xml
	spring-mvc.xml
	log4j.properties
	jdbc.properties
webapp：前段页面以及web.xml文件
```



