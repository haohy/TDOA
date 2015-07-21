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
	
def mission_save(mission_name, mission_content, mission_starttime, mission_plan_end_time, mission_publisher, mission_doers,mission_pubtime):
	#规范时间格式
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
	cursor.execute("select max(mission_id) from mission where mission_publisher = '%s';"%(mission_publisher))
	m_id = cursor.fetchall()
	mission_id = int(m_id[0]['max(mission_id)'])
	doers = mission_doers.split(',')
	print doers
	#删除列表doers中最后一个逗号后的元素
	doers.pop()
	for doer in doers:
		cursor.execute("insert into missions_doers \
		(mission_id, mission_doer ,mission_status)\
		value ('%s', '%s' ,'%s');\
		"%(mission_id, doer.encode('utf-8'), mission_status.encode('utf-8')))
	conn.commit()

	conn.close()

def mission_id_get(mission_publisher, mission_pubtime):
	print mission_pubtime,mission_publisher
	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
	cursor.execute("select mission_id from mission where mission_publisher = '%s' AND mission_pubtime = '%s';\
		"%(mission_publisher, mission_pubtime))
	id_getted = cursor.fetchall()[0]['mission_id']
	print id_getted
	conn.close()
	return id_getted

def get_account_id(account_name):
	#获取任务id
	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
	cursor.execute("select account_id from account where account_name='%s';"%account_name)
	id_getted = cursor.fetchall()[0]['account_id']
	conn.close()
	return id_getted

def mission_list(account_name, role, mission_status="待接受|执行中|已提交|未通过|已完成"):
	#当前账户任务信息
	#account_id = get_account_id(account_name)
	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
	if str(role) == 'mission_doer':
		cursor.execute("select mission.mission_name, mission.mission_publisher, mission.mission_starttime, mission.mission_plan_end_time, missions_doers.mission_status \
			from missions_doers, mission \
			where missions_doers.mission_doer = '%s' and missions_doers.mission_status = '%s' and missions_doers.mission_id = mission.mission_id;\
			"%(account_name, mission_status))
		# cursor.execute("select mission.mission_name,mission.mission_publisher,mission.mission_starttime,mission.mission_plan_end_time,missions_doers.mission_status \
		# 	from missions_doers,mission \
		# 	where missions_doers.mission_doer='%s' and missions_doers.mission_status='%s' and missions_doers.mission_id = mission.mission_id;"%(account_name,mission_status))
		global m_list 
		m_list_user = cursor.fetchall()
		conn.close()
		m_list_user = list(m_list_user)
		m_list_user = sorted(m_list_user, key=lambda m_list_user: m_list_user['mission_starttime'])
		return m_list_user
		print m_list_doers
	elif str(role) == 'mission_publisher':
		#读取mission表中除doer以外的其他信息，并保存在m_list_mission中
		cursor.execute("select distinct mission.mission_id,mission.mission_name,mission.mission_publisher,mission.mission_starttime,mission.mission_plan_end_time,missions_doers.mission_status \
	from mission,missions_doers where missions_doers.mission_id = mission.mission_id and missions_doers.mission_status = '%s' and mission.mission_publisher = '%s';"%(mission_status,account_name))
		m_list_mission = cursor.fetchall()
		#读取missions_doers,mission中相同的id,并保存到list_id中
		cursor.execute("select distinct mission.mission_id from mission,missions_doers \
			where missions_doers.mission_id = mission.mission_id and missions_doers.mission_status = '%s' and mission.mission_publisher = '%s';"%(mission_status,account_name))
		m_list_id = cursor.fetchall()
		list_id = []
		for i in range(len(m_list_id)):
			list_id.append(m_list_id[i]['mission_id'])
		#将missions_doers中与mission中相同id对应的多执行者放到一个字典doerDict中，key为id，value为doers
		doerDict = {}
		for i in list_id:
			cursor.execute("select mission_doer from missions_doers where mission_status = '%s' and mission_id = %s"%(mission_status,i))
			m_list_doers = cursor.fetchall()
			m_list_doers_list = []
			for j in range(len(m_list_doers)):
				m_list_doers_list.append(m_list_doers[j]['mission_doer'])
			doerDict[i]=m_list_doers_list
		#将doerDict和之前只缺少doers信息的m_list_mission合并起来，构成最后返回的m_list_publisher
		for i in range(len(m_list_mission)):
			m_list_mission[i]['mission_doer']=doerDict[m_list_mission[i]['mission_id']]
		m_list_publisher = m_list_mission
		conn.close()
		m_list_publisher = list(m_list_publisher)
		m_list_publisher = sorted(m_list_publisher, key=lambda m_list_publisher: m_list_publisher['mission_starttime'])
		return m_list_publisher
		print m_list_publisher
	else:
		print "no user and no publisher"+"role="+role
		return 0

def mission_delete(mission_id):
	#删除任务
	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor()
	try:
		cursor.execute("update missions_doers set mission_status='已关闭' where mission_id = %s;"%(mission_id))
		#cursor.execute("delete  from mission,missions_doers where mission_id = %s;"%(mission_id))
		conn.commit()
	except Exception, e:
		conn.close()
		return "异常错误"
	else:
		conn.close()
		return "任务已删除"

def mission_view(account_name, role, mission_status="待接受|执行中|已提交|未通过|已完成"):
	#当前账户任务信息
	#account_id = get_account_id(account_name)
	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
	if str(role) == 'mission_doer':
		cursor.execute("select mission.mission_name,missions_doers.mission_id, mission.mission_publisher, mission.mission_content, mission.mission_starttime, mission.mission_plan_end_time, missions_doers.mission_status \
			from missions_doers, mission \
			where missions_doers.mission_doer = '%s' and missions_doers.mission_status = '%s' and missions_doers.mission_id = mission.mission_id;\
			"%(account_name, mission_status))
		m_list_user = cursor.fetchall()
		print "here is m_list_user = cursor.fetchall()"
		print m_list_user
		list_id = []
		for i in range(len(m_list_user)):
			list_id.append(m_list_user[i]['mission_id'])
		#将missions_doers中与mission中相同id对应的多执行者放到一个字典doerDict中，key为id，value为doers
		doerDict = {}
		for i in list_id:
			cursor.execute("select mission_doer from missions_doers where mission_id = %s ;"%i)
			m_list_doers = cursor.fetchall()
			m_list_doers_list = []
			for j in range(len(m_list_doers)):
				m_list_doers_list.append(m_list_doers[j]['mission_doer'])
			doerDict[i]=m_list_doers_list
		#将doerDict和之前只缺少doers信息的m_list_mission合并起来，构成最后返回的m_list_user
		for i in range(len(m_list_user)):
			m_list_user[i]['mission_doer']=doerDict[m_list_user[i]['mission_id']]
			m_list_user[i]['user'] = account_name
		conn.close()
		m_list_user = list(m_list_user)
		m_list_user = sorted(m_list_user, key=lambda m_list_user: m_list_user['mission_starttime'])
		return m_list_user
		print "m_list_user"
		print m_list_user
		
	elif str(role) == 'mission_publisher':
		#读取mission表中除doer以外的其他信息，并保存在m_list_mission中
	# 	cursor.execute("select distinct mission.mission_id,mission.mission_name,mission.mission_content,mission.mission_publisher,mission.mission_starttime,mission.mission_plan_end_time,missions_doers.mission_status \
	# from mission,missions_doers where missions_doers.mission_id = mission.mission_id and missions_doers.mission_status = '%s' and mission.mission_publisher = '%s';"%(mission_status,account_name))
	# 	m_list_mission = cursor.fetchall()
	# 	#读取missions_doers,mission中相同的id,并保存到list_id中
	# 	cursor.execute("select distinct mission.mission_id from mission,missions_doers \
	# 		where missions_doers.mission_id = mission.mission_id and missions_doers.mission_status = '%s' and mission.mission_publisher = '%s';"\
	# 		%(mission_status,account_name))
	# 	m_list_id = cursor.fetchall()
	# 	list_id = []
	# 	for i in range(len(m_list_id)):
	# 		list_id.append(m_list_id[i]['mission_id'])
	# 	#将missions_doers中与mission中相同id对应的多执行者放到一个字典doerDict中，key为id，value为doers
	# 	doerDict = {}
	# 	for i in list_id:
	# 		cursor.execute("select mission_doer from missions_doers where mission_status = '%s' and mission_id = %s"%(mission_status,i))
	# 		m_list_doers = cursor.fetchall()
	# 		m_list_doers_list = []
	# 		for j in range(len(m_list_doers)):
	# 			m_list_doers_list.append(m_list_doers[j]['mission_doer'])
	# 		doerDict[i]=m_list_doers_list
	# 	#将doerDict和之前只缺少doers信息的m_list_mission合并起来，构成最后返回的m_list_publisher
	# 	for i in range(len(m_list_mission)):
	# 		m_list_mission[i]['mission_doer']=doerDict[m_list_mission[i]['mission_id']]
	# 		m_list_user[i]['user'] = session.user
	# 	m_list_publisher = m_list_mission
	# 	print "m_list_publisher"
	# 	print m_list_publisher
		cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
		cursor.execute("select mission.mission_id,mission.mission_name,mission.mission_content,mission.mission_publisher,mission.mission_starttime,mission.mission_plan_end_time,missions_doers.mission_doer,missions_doers.mission_status \
			from mission,missions_doers where missions_doers.mission_id = mission.mission_id AND missions_doers.mission_status = '%s' and mission.mission_publisher = '%s';"%(mission_status,account_name))
		m_list_publisher = cursor.fetchall()
		conn.close()
		m_list_publisher = list(m_list_publisher)
		m_list_publisher = sorted(m_list_publisher, key=lambda m_list_publisher: m_list_publisher['mission_starttime'])
		return m_list_publisher
	else:
		print "no user and no publisher"+"role="+role
		return 0

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

def mission_sta_change(mission_id ,mission_status,mission_doer):
	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
	cursor.execute("update missions_doers set mission_status = '%s' WHERE mission_id = '%s' AND mission_doer = '%s' ;"%(mission_status.encode('utf-8'), mission_id,mission_doer))
	print mission_status
	conn.commit()
	conn.close()

def mission_search_list(user, arg):
 	c = data.SQLconn()
 	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
 	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
 
 	account_list = account.account_list()
 	account_list = list(account_list)
 	for i in account_list:
		#if not data.permission_check(user, i['account_name'], 'mission'):
		if not data.permission_check(user, i['account_username'], 'mission'):
			account_list.remove(i)
	account_list.append({'account_username':'user'})

	mission_list = list()
	search_list = []
	for i in account_list:
		cursor.execute("SELECT mission_id, mission_status FROM missions_doers WHERE\
			mission_doer = '%s'" % i['account_name'])
		mission_id_list = list(cursor.fetchall())
		mission_list_temp = list()
		for j in mission_id_list:
			if j['mission_status'] == '已完成':
				cursor.execute("SELECT mission_name, mission_publisher, mission_starttime,\
				mission_plan_end_time FROM history_MISSION WHERE misison_id = '%s'" % j['mission_id'])
			else:
				cursor.execute("SELECT mission_name, mission_publisher, mission_starttime,\
				mission_plan_end_time FROM MISSION WHERE misison_id = '%s'" % j['mission_id'])
			mission_list_temp += list(cursor.fetchall())
		print 'mission_list_temp:', mission_list_temp
		for k in mission_list_temp:
			k['mission_doer'] = i['account_name']
		mission_list += mission_list_temp

		print 'mission_list:', mission_list
	return mission_list
	cursor.execute("SELECT mission_name, mission_publisher, mission_doer, mission_status,\
					mission_starttime, mission_plan_end_time\
					FROM mission INNER JOIN missions_doers\
					WHERE (mission_doer='%s' OR mission_publisher='%s')\
					AND mission.mission_id=missions_doers.mission_id ;"%\
					(i['account_username'],i['account_username']))
	search_list += list(cursor.fetchall())
	cursor.execute("SELECT mission_name, mission_publisher, mission_doer,\
					mission_starttime, mission_plan_end_time\
					FROM history_MISSION\
					WHERE (mission_doer='%s' or mission_publisher='%s')"\
					%(i['account_username'], i['account_username']))
	search_list += list(cursor.fetchall())

	print search_list

	if arg == 'all':
		return search_list

	if arg.search_str != '':
		for m in search_list:
			if  arg.search_str not in m['mission_username']:
				search_list.remove(m)
	if arg.mission_doer != '':
		for m in search_list:
			if arg.mission_doer != m['mission_doer']:
				search_list.remove(m)
	if arg.mission_publisher != '':
		for m in search_list:
			if arg.mission_publisher != m['mission_publisher']:
				search_list.remove(m)
	if arg.mission_status != '':
		for m in search_list:
			if arg.mission_doer != m['mission_doer']:
				search_list.remove(m)
	if arg.mission_start_time != '':
		for m in search_list:
			if arg.mission_start_time < m['mission_starttime']:
				search_list.remove(m)
	if arg.mission_end_time != '':
		for m in search_list:
			if arg.mission_end_time > m['mission_plan_end_time']:
				search_list.remove(m)

		# print 'account:', i['account_name']
		# cursor.execute("SELECT mission_id, mission_status FROM missions_doers WHERE\
		# 	mission_doer = '%s'" % i['account_name'])
		# mission_id_list = list(cursor.fetchall())
		# mission_list_temp = list()
		# for j in mission_id_list:
		# 	if j['mission_status'] == '已完成':
		# 		cursor.execute("SELECT mission_name, mission_publisher, mission_starttime,\
		# 		mission_plan_end_time FROM history_MISSION WHERE misison_id = '%s'" % j['mission_id'])
		# 	else:
		# 		cursor.execute("SELECT mission_name, mission_publisher, mission_starttime,\
		# 		mission_plan_end_time FROM MISSION WHERE misison_id = '%s'" % j['mission_id'])
		# 	mission_list_temp += list(cursor.fetchall())
		# print 'mission_list_temp:', mission_list_temp
		# for k in mission_list_temp:
		# 	k['mission_doer'] = i['account_name']
		# mission_list += mission_list_temp

		# print 'mission_list:', mission_list

	return search_list