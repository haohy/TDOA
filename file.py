#-*- coding: utf-8 -*-
import MySQLdb
import re
import time
import os
import data



def create_dir(file_dir):
	#创建目录
	if os.path.exists(file_dir) == False:
		os.mkdir(file_dir)


def file_list(file_type, role, mission_id):
	#附件列表
	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
	cursor.execute("select * from FILE WHERE file_type = '%s' and file_uploader = '%s' and mission_id = '%s';\
		"%(file_type, role, mission_id))
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
		"%(int(mission_id), file_name.encode('utf-8'), file_url.encode('utf-8'), file_uploader.encode('utf-8'), file_upload_time.encode('utf-8'),int(file_type)))
	conn.commit()
	conn.close()

def file_type_change(mission_id):
	#任务状态改为已完成时，将对应mission_id的file_type改为2
	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
	cursor.execute("update file set file_type = '2' WHERE mission_id = '%s';"%mission_id)
	conn.commit()
	conn.close()
	

