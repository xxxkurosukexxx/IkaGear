# IkaGear

Splatoonのギアを検索したり保有チェックしたりできるサイトのソースです。  

PHP + SQLite3(PDO) + Smarty + log4phpあたりを使ってます。  
あとjQueryとかBootstrap3とか。

## Install
- 任意のディレクトリーにクローン
- composer install
- 設定ファイル編集
    - system/log4php.xml
- パーミッションの設定
- Apacheの設定
    - src/view/webがドキュメントルートになるように

sample
```shell
$ cd /usr/local/src
$ sudo git clone https://github.com/xxxkurosukexxx/IkaGear.git
$ cd IkaGear/src/
$ sudo composer install
$ sudo vim system/log4php.xml
$ sudo chown -R www-data:www-data .
$ sudo ln -s /usr/local/src/IkaGear/src /var/www/IkaGear
$ sudo vim /etc/apache2/sites-enabled/IkaGear.conf
$ sudo service apache2 restart
```

## LICENSE
MIT License.  
