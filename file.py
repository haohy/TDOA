#-*- coding: utf-8 -*-
import MySQLdb
import re
import time
import os
import data
import datetime



def create_dir(file_dir):
	#创建目录
	if os.path.exists(file_dir) == False:
		os.mkdir(file_dir)


def file_list(file_type, mission_id, role):
	#附件列表
	print role
	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
	cursor.execute("select * from FILE WHERE file_type = '%s' and file_uploader = '%s' and mission_id = '%s';\
		"%(file_type, role, mission_id))
	file_list = cursor.fetchall()
	print "file_list(file_type, mission_id, role)   :"
	print  file_list
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

def file_type_change(mission_id, mission_doer):
	#任务状态改为已完成时，将对应mission_id的file_type改为2
	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
	cursor.execute("update FILE set file_type = '2' WHERE mission_id = '%s' and file_uploader = '%s' and file_type = '1';\
		"%(mission_id, mission_doer))
	conn.commit()
	conn.close()
	

def get_download_list(type, args=None):
	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
	cursor.execute("SELECT file_name, mission_name, file_uploader, file_upload_time, mission_name, FILE.mission_id \
					FROM FILE LEFT JOIN HISTORY_MISSION  \
					ON FILE.mission_id = HISTORY_MISSION .mission_id")
	file_list_all = list(cursor.fetchall())
	file_list_search = list()
	cursor.close()
	if type == 'all':
		return file_list_all
	for m in file_list_all:
		if args.upload_time == '' or datetime.datetime.strptime(args.upload_time,"%Y-%m-%d").date() <= m['file_upload_time'].date():
			if args.type == '':
				file_list_search.append(m)
			if args.type == '文件名' and args.search_str in m['file_name']:
				file_list_search.append(m)
			if args.type == '任务名' and 'mission_name' in m and args.search_str in m['mission_name']:
				file_list_search.append(m)
	return file_list_search
