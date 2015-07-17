#-*- coding: utf-8 -*-
import MySQLdb
import re
import time

import data

def mission_check(mission_name, mission_content, mission_starttime, mission_plan_end_time):
	#检查新建任务信息是否合法
	check_result = ""
	
	#任务开始、结束时间检验规则 2000-00-00-00 00:00:00 到 2099-12-39 29:59:59
	p = re.compile(r"^[2][0][0-9][0-9]-[0-1][0-9]-[0-3][0-9]*")

	a1,a2 = p.match(mission_starttime),p.match(mission_plan_end_time)

	if len(mission_name)==0:
		check_result = "请填写 任务名字"
		return check_result
	elif len(mission_name)>200:
		check_result = "任务名字不能超过200字"
		return check_result
	elif len(mission_content)==0:
		check_result = "请填写 任务内容"
		return check_result
	elif len(mission_content)>10000 :
		check_result = "任务内容不能超过1万字"
		return check_result
	elif len(mission_starttime)==0 :
		check_result = "请选择 任务开始时间"
		return check_result
	elif len(mission_plan_end_time)==0 :
		check_result = "请选择 任务计划结束时间"
		return check_result
	elif a1==None:
		check_result = "任务开始时间填写错误"
		return check_result
	elif a2==None:
		check_result = "任务计划结束时间填写错误"
		return check_result
	elif mission_starttime>mission_plan_end_time:
		check_result = "任务计划结束时间早于开始时间"
		return check_result	
	else:
		check_result = "no error"
		return check_result
	return "未知错误"
	
def mission_save(mission_name, mission_publisher, mission_content, mission_starttime, mission_plan_end_time, missions_doers):
	#存储任务信息
	mission_pubtime = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime())
	mission_status = "已发布"


	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)

	cursor.execute("insert into mission \
		(mission_name, mission_publisher, mission_content, mission_starttime, mission_pubtime, mission_plan_end_time, mission_status, mission_doer)\
		value ('%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s');\
		"%(mission_name.encode('utf-8'), mission_publisher.encode('utf-8'), mission_content.encode('utf-8'), mission_starttime.encode('utf-8'), mission_pubtime, mission_plan_end_time.encode('utf-8'), mission_status, missions_doers.encode('utf-8')))
	conn.commit()
	conn.close()

def get_account_id(account_name):
	#获取任务id
	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
	cursor.execute("select account_id from account where account_name='%s';"%account_name)
	id_getted = cursor.fetchall()[0]['account_id']
	conn.close()
	return id_getted

def mission_list(account_name, role):
	#当前账户任务信息

	#account_id = get_account_id(account_name)
	
	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
	cursor.execute("select * from MISSION where %s='%s' and mission_status!='已关闭';"%(role, account_name))
	m_list = cursor.fetchall()

	conn.close()

	m_list = list(m_list)
	#按照starttime排序
	m_list = sorted(m_list, key=lambda m_list: m_list['mission_starttime'])

	return m_list
def mission_list_type(account_name, role, mission_status):
	#根据所需任务状态返回对应的list
	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
	cursor.execute("select * from MISSION where %s='%s' and mission_status = '%s';\
		"%(role, account_name, mission_status.encode('utf-8')))
	m_list = cursor.fetchall()
	conn.close()
	m_list = list(m_list)
	#按照starttime排序
	m_list = sorted(m_list, key=lambda m_list: m_list['mission_starttime'])

	return m_list

def mission_delete(mission_id):
	#删除任务
	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor()
	try:
		cursor.execute("update MISSION set mission_status='已关闭' where mission_id = %s;"%mission_id)
		conn.commit()
	except Exception, e:
		conn.close()
		return "异常错误"
	else:
		conn.close()
		return "任务已删除"



def mission_view(mission_id):
	#查看任务
	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
	mission_id = int(mission_id)
	cursor.execute("select * from MISSION where mission_id=%s and mission_status !='已关闭';"%(mission_id))
	m = cursor.fetchall()

	conn.close()

	return m

def mission_structure(mission_name, mission_content, mission_starttime, mission_plan_end_time, mission_id):
	m = ({\
		'mission_id': mission_id, \
		'mission_content': mission_content, \
		'mission_name': mission_name, \
		'mission_starttime': mission_starttime, \
		'mission_plan_end_time': mission_plan_end_time\
		},)
	return m

def mission_audit(mission_id):
	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
	mission_id = int(mission_id)
	cursor.execute("update MISSION set mission_status='已审核' where mission_id='%s';"%mission_id)
	conn.commit()
	conn.close()

def get_mission_content(mission_id):
	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursors = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
	cursors.execute("SELECT mission_name, mission_content FROM mission WHERE mission_id = '%s'" % mission_id)
	return list(cursors.fetchall())
def mission_sta_change(mission_id ,mission_status):
	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
	cursor.execute("update mission set mission_status = %s where mission_id = '%s';"%(mission_status.encode('utf-8'), mission_id))
	conn.commit()
	conn.close()