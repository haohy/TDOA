#-*- coding: utf-8 -*-
import web
import MySQLdb
import re

#数据库连接参数

#本地的测试数据库
conn = {"host":"127.0.0.1", "user":"root", "passwd":"root", "charset":"utf8", "db":"tdoa"}
#阿里云的数据库
#conn = {"host":"qdm157632221.my3w.com", "user":"qdm157632221", "passwd":"haohy0408", "charset":"utf8", "db":"qdm157632221_db"}
