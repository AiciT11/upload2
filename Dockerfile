# 使用 zukrain/php5.2.17 作为基础镜像
FROM zukrain/php5.2.17:latest

# 删除原始的 index.html 文件
RUN rm -f /var/www/index.html

# 复制本地的 index.php 和 upload.php 到容器的 /var/www 目录下
COPY index.php /var/www/
COPY upload.php /var/www/
COPY www.zip /var/www/
COPY flagggggggggggggg.php /var/www/

# 在容器的 /var/www 目录下创建一个 .htaccess 文件以禁用目录浏览
RUN echo "Options -Indexes" > /var/www/.htaccess

# 修改 /var/www 目录及其子目录下的所有文件权限为 777
RUN chmod -R 777 /var/www/

# 在Apache配置中设置 index.php 为默认文档
RUN echo "DirectoryIndex index.php" >> /etc/apache2/apache2.conf

# 创建一个新的 "upload" 目录
RUN mkdir /var/www/upload
RUN chmod -R 777 /var/www/upload
# 暴露Apache的HTTP端口
EXPOSE 80

# 启动Apache服务
CMD ["apache2ctl", "-D", "FOREGROUND"]

