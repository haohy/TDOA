<<<<<<< HEAD
# -*- coding: utf-8 -*-
import MySQLdb
import re
import time
import os
import data

def message_save(mission_id, message_content, message_time, message_leaver, message_type):
	#存储留言
	#首先对留言进行审核，防止注入
	message_content = message_content.strip()

	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)

	cursor.execute("insert into MESSAGE \
		(mission_id, message_content, message_time, message_leaver, message_type) values ('%s', '%s', '%s', '%s', '%s');\
		"%(int(mission_id), message_content.encode('utf-8'), message_time, message_leaver.encode('utf-8'), int(message_type)))
	conn.commit()
	conn.close()

# def message_list(mission_id, role, user, mission_publisher):
# 	#role是用户所在页面的角色 执行者或发布者，user是当前用户名

# 	c = data.SQLconn()
# 	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
# 	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
# 	#当 当前用户是发布者时，所有留言可见
# 	if role == 'mission_publisher':
# 		cursor.execute("select * from MESSAGE where mission_id = '%s';"%(mission_id))
# 		message_list = cursor.fetchall()
# 	elif role == 'mission_doer':
# 		cursor.execute("select * from MESSAGE where mission_id = '%s' and message_leaver in ('%s','%s');\
# 			"%(mission_id, mission_publisher, user))
# 		message_list = cursor.fetchall()
# 	conn.close()
# 	message_list = list(message_list)
# 	#按照message_time排序
# 	message_list = sorted(message_list, key=lambda message_list: message_list['message_time'])
# 	return message_list

def message_list(mission_id):
	#role是用户所在页面的角色 执行者或发布者，user是当前用户名
	print "mission_idmission_idmission_idmission_idmission_idmission_idmission_idmission_idmission_idmission_id"
	print mission_id
	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
	#当 当前用户是发布者时，所有留言可见
	# if role == 'mission_publisher':
	cursor.execute("select * from MESSAGE where mission_id = '%s';"%(mission_id))
	message_list = cursor.fetchall()
	# elif role == 'mission_doer':
	# 	cursor.execute("select * from MESSAGE where mission_id = '%s' and (message_leaver ='%s' or message_type = '1');\
	# 		"%(mission_id, user))
	# message_list = cursor.fetchall()
	conn.close()
	print "message_list"
	print message_list
	message_list = list(message_list)
	#按照message_time排序
	message_list = sorted(message_list, key=lambda message_list: message_list['message_time'])
	return message_list



	
=======
# -*- coding: utf-8 -*-
import MySQLdb
import re
import time
import os
import data

def message_save(mission_id, message_content, message_time, message_leaver, message_type):
	#存储留言
	#首先对留言进行审核，防止注入
	message_content = message_content.strip()

	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)

	cursor.execute("insert into MESSAGE \
		(mission_id, message_content, message_time, message_leaver, message_type) values ('%s', '%s', '%s', '%s', '%s');\
		"%(int(mission_id), message_content.encode('utf-8'), message_time, message_leaver.encode('utf-8'), int(message_type)))
	conn.commit()
	conn.close()

# def message_list(mission_id, role, user, mission_publisher):
# 	#role是用户所在页面的角色 执行者或发布者，user是当前用户名

# 	c = data.SQLconn()
# 	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
# 	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
# 	#当 当前用户是发布者时，所有留言可见
# 	if role == 'mission_publisher':
# 		cursor.execute("select * from MESSAGE where mission_id = '%s';"%(mission_id))
# 		message_list = cursor.fetchall()
# 	elif role == 'mission_doer':
# 		cursor.execute("select * from MESSAGE where mission_id = '%s' and message_leaver in ('%s','%s');\
# 			"%(mission_id, mission_publisher, user))
# 		message_list = cursor.fetchall()
# 	conn.close()
# 	message_list = list(message_list)
# 	#按照message_time排序
# 	message_list = sorted(message_list, key=lambda message_list: message_list['message_time'])
# 	return message_list

def message_list(mission_id):
	#role是用户所在页面的角色 执行者或发布者，user是当前用户名
	print "mission_idmission_idmission_idmission_idmission_idmission_idmission_idmission_idmission_idmission_id"
	print mission_id
	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
	#当 当前用户是发布者时，所有留言可见
	# if role == 'mission_publisher':
	cursor.execute("select * from MESSAGE where mission_id = '%s';"%(mission_id))
	message_list = cursor.fetchall()
	# elif role == 'mission_doer':
	# 	cursor.execute("select * from MESSAGE where mission_id = '%s' and (message_leaver ='%s' or message_type = '1');\
	# 		"%(mission_id, user))
	# message_list = cursor.fetchall()
	conn.close()
	print "message_list"
	print message_list
	message_list = list(message_list)
	#按照message_time排序
	message_list = sorted(message_list, key=lambda message_list: message_list['message_time'])
	return message_list



	
>>>>>>> f41086b3477dec126aff19d257158dc3d3221e97
