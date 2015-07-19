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
	
def mission_save(mission_name, mission_content, mission_starttime, mission_plan_end_time, mission_publisher, mission_doers):
	#规范时间格式
	mission_pubtime = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime())
	# mission_starttime = time.strftime('%Y-%m-%d', mission_starttime)
	# mission_plan_end_time = time.strftime('%Y-%m-%d', mission_plan_end_time)
	#任务在刚存储时是“待接受”状态的
	mission_status = "待接受"

	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	#使查询结果返回字典类型
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
	#向mission插入任务信息
	cursor.execute("insert into mission \
		(mission_name, mission_content, mission_pubtime, mission_starttime, mission_plan_end_time, mission_publisher)\
		value ('%s', '%s', '%s', '%s', '%s', '%s');\
		"%(mission_name.encode('utf-8'), mission_content.encode('utf-8'), mission_pubtime, mission_starttime.encode('utf-8'), mission_plan_end_time.encode('utf-8'), mission_publisher.encode('utf-8')))
	conn.commit()

	#向missions_doers中插入信息
	cursor.execute("select max(mission_id) from mission ;")
	m_id = cursor.fetchall()
	mission_id = int(m_id[0]['max(mission_id)'])
	doers = mission_doers.split(',')
	#删除列表doers中最后一个逗号后的元素
	doers.pop()
	for doer in doers:
		cursor.execute("insert into missions_doers \
		(mission_id, mission_doer ,mission_status)\
		value ('%s', '%s' ,'%s');\
		"%(mission_id, doer.encode('utf-8'), mission_status.encode('utf-8')))
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
	if str(role) == 'mission_doer':
		cursor.execute("select mission.mission_name,mission.mission_publisher,mission.mission_starttime,mission.mission_plan_end_time,missions_doers.mission_status \
			from missions_doers,mission \
			where missions_doers.mission_doer='%s' and missions_doers.mission_status='待接受' and missions_doers.mission_id = mission.mission_id;"%(account_name))
		global m_list 
		m_list_user = cursor.fetchall()
		conn.close()
		m_list_user = list(m_list_user)
		m_list_user = sorted(m_list_user, key=lambda m_list_user: m_list_user['mission_starttime'])
		return m_list_user
	elif str(role) == 'mission_publisher':
		cursor.execute("select distinct mission.mission_id,mission.mission_name,mission.mission_starttime,mission.mission_plan_end_time,missions_doers.mission_status \
	from mission,missions_doers where missions_doers.mission_id = mission.mission_id and missions_doers.mission_status = '执行中' and mission.mission_publisher = '%s';"%(account_name))
		m_list_mission = cursor.fetchall()
		cursor.execute("select distinct mission.mission_id from mission,missions_doers \
			where missions_doers.mission_id = mission.mission_id and missions_doers.mission_status = '执行中' and mission.mission_publisher = '%s';"%(account_name))
		m_list_id = cursor.fetchall()
		list_id = []
		for i in range(len(m_list_id)):
			list_id.append(m_list_id[i]['mission_id'])
		doerDirct = {}
		for i in list_id:
			cursor.execute("select mission_doer from missions_doers where mission_status = '执行中' and mission_id = %s"%(i))
			m_list_doers = cursor.fetchall()
			m_list_doers_list = []
			for j in range(len(m_list_doers)):
				m_list_doers_list.append(m_list_doers[j]['mission_doer'])
			doerDirct[i]=m_list_doers_list
		for i in range(len(m_list_mission)):
			m_list_mission[i]['mission_doer']=doerDirct[m_list_mission[i]['mission_id']]
		m_list_publisher = m_list_mission
		conn.close()
		m_list_publisher = list(m_list_publisher)
		m_list_publisher = sorted(m_list_publisher, key=lambda m_list_publisher: m_list_publisher['mission_starttime'])
		return m_list_publisher
	else:
		print "no user and no publisher"+"role="+role
		return 0


	# conn.close()
	# #将sql操作得到的tuple
	# m_list = list(m_list)
	# #按照starttime排序
	# m_list = sorted(m_list, key=lambda m_list: m_list['mission_starttime'])

	#return m_list
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