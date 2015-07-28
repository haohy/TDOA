#-*- coding: utf-8 -*-
import MySQLdb
import re
import data
import cnsort

#检查新建帐户信息是否合法
def account_check(account_name, account_sex, account_username, account_work, account_position, account_phone,account_address,account_email,account_department, account_power):
	check_result = ""
	if len(account_username)==0:
		check_result = "请填写 账号名"
		return check_result
	elif account_name != "user" and account_name !="admin":
		check_result = "请选择账号权限"
		return check_result
	elif len(account_work)==0:
		check_result = "请填写 工号"
		return check_result
	elif len(account_position)==0:
		check_result = "请填写职位"
		return check_result
	elif len(account_phone)!=11 or re.match("[0-9]{11}",account_phone) == None:
		check_result = "请检查手机号"
		return check_result
	elif len(account_address) == 0:
		check_result = "请输入住址"
		return check_result
	elif len(account_email)<8 or re.match("^.+\\@(\\[?)[a-zA-Z0-9\\-\\.]+\\.([a-zA-Z]{2,3}|[0-9]{1,3})(\\]?)$", account_email) == None:
		check_result = "请检查邮箱格式是否正确"
		return check_result
	elif account_department == 0:
		check_result = "请选择所属科室"
		return check_result
	elif account_power/1000<1 or account_power/1000>3:
		check_result = "请选择任务权限"
		return check_result
	elif account_power%1000/100<1 or account_power%1000/100>3:
		check_result = "请选择日程权限"
		return check_result
	elif account_power%100/10<1 or account_power%100/10>2:
		check_result = "请选择修改已保存任务权限"
		return check_result
	elif account_power%10<1 or account_power%10>2:
		check_result = "请选择附件管理权限"
		return check_result
	else:
		check_result = "no error"
		return check_result
	return "未知错误"

def account_save(account_name, account_sex, account_username, account_work, account_position, account_phone,account_address,account_email,account_department, account_power):
	#存储账号信息
	#设置默认密码user:123456, admin: admin
	if account_name == 'user':
		account_password = data.md5('123456')
	elif account_name == 'admin':
		account_password = data.md5('admin')
	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
	cursor.execute("insert into account \
		(account_password, account_name, account_sex, account_username, account_work, account_position, account_phone,account_address,account_email,account_department, account_power)\
		value ('%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s');\
		"%(account_password, account_name.encode('utf-8'), account_sex.encode('utf-8'), account_username.encode('utf-8'), account_work.encode('utf-8'), account_position.encode('utf-8'), account_phone.encode('utf-8'),account_address.encode('utf-8'),account_email.encode('utf-8'),account_department.encode('utf-8'),account_power))
	conn.commit()
	conn.close()
def account_list(account_department = '*'):
	#搜索对应科室部门的所有账号
	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
	if account_department != '*':
		account_department = int(account_department)
		cursor.execute("select * from account where account_department='%s';"%account_department)
	elif account_department =='*':
		cursor.execute("select account_username from account where account_name='user';")
	account_username = cursor.fetchall()
	a = []
	for i in range(len(account_username)):
		a.append(account_username[i]['account_username'])
	a = cnsort.cnsort(a)
	conn.close()
	return a

def account_list_view(account_department = '*'):
	#搜索对应科室部门的所有账号
	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
	if account_department != '*':
		cursor.execute("select * from account where account_department='%s';"%account_department)
	elif account_department =='*':
		cursor.execute("select * from account where account_name='user';")
	a = cursor.fetchall()
	conn.close()
	return a

def account_view(account_id):
	#搜索对应account_id所对应的信息
	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
	cursor.execute("select * from account where account_id='%s';"%account_id)
	a = cursor.fetchall()
	conn.close()
	return a

def account_structure(account_name, account_username, account_work, account_email, account_phone, account_position, account_department, account_power):
	"'将账户信息存储在字典中'"
	a = ({\
		'account_name': account_name, \
		'account_username': account_username, \
		'account_work': account_work, \
		'account_email': account_email, \
		'account_phone': account_phone, \
		'account_position': account_position, \
		'account_department': account_department, \
		'account_power': account_power \
		},)
	return a

def account_delete(account_id):
	#删除对应account_id的全部信息
	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
	cursor.execute("delete from account where account_id = '%s';"%account_id)
	conn.commit()
	conn.close()

def account_update(account_name, account_sex, account_username, account_work, account_position, account_phone,account_address,account_email,account_department, account_power,account_id):
	#跟新account_id 对应账号的信息
	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)
	cursor.execute("update account set \
			account_name = '%s', \
			account_sex = '%s',\
			account_username = '%s', \
			account_work = '%s', \
			account_email = '%s', \
			account_phone = '%s', \
			account_position = '%s', \
			account_department = '%s', \
			account_address = '%s',\
			account_power = '%s' \
			where account_id = '%s';"%(account_name.encode('utf-8'), account_sex.encode('utf-8'), account_username.encode('utf-8'), account_work.encode('utf-8'), account_email.encode('utf-8'), account_phone.encode('utf-8'), account_position.encode('utf-8'), account_department.encode('utf-8'),account_address.encode('utf-8'), account_power, account_id))
	conn.commit()
	conn.close()

def get_account_info(user):
	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)

	cursor.execute("SELECT * FROM account WHERE account_username='%s'"%user)
	account_info = cursor.fetchone()
	return account_info

def save_info(args):
	c = data.SQLconn()
	conn = MySQLdb.connect(host=c["host"], user=c["user"], passwd=c["passwd"], charset=c["charset"], db=c["db"])
	cursor = conn.cursor(cursorclass = MySQLdb.cursors.DictCursor)

	cursor.execute("update account SET \
					account_username='%s', \
					account_sex = '%s',\
					account_phone='%s', \
					account_email='%s', \
					account_address = '%s'\
					WHERE account_id = %s\
					;"% (args.username, args.account_sex,args.phone,\
					args.email,str(args.account_address).encode('utf-8'), args.id))
	conn.commit()
	conn.close()
	return True