# -*- coding: utf-8 -*-
import os
import MySQLdb
import re
import random, md5, datetime, StringIO
from PIL import Image, ImageFont, ImageDraw, ImageColor


def SQLconn():
	#SQL连接参数
	# conn = {"host":"qdm157632221.my3w.com", "user":"qdm157632221", "passwd":"hongyan0408", "charset":"utf8", "db":"qdm157632221_db"}
	#conn = {"host":"qdm157632221.my3w.com", "db":"qdm157632221_db", "user":"qdm157632221", "passwd":"hongyan0408", "charset":"utf8"}
	conn = {"host":"127.0.0.1", "db":"tdoa", "user":"root", "passwd":"hongyan0408", "charset":"utf8"}

	return conn

def checkin(user):
	#校验密码
	c = SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
	print "connect mysql"
	cursor.execute("SELECT account_password,account_name FROM ACCOUNT WHERE account_username='%s';"%user)
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
	cursor.execute("SELECT MISSION.mission_name, MISSION.mission_id, MISSION.mission_starttime,\
							MISSION.mission_plan_end_time\
	 				FROM MISSION JOIN MISSIONS_DOERS \
	 				ON MISSION.mission_id=MISSIONS_DOERS.mission_id\
					WHERE MISSIONS_DOERS.mission_doer = '%s'\
					AND (MISSION.mission_starttime BETWEEN '%s' AND '%s'\
					OR MISSION.mission_plan_end_time BETWEEN '%s' AND '%s')"\
		 			%(arg.account, arg.start, arg.end, arg.start, arg.end))
	calendar_data = cursor.fetchall()
	cursor.execute("SELECT mission_name, mission_id, mission_starttime, mission_endtime\
	 				FROM HISTORY_MISSION \
					WHERE mission_doer = '%s'\
					AND (mission_starttime BETWEEN '%s' AND '%s'\
					OR mission_endtime BETWEEN '%s' AND '%s')"\
		 			%(arg.account, arg.start, arg.end, arg.start, arg.end))
	calendar_data += cursor.fetchall()
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
	cursor.execute(
		"SELECT account_department, account_power\
		FROM ACCOUNT WHERE account_username = '%s'" % user
		)
	user_power = list(cursor.fetchall())
	cursor.execute(
		"SELECT account_department FROM ACCOUNT WHERE account_username = '%s'" % account
		)
	account_department = list(cursor.fetchall())

	if type == 'mission':
		#account_power1 == account_power/1000

		if user_power[0]['account_power']/1000 == 2:
			return True
		if user_power[0]['account_department'] == account_department:
			return true
		else:
			return False
	if type == 'calendar':
		#account_power2 == account_power%1000/100
		if user_power[0]['account_power']%1000/100 == 2:
			return True
		if user_power[0]['account_department'] == account_department:
			return True
		else:
			return False
	if type == 'history_mission_modify':
		#account_power3 == account_power%100/10
		if user_power[0]['account_power']%100/10 == 1:
			return True
		return False
	if type == 'file_manage':
		#account_power4 == account_power%10
		if user_power[0]['account_power']%10 == 1:
			return True
		return False



# get random color
def get_color():
	colors = ['Black','Orange','Red','Brown','DarkBlue','Purple','DarkCyan','DarkBlue']
	return ImageColor.getrgb(colors[random.randrange(1,9)-1])

# get random font-size
def get_font():
	#return ImageFont.truetype("arial.ttf", random.randrange(15,25,5))
	
	return ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf", random.randrange(15,25,5))

# make code image
def make_check_code_image(image=''):

	color = ImageColor.getrgb('white')
	#im = Image.open(image)
	im = Image.new('RGB',(60,20), color) 
	draw = ImageDraw.Draw(im)
	import hashlib
	mp = hashlib.md5()
	mp_src = mp.update(str(datetime.datetime.now())) 
	mp_src = mp.hexdigest()

	rand_str = mp_src[0:4] 
	#print rand_str
	color = ImageColor.getrgb('LightGray')
	for i in range(200):
		x = random.randrange(1,60)
		y = random.randrange(1,20)
		draw.point((x, y), fill=color)
    
	draw.text((5,1), rand_str[0], fill=get_color(), font=get_font())
	draw.text((15,1), rand_str[1], fill=get_color(), font=get_font())
	draw.text((30,1), rand_str[2], fill=get_color(), font=get_font())
	draw.text((45,1), rand_str[3], fill=get_color(), font=get_font())
	
	draw.line((0,10,60,15), fill=get_color())
	
	del draw 
	
	# session['checkcode'] = rand_str 
	#print request.session['checkcode'] 
	buf = StringIO.StringIO()   
	im.save(buf, 'png')
	buf.closed
	if image: im.save(image) 
	return rand_str, buf.getvalue()
