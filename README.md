# docker-develop

Docker本地开发环境，使用docker-compose管理

## 环境要求
1. [Docker](https://www.docker.com/])
2. [Windows踩坑指南](https://blog.csdn.net/MrChenLen/article/details/130277406)

## 包含容器
- **Php-fpm**: php运行环境
- **Nginx**: nginx相关配置
- **Redis**: redis缓存
- **mysql**: mysql数据

### 相关文件
- **.env**: 该文件包含使用容器的版本信息，文件映射等

### 如何使用
```bash
  更改 .env 文件中 HOST_PROJECT_PATH 文件路径，该路径会将项目文件映射到容器内

  在根目录下执行 docker-compose up -d nginx, 可以启动nginx环境，并且同时启动 php-fpm, mysql, redis 容器，可在 docker-compose.yaml 中修改对应的links,将不需要启动的容器屏蔽

  可根据自己所需的版本进行更改对应容器的版本
```

### 📦️ PHP配置
1. 可在php-fpm目录下，打开Dockerfile文件编辑，添加需要的拓展包
2. php.ini等配置文件都是在容器构建完成够cp进容器，需要一些配置更改可修改够重新启动容器

### 📦️ Nginx配置
1. 虚拟站点配置，在site-enabled目录下新增对应的配置文件
2. 日志文件存储在log目录下，主要有access.log, error.log

### 🚀 启动
```bash
  docker-compose up -d nginx
```