# -*- coding: utf-8 -*-
import os
import MySQLdb
import re

def SQLconn():
	#SQL连接参数
	conn = {"host":"127.0.0.1", "user":"root", "passwd":"root", "charset":"utf8", "db":"tdoa"}
	return conn

def checkin(user):
	#校验密码
	c = SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
	print "connect mysql"
	cursor.execute("SELECT account_password,account_name FROM account WHERE account_username='%s';"%user)
	print "select passwd in mysql"
	passwd = cursor.fetchall()
	conn.close()
	return passwd

def md5(passwd):
	import hashlib
	m = hashlib.md5()
	m.update(passwd)
	return m.hexdigest()

def get_calendar_data(arg):
  	c = SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
	# print "connect mysql"
	print arg.account, arg.start, arg.end
	cursor.execute("SELECT mission_name, mission_id, mission_starttime, mission_plan_end_time FROM MISSION\
		WHERE mission_doer = '%s' AND mission_starttime BETWEEN '%s' AND '%s' OR mission_plan_end_time\
		 BETWEEN '%s' AND '%s'"\
		 %(arg.account, arg.start, arg.end, arg.start, arg.end))
	calendar_data = cursor.fetchall()
	calendar_list = list(calendar_data)
	conn.close()
	# print calendar_list
	return calendar_data
	


def permission_check(user, account, type):
	'''	user：当前操作用户
		account：要查看的用户
		type：类型
		如果允许，返回True，不允许，返回False
	'''
	if user == account:
		return True
	c = SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
	cursors.execute(
		"SELECT account_department, account_power\
		FROM ACCOUNT WHERE account_username = '%s'" % user
		)
	user_power = list(cursor.fetchall())
	cursors.execute(
		"SELECT account_department FROM account WHERE account_username = '%s'" % account
		)
	account_department = list(cursor.fetchall())

	if type == 'mission':
		#account_power1 == account_power/1000
		if user_power['account_power']/1000 == 2:
			return True
		if user_power['account_department'] == account_department:
			return true
		else:
			return False
	if type == 'calendar':
		#account_power2 == account_power%1000/100
		if user_power['account_power']%1000/100 == 2:
			return True
		if user_power['account_department'] == account_department:
			return True
		else:
			return False
	if type == 'history_mission_modify':
		#account_power3 == account_power%100/10
		if user_power['account_power']%100/10 == 1:
			return True
		return False
	if type == 'file_manage':
		#account_power4 == account_power%10
		if user_power['account_power']%10 == 1:
			return True
		return False
