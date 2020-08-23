FROM ubuntu:20.04
WORKDIR "/application"
ENV TZ=America/Sao_Paulo
# Install selected extensions and other stuff
RUN apt-get update \
	&& apt-get -y install tzdata \
	&& apt install redis -y \
	&& DEBIAN_FRONTEND="noninteractive" \
	&& apt install php php-cli php-fpm php-json php-pdo php-mysql php-zip php-gd php-xdebug php-mbstring php-curl php-xml php-pear php-bcmath -y \
	&& apt install php7.4-redis -y \
	&& apt -y install wget -y 
	

ADD https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.bionic_amd64.deb /var/www/html

RUN cd /var/www/html \
	&& apt install /var/www/html/wkhtmltox_0.12.5-1.bionic_amd64.deb -y \
	&& apt install mariadb-server -y 
	
	

# docker run -d --name dbserver.mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root mysql

