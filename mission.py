#-*- coding: utf-8 -*-
import MySQLdb
import re
import time
import account
import datetime
import data
import difflib


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
	mission_status = "执行中"

	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	#使查询结果返回字典类型
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
	#向mission插入任务信息
	cursor.execute("insert into MISSION \
		(mission_name, mission_content, mission_pubtime, mission_starttime, mission_plan_end_time, mission_publisher)\
		value ('%s', '%s', '%s', '%s', '%s', '%s');\
		"%(mission_name.encode('utf-8'), mission_content.encode('utf-8'), mission_pubtime, mission_starttime.encode('utf-8'), mission_plan_end_time.encode('utf-8'), mission_publisher.encode('utf-8')))
	conn.commit()

	#向missions_doers中插入信息
	cursor.execute("select max(mission_id) from MISSION where mission_publisher = '%s';"%(mission_publisher))
	m_id = cursor.fetchall()
	mission_id = int(m_id[0]['max(mission_id)'])
	doers = mission_doers.split(',')
	#删除列表doers中最后一个逗号后的元素
	doers.pop()
	for doer in doers:
		cursor.execute("insert into MISSIONS_DOERS \
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
	cursor.execute("select mission_id from MISSION where mission_publisher = '%s' AND mission_pubtime = '%s';\
		"%(mission_publisher, mission_pubtime))
	id_getted = cursor.fetchall()[0]['mission_id']
	conn.close()
	return id_getted

def get_account_id(account_name):
	#获取任务id
	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
	cursor.execute("select account_id from ACCOUNT where account_name='%s';"%account_name)
	id_getted = cursor.fetchall()[0]['account_id']
	conn.close()
	return id_getted

def mission_list(account_name, role, mission_status="待接受|执行中|已提交|未通过|已完成"):
	#当前账户任务信息
	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
	if str(role) == 'mission_doer':
		cursor.execute("select MISSION.mission_name, MISSIONS_DOERS.mission_id,MISSION.mission_publisher, MISSION.mission_starttime, MISSION.mission_plan_end_time, MISSIONS_DOERS.mission_status, MISSIONS_DOERS.mission_doer \
			from MISSIONS_DOERS, MISSION \
			where MISSIONS_DOERS.mission_doer = '%s' and MISSIONS_DOERS.mission_status = '%s' and MISSIONS_DOERS.mission_id = MISSION.mission_id;\
			"%(account_name, mission_status))
		m_list_user = cursor.fetchall()
		conn.close()
		m_list_user = list(m_list_user)
		m_list_user = sorted(m_list_user, key=lambda m_list_user: m_list_user['mission_starttime'], reverse=True)
		#m_list_user包含mission_name,mission_id,mission_publisher,mission_starttime,mission_plan_end_time,mission_status,mission_doer
		return m_list_user
	elif str(role) == 'mission_publisher':
		cursor.execute("\
			select MISSION.mission_id,MISSION.mission_name,MISSION.mission_publisher,MISSION.mission_starttime,\
			MISSION.mission_plan_end_time,MISSIONS_DOERS.mission_doer,MISSIONS_DOERS.mission_status,MISSION.mission_pubtime \
			from MISSION,MISSIONS_DOERS \
			where MISSIONS_DOERS.mission_id = MISSION.mission_id AND \
			MISSIONS_DOERS.mission_status = '%s' and MISSION.mission_publisher = '%s';"%\
			(mission_status,account_name))
		m_list_publisher = cursor.fetchall()
		conn.close()
		m_list_publisher = list(m_list_publisher)
		m_list_publisher = sorted(m_list_publisher, key=lambda m_list_publisher: m_list_publisher['mission_starttime'], reverse=True)
		#m_list_publisher包含mission_id,mission_name,mission_doer,mission_publisher,mission_starttime,mission_plan_end_time,mission_status,mission_pubtime 
		return m_list_publisher
	else:
		return 0

def mission_delete(mission_id):
	#删除任务
	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor()
	try:
		cursor.execute("update MISSIONS_DOERS set mission_status='已删除' where mission_id = %s;"%(mission_id))
		conn.commit()
	except Exception, e:
		conn.close()
		return "异常错误"
	else:
		conn.close()
		return "任务已删除"

def mission_view(account_name, role, mission_status="待接受|执行中|已提交|未通过|已完成"):
	#当前账户任务信息
	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
	if str(role) == 'mission_doer':
		cursor.execute("select MISSION.mission_name,MISSION.mission_id, MISSION.mission_publisher, MISSION.mission_content, MISSION.mission_starttime, MISSION.mission_plan_end_time, MISSIONS_DOERS.mission_status,MISSION.mission_pubtime \
			from MISSIONS_DOERS, MISSION \
			where MISSIONS_DOERS.mission_doer = '%s' and MISSIONS_DOERS.mission_status = '%s' and MISSIONS_DOERS.mission_id = MISSION.mission_id;\
			"%(account_name, mission_status))
		m_list_user = cursor.fetchall()
		#将获取的m_list_user中的id存储到list_id列表中
		list_id = []
		for i in range(len(m_list_user)):
			list_id.append(m_list_user[i]['mission_id'])
		#将missions_doers中与mission中相同id对应的多执行者放到一个字典doerDict中，key为id，value为doers
		doerDict = {}
		for i in list_id:
			cursor.execute("select mission_doer from MISSIONS_DOERS where mission_id = %s ;"%i)
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
		m_list_user = sorted(m_list_user, key=lambda m_list_user: m_list_user['mission_pubtime'], reverse=True)
		return m_list_user
		
	elif str(role) == 'mission_publisher':
		cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
		cursor.execute("select MISSION.mission_id,MISSION.mission_name,MISSION.mission_content,MISSION.mission_publisher,MISSION.mission_starttime,MISSION.mission_plan_end_time,MISSIONS_DOERS.mission_doer,MISSIONS_DOERS.mission_status,MISSION.mission_pubtime \
			from MISSION,MISSIONS_DOERS where MISSIONS_DOERS.mission_id = MISSION.mission_id AND MISSIONS_DOERS.mission_status = '%s' and MISSION.mission_publisher = '%s';"%(mission_status,account_name))
		m_list_publisher = cursor.fetchall()
		conn.close()
		for i in range(len(m_list_publisher)):
			m_list_publisher[i]['user'] = m_list_publisher[i]['mission_doer']
		m_list_publisher = list(m_list_publisher)
		m_list_publisher = sorted(m_list_publisher, key=lambda m_list_publisher: m_list_publisher['mission_pubtime'], reverse=True)
		return m_list_publisher
	else:
		return 0

def mission_view_status(account_name, role, mission_id,mission_status):
	#我的任务动态中不同状态的任务点击查看详情返回值
	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
	if str(role) == 'mission_doer':
		print "account_name, mission_status, mission_id:::::::::"
		print account_name, mission_status, mission_id
		cursor.execute("select MISSION.mission_name,MISSION.mission_id, MISSION.mission_publisher, MISSION.mission_content, MISSION.mission_starttime, MISSION.mission_plan_end_time, MISSIONS_DOERS.mission_status \
			from MISSIONS_DOERS, MISSION \
			where MISSIONS_DOERS.mission_doer = '%s' and MISSIONS_DOERS.mission_status = '%s' and MISSIONS_DOERS.mission_id = '%s' and MISSIONS_DOERS.mission_id = MISSION.mission_id;\
			"%(account_name, mission_status, mission_id))
		m_list_user = cursor.fetchall()
		if len(m_list_user) == 0:
			m_list_user[0]['mission_id'] = 0
		print "m_list_user.............m_list_user"
		print m_list_user
		doerDict = {}
		cursor.execute("select mission_doer from MISSIONS_DOERS where mission_id = %s ;"%(m_list_user[0]['mission_id']))
		m_list_doers = cursor.fetchall()
		m_list_doers_list = []
		for j in range(len(m_list_doers)):
			m_list_doers_list.append(m_list_doers[j]['mission_doer'])
		doerDict[m_list_user[0]['mission_id']]=m_list_doers_list
		m_list_user[0]['mission_doer']=doerDict[m_list_user[0]['mission_id']]
		m_list_user[0]['user'] = account_name
		conn.close()
		#m_list_user包含mission_doer(all),user(one),mission_name,mission_id,mission_publisher,mission_content,mission_starttime,mission_plan_end_time,mission_status
		return m_list_user
		
	elif str(role) == 'mission_publisher':
		print "mission_status ,account_name ,mission_id"
		print mission_status ,account_name ,mission_id
		cursor.execute("\
			select MISSION.mission_id,MISSION.mission_name,MISSION.mission_content,MISSION.mission_publisher,MISSION.mission_starttime,MISSION.mission_plan_end_time,MISSIONS_DOERS.mission_status \
			from MISSION,MISSIONS_DOERS \
			where MISSIONS_DOERS.mission_id = MISSION.mission_id AND MISSIONS_DOERS.mission_status = '%s' and MISSIONS_DOERS.mission_doer = '%s' AND MISSIONS_DOERS.mission_id = '%s' ;"\
			%(mission_status,account_name,mission_id))
		m_list_publisher = cursor.fetchall()
		print "m_list_publisher uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu"
		print m_list_publisher
		#添加所有执行人
		if len(m_list_publisher) == 0:
			m_list_publisher[0]['mission_id'] = 0
		doerDict = {}
		cursor.execute("select mission_doer from MISSIONS_DOERS where mission_id = %s ;"%(m_list_publisher[0]['mission_id']))
		m_list_doers = cursor.fetchall()
		m_list_doers_list = []
		for j in range(len(m_list_doers)):
			m_list_doers_list.append(m_list_doers[j]['mission_doer'])
		doerDict[m_list_publisher[0]['mission_id']]=m_list_doers_list
		m_list_publisher[0]['mission_doer']=doerDict[m_list_publisher[0]['mission_id']]
		m_list_publisher[0]['user'] = account_name
		#类型转换
		m_list_publisher = list(m_list_publisher)
		conn.close()
		return m_list_publisher
	else:
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

def get_mission_simple_content(mission_id):
	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursors = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
	cursors.execute("SELECT mission_name, mission_content FROM MISSION WHERE mission_id = '%s'" % mission_id)
	return list(cursors.fetchall())

def mission_sta_change(mission_id ,mission_status,mission_doer):
	c = data.SQLconn()
	print "mission_id,mission_status  :"
	print mission_id
	print mission_status		
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
	cursor.execute("update MISSIONS_DOERS set mission_status = '%s' WHERE mission_id = '%s' AND mission_doer = '%s' ;"\
		%(mission_status.encode('utf-8'), mission_id, mission_doer.encode('utf-8')))
	conn.commit()
	if mission_status == '已完成':
		print "*****************into wancheng"
		cursor.execute("SELECT mission_status FROM MISSIONS_DOERS WHERE mission_id = '%s'"%mission_id)
		all_status = list(cursor.fetchall())
		check_done = True
		for m in all_status:
			if m['mission_status'] != '已完成':
				check_done = False
				print "************check_done:", check_done, m['mission_status']
		if check_done:
			print "****************chenge history_mission"
			cursor.execute("SELECT mission_doer FROM MISSIONS_DOERS WHERE mission_id = '%s'"%mission_id)
			mission_doers = list(cursor.fetchall())
			doer_str = ''
			for doer in mission_doers:
				doer_str = doer_str + doer['mission_doer'] + ','
			end_time = time.strftime('%Y-%m-%d',time.localtime(time.time()))
			cursor.execute("SELECT * FROM MISSION WHERE mission_id = '%s'"%mission_id)
			content = cursor.fetchone()
			cursor.execute("INSERT INTO HISTORY_MISSION \
							(mission_id, mission_name, mission_content, mission_starttime, \
								mission_endtime, mission_plan_end_time, mission_publisher, mission_doer) \
							VALUES\
							('%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s')"\
							%(mission_id, content['mission_name'], content['mission_content'], content['mission_starttime'],
								end_time, content['mission_plan_end_time'], content['mission_publisher'],
								doer_str))
			conn.commit()
			cursor.execute("DELETE FROM MISSION WHERE mission_id = '%s'"%mission_id)
			conn.commit()
			cursor.execute("DELETE FROM MISSIONS_DOERS WHERE mission_id = '%s'"%mission_id)
			conn.commit()
	conn.close()

def mission_search_list(user, arg):
	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)

	account_list = account.account_list()
	account_list = list(account_list)
	for i in account_list:
		if data.permission_check(user, i, 'mission') == False:
			account_list.remove(i)
		if i == 'admin':
			account_list.remove(i)

	# print 'account_list', len(account_list)
	search_list = []
	for i in account_list:
		cursor.execute("SELECT mission_name, mission_publisher, mission_doer, mission_status,\
						mission_starttime, mission_plan_end_time, MISSION.mission_id\
						FROM MISSION JOIN MISSIONS_DOERS\
						ON MISSION.mission_id=MISSIONS_DOERS.mission_id\
						WHERE mission_doer='%s' OR mission_publisher='%s'"%\
						(i,i))
		search_list += list(cursor.fetchall())
		cursor.execute("SELECT mission_name, mission_publisher, mission_doer,\
						mission_starttime, mission_plan_end_time, mission_id\
						FROM HISTORY_MISSION \
						WHERE mission_doer='%s' OR mission_publisher='%s'"\
						%(i, i))
		search_list += list(cursor.fetchall())
	# 去除重复,一点处理
	mlist = search_list
	search_list = list()
	for m in mlist:
		if m not in search_list:
			if 'mission_status' not in m:
				m['mission_status'] = '已完成'
			search_list.append(m);

	if arg == 'all':
		# print search_list
		return search_list

	mlist = list()
	for m in search_list:
		if arg.search_str == '' or arg.search_str in m['mission_name']:
			if arg.mission_publisher == '' or arg.mission_publisher == m['mission_publisher']:
				if arg.mission_doer == '' or arg.mission_doer == m['mission_doer']:
					if arg.mission_status == '' or arg.mission_status == m['mission_status']:
						if arg.mission_start_time == '' or datetime.datetime.strptime(arg.mission_start_time,"%Y-%m-%d").date() <= m['mission_starttime']:
							if arg.mission_end_time == '' or datetime.datetime.strptime(arg.mission_end_time,"%Y-%m-%d").date() >= m['mission_plan_end_time']:
								mlist.append(m)


	return mlist

def get_mission_content(mission_id, mission_doer,mission_status):
	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
	if mission_status == '已完成':
		cursor.execute("SELECT *\
	 					FROM HISTORY_MISSION \
						WHERE mission_id='%s'"%mission_id)
		mission = list(cursor.fetchall())
		if not mission:
			cursor.execute("SELECT *\
                                FROM MISSION JOIN MISSIONS_DOERS\
                                ON MISSION.mission_id=MISSIONS_DOERS.mission_id\
                                WHERE mission_doer = '%s' AND MISSION.mission_id='%s'"%(mission_doer, mission_id))
			mission += list(cursor.fetchall())
		doer_list = mission[0]['mission_doer']
		doer_list = doer_list.strip(',')
		doers = doer_list.split(',')
		mission[0]['mission_doer'] = doers
		return mission
	mission = list()
	cursor.execute("SELECT *\
	 				FROM MISSION JOIN MISSIONS_DOERS\
	 				ON MISSION.mission_id=MISSIONS_DOERS.mission_id\
					WHERE mission_doer = '%s' AND MISSION.mission_id='%s'"%(mission_doer, mission_id))
	mission += list(cursor.fetchall())
	doer_list = mission[0]['mission_doer']
	doer_list = doer_list.strip(',')
	doers = doer_list.split(',')
	mission[0]['mission_doer'] = doers
	return mission


def get_mission_reference(args):
	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
	cursor.execute("SELECT HISTORY_MISSION.mission_id, mission_name, mission_starttime, file_name, file_id\
					FROM HISTORY_MISSION left JOIN FILE\
					ON HISTORY_MISSION.mission_id=FILE.mission_id\
					")
	mission_list_all = list(cursor.fetchall())
	mission_list = list()
	if 'mission_name' in args and args.mission_name != '':
		for m in mission_list_all:
			num = difflib.SequenceMatcher(None, args.mission_name, m['mission_name']).ratio()
			print 'similer:', num
			if num > 0.7:
				mission_list.append(m)
	elif 'file_name' in args and args.file_name != '':
		for m in mission_list_all:
			num = difflib.SequenceMatcher(None, args.file_name, m['mission_name']).ratio()
			print 'similer:', num
			if num > 0.7:
				mission_list.append(m)
	return mission_list
