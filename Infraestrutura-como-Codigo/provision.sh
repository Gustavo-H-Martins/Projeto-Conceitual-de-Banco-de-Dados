#!/bin/bash

# Atualiza os pacotes do sistema
sudo apt-get update

# Instala o Apache
sudo apt-get install apache2 -y

# Cria o arquivo de configuração do Apache para o seu site
sudo cp site.conf /etc/apache2/sites-available/exemplo-site.conf

# Adiciona o conteúdo ao arquivo de configuração
echo "
<VirtualHost *:80>
    ServerName exemplo-site.com
    ServerAlias www.exemplo-site.com
    DocumentRoot /var/www/exemplo-site/public_html

    <Directory /var/www/exemplo-site/public_html>
        AllowOverride All
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/exemplo-site_error.log
    CustomLog ${APACHE_LOG_DIR}/exemplo-site_access.log combined
</VirtualHost>" | sudo tee /etc/apache2/sites-available/exemplo-site.conf > /dev/null

# Cria o diretório onde será armazenado o conteúdo do seu site
sudo mkdir -p /var/www/exemplo-site/public_html

# Copia o arquivo index.html para o diretório criado
sudo cp index.html /var/www/exemplo-site/public_html/index.html

# Habilita o site e reinicia o Apache
sudo a2ensite exemplo-site.conf
sudo systemctl restart apache2
