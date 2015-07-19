#-*- coding: utf-8 -*-
import MySQLdb
import re
import time

import data

def file_list(type):
	#附件列表

	
	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)

	cursor.execute("select * from FILE where file_type='%s';"%type)

	file_list = cursor.fetchall()

	conn.close()

	file_list = list(file_list)
	#按照file_upload_time排序
	file_list = sorted(file_list, key=lambda file_list: file_list['file_upload_time'])

	return file_list
	


def upload(mission_id,file_name,file_url,file_uploader,file_upload_time,file_type):
	#上传附件

	#存储附件信息
	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
	cursor.execute("insert into FILE \
		(mission_id, file_name, file_url, file_uploader, file_upload_time, file_type)\
		value ('%s', '%s', '%s', '%s', '%s', '%s');\
		"%(int(mission_id), file_name.encode('utf-8'), file_url.encode('utf-8'), file_uploader.encode('utf-8'), file_upload_time,int(file_type)))
	conn.commit()
	conn.close()
	

