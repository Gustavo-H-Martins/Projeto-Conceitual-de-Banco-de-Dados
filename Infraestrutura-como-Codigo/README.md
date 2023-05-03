# Script de Provisionamento de Servidor Web com Apache

Este script automatiza a instalação e configuração do Apache em um servidor Linux, criando um site com um arquivo index.html.

## Pré-requisitos

- Servidor Linux com acesso de superusuário
- Git instalado no servidor

## Como usar

1. Clone o repositório:

```bash
    git clone https://github.com/Gustavo-H-Martins/seu-repositorio.git
```

2. Entre na pasta do projeto:

```bash
    cd seu-repositorio
```

3. Torne o arquivo `provision.sh` executável:

```bash
    chmod +x provision.sh
```

4. Execute o script de provisionamento:

```bash
    sudo ./provision.sh
```

## Conteúdo do script

O script irá realizar as seguintes ações:

1. Atualizar os pacotes do sistema:

```bash
    sudo apt-get update
```

2. Instalar o Apache:

```bash
    sudo apt-get install apache2 -y
```

3. Criar um arquivo de configuração do Apache para o site:

```bash
    sudo cp site.conf /etc/apache2/sites-available/exemplo-site.conf
```

4. Adicionar o seguinte conteúdo ao arquivo de configuração:

```bash
    <VirtualHost *:80>
        ServerName exemplo-site.com
        ServerAlias www.exemplo-site.com
        DocumentRoot /var/www/exemplo-site/public_html

        <Directory /var/www/exemplo-site/public_html>
            AllowOverride All
        </Directory>

        ErrorLog ${APACHE_LOG_DIR}/exemplo-site_error.log
        CustomLog ${APACHE_LOG_DIR}/exemplo-site_access.log combined
    </VirtualHost>
```

5. Criar o diretório onde será armazenado o conteúdo do seu site:

```bash
    sudo mkdir -p /var/www/exemplo-site/public_html
```

6. Copiar o arquivo index.html para o diretório criado:

```bash
    sudo cp index.html /var/www/seu-site/public_html/index.html
```

7. Habilitar o site e reiniciar o Apache:

```bash
    sudo a2ensite seu-site.conf
    sudo systemctl restart apache2
```

## Autor

Gustavo Henrique Lopes Martins

## Licença

Este projeto está licenciado sob a licença MIT - veja o arquivo [LICENCE.md](./LICENCE.md) para mais detalhes.
