# -*- coding: utf-8 -*-
import web
from web.httpserver import StaticMiddleware
from urllib import unquote
import json
import re
import os
import time
import data
import mission
import account
import file
import message
#from web.contrib.template import render_jinja
from jinja2 import Environment,FileSystemLoader
import sys
reload(sys)

sys.setdefaultencoding('utf8')
web.config.debug = False

urls= (
	#######登陆
	'/', 'login',
	'/index', 'index',
	'/login', 'login',
	'/login_dialog.html','login_dialog',
	'/logout', 'logout',
	'/checkcode', 'checkcode',
	# 一般用户
	'/user_setting', 'user_setting',
	'/search', 'search',
	'/search_view_mission/(.*)', 'search_view_mission',
	'/new_mission', 'new_mission',
	'/my_mission/(.*)', 'my_mission',
	'/view_mission/(.*)', 'view_mission',
	'/change_mission_sta/(.*)', 'change_mission_sta',
	'/modify_mission/(.*)',  'modify_mission',
	'/apply_modify_mission', 'apply_modify_mission',
	'/delete_mission/','delete_mission',
	'/mission_audit/(.*)','mission_audit',
	'/leave_message','leave_message',
	# 文件操作
	'/upload/(.*)','upload',
	'/upload_files/(.*)','upload_files',
	'/download_file/(.*)','download_file',
	'/download_list', 'download_list',
	# 日历
	'/calendar/(.*)', 'calendar',
	'/calendar_view/(.*)', 'calendar_view',
	'/calendar_data/(.*)', 'calendar_data',
	'/mission_content/(.*)', 'mission_content',
	'/mission_state/(.*)','mission_state',
	'/mission_reference/(.*)', 'mission_reference',
	# admin账号
	'/new_account', 'new_account',
	'/account_list/(.*)', 'account_list',
	'/view_account/(.*)', 'view_account',
	'/delete_account/(.*)','delete_account',
	'/modify_account/(.*)','modify_account',
	'/apply_modify_account','apply_modify_account',
	'/demo_page1.html','account_list',
	'/doer_info','doer_info'
	)

'''
urls= (
	'/', 'login',
	'/index', 'index',
	'/logout', 'logout',
	'/login','login'
	'/login_dialog','login_dialog',
	'/new_mission', 'new_mission',
	'/my_mission', 'my_mission',
	'/view_mission/(.*)', 'view_mission',
	'/modify_mission/(.*)',  'modify_mission',
	'/apply_modify_mission', 'apply_modify_mission',
	'/delete_mission','delete_mission',

	)
'''
app = web.application(urls, globals())

#session config，定义session能存储login,user,type三个值
session = web.session.Session(app, web.session.DiskStore('sessions'),\
    initializer={'login':'', 'user':'', 'type':'', 'checkcode':''})

w = app.wsgifunc(StaticMiddleware)

render = web.template.render('templates/')

def render_template(type, template_name, **context):
	extensions = context.pop('extensions', [])
	globals = context.pop('globals', {})
	#os.path.dirname(__file__)的作用是输出当前脚本的完整路径，这里os.path.dirname(__file__)就等于E://git/TDOA
	#合成路径文件名，此处合成结果为E://git/TDOA/templates/user
	if type=='user':
		jinja_env = Environment(
			loader=FileSystemLoader(os.path.join(os.path.dirname(__file__), 'templates/user'), encoding ='utf-8'),
			extensions=extensions,
			)
	elif type=='admin':
		jinja_env = Environment(
			loader=FileSystemLoader(os.path.join(os.path.dirname(__file__), 'templates/admin'),encoding ='utf-8'),
			extensions=extensions,
			)
	else:
		jinja_env = Environment(
			loader=FileSystemLoader(os.path.join(os.path.dirname(__file__), 'templates/communs'),encoding ='utf-8'),
			extensions=extensions,
			)
	jinja_env.globals.update(globals)
	return jinja_env.get_template(template_name).render(context)
	
class index(object):
	"""首页"""
	def GET(self):
		if session.login==1:
			if session.user:
				return render_template(type=session.type,template_name='index.html',user=session.user)
			else:
				return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
		else:
			return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})

class login(object):
	"""登陆"""
	def GET(self):
		if session.login==1:
			raise web.seeother('/index')
		else:
			return render_template(type=0,template_name='login.html',error="")
	def POST(self):
		user = web.input().user
		#md5加密存储密码
		passwd = data.md5(web.input().passwd)
		ident = data.checkin(user)
		checkcode = web.input().checkcode

		try:
			if checkcode != session['checkcode']:
				session.login = 0
				return render_template(type=0,template_name='login.html',error="验证码错误")
			elif len(ident)==0 :
				session.login = 0
				return render_template(type=0,template_name='login.html',error="用户名不存在")
			elif passwd == ident[0]['account_password']:
				session.login = 1
				session.user = user
				session.type = ident[0]['account_name']
				return render_template(type=session.type,template_name='index.html',user=session.user)
			else:
				session.login = 0
				return render_template(type=0,template_name='login.html',error="密码错误")
		except Exception, e:
			print 'login error', e
			session.login = 0
			return render_template(type=0,template_name='login.html',error="系统错误")

class login_dialog(object):
	"""登陆"""
	def GET(self):
		if session.login==1:
			return render_template(type=session.type,template_name='index.html',user=session.user)
		else:
			return render_template(type=0,template_name='login_dialog.html')
	def POST(self):
		user = web.input().user
		#md5加密存储密码
		passwd = data.md5(web.input().passwd)
		ident = data.checkin(user)
		checkcode = web.input().checkcode
		try:
			if user.checkcode != session.checkcode:
				session.login = 0
				return render_template(type=0,template_name='login.html',error="验证码错误")

			elif len(ident)==0 :
				session.login = 0
				return render_template(type=0,template_name='login.html',error="用户名不存在")
			elif passwd == ident[0]['account_password']:
				session.login = 1
				session.user = user
				session.type = ident[0]['account_name']
				return json.dumps({"statusCode":"200", "message":"登录成功", "callbackType":"closeCurrent"})
			else:
				session.login = 0
				return render_template(type=0,template_name='login.html',error="密码错误")
		except :
			session.login = 0
			return render_template(type=0,template_name='login.html',error="系统错误")

class logout(object):
	"""注销"""
	def GET(self):
		session.login=0
		session.kill()
		return render_template(type=0,template_name='login.html', error="请重新登录")


class checkcode(object):
	def GET(self):
		web.header("Content-Type",'image/gif')
		session.checkcode, pic = data.make_check_code_image()
		return pic


class user_setting(object):
	"""docstring for user_setting"""
	def GET(self):
		if session.login == 1:
			if session.user:
				user_info = account.get_account_info(session.user)
				return render_template(
						type = session.type,
						template_name = 'user_setting.html',
						user_info = user_info
					)
			else:
				return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
		else:
			return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
	def POST(self):
		if session.login == 1:
			if session.user:
				account.save_info(web.input())
				return json.dumps({"statusCode":"200", "message":"修改成功"})
				
			else:
				return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
		else:
			return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})

class my_mission(object):
	"""任务列表"""
	def GET(self, args):
		if session.login == 1:
			if session.user:
				#找到当前账户所有任务
				mission_list = mission.mission_list(account_name=session.user, role=web.input().type,mission_status='执行中')
				page_info = {'page':1}
				page_info['count'] = len(mission_list)
				mission_list = mission_list[0:30]
				return render_template(type=session.type, \
					template_name='my_'+web.input().type+'.html', 
					user=session.user, mission_list=mission_list, \
					page_info = page_info)
			else:
				return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
		else:
			return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
	def POST(self, args):
		if session.login == 1:
			if session.user:
				#找到当前账户所有任务
				args = web.input()
				mission_list = mission.mission_list(account_name=session.user, role=web.input().type,mission_status='执行中')
				page_info = {}
				page_info['page'] = pagenum = int(args.pageNum)
				page_info['count'] = len(mission_list)
				mission_list = mission_list[(pagenum-1)*30:pagenum*30]
				mission_list = mission_list[0:30]
				mission_list = mission.mission_list(account_name=session.user, role=web.input().type,mission_status='执行中')
				return render_template(type=session.type, \
					template_name='my_'+web.input().type+'.html', 
					user=session.user, \
					mission_list=mission_list, \
					page_info = page_info)
			else:
				return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
		else:
			return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})


class mission_state(object):
	"""所有任务动态"""
	def GET(self ,args):
		if session.login == 1:
			if session.user:
				mission_list = mission.mission_view(account_name = session.user, role=web.input().type, mission_status='待接受')
				sission_list = mission.mission_view(account_name = session.user, role=web.input().type, mission_status='已提交')
				wission_list = mission.mission_view(account_name = session.user, role=web.input().type, mission_status='未通过')
				yission_list = mission.mission_view(account_name = session.user, role=web.input().type, mission_status='已完成')
				#当已建任务动态为空时，防止卡死
				if not mission_list and not sission_list and not wission_list and not yission_list :
					mission_list=sission_list=wission_list=yission_list=[{}]
				return render_template(type=session.type, \
					template_name='mission_state.html', \
					user=session.user, \
					mission_list = mission_list, \
					wission_list = wission_list, \
					sission_list = sission_list, \
					yission_list = yission_list, \
					role = web.input().type)
			else:
				return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
		else:
			return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})

class new_mission(object):
	"""创建任务"""
	def GET(self):
		if session.login==1:
			if session.user:
				#返回给多选执行者下拉条
				account_list = account.account_list(account_department ='*')
				return render_template(type=session.type, \
					template_name='new_mission.html', \
					user=session.user,\
					mission_name="",\
					mission_content="",\
					mission_starttime="",\
					mission_plan_end_time="",\
					account_list=account_list,\
					error="")
			else:
				return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
		else:
			return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})

	def POST(self):
		#登陆控制
		if session.login == 1:
			if session.user:
				x = web.input(myfile={})
				mission_name = web.input().mission_name
				mission_content = web.input().mission_content
				mission_starttime = web.input().mission_starttime
				mission_plan_end_time = web.input().mission_plan_end_time
				mission_doers = web.input().mission_doers
				#检查任务信息是否合法
				result = mission.mission_check(mission_name, mission_content, mission_starttime, mission_plan_end_time)
				ajax_result = {"statusCode":"300", "message":result}
				web.header('Content-Type', 'application/json')
				#如果任务合法，将任务信息存储进MISSION表
				mission_pubtime = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime())
				if result == "no error":
					mission.mission_save(mission_name, mission_content, mission_starttime, mission_plan_end_time, session.user, mission_doers,mission_pubtime)
					#获取到mission_id的值
					mission_id = mission.mission_id_get(session.user, mission_pubtime)
					file_type = 0
					user = session.user
					filedir = 'uploads/'+user # change this to the directory you want to store the file in.
					file.create_dir(filedir) #create dir if the dir is not exist
					if 'myfile' in x:
						file_url=x.myfile.filename.replace('\\','/')
						print "file_url = x.myfile.filename = :"
						print file_url
						file_name=file_url.split('/')[-1] # splits the and chooses the last part (the filename with extension)
						file_url = './uploads/'+user+'/'+file_name
						fout = open(filedir +'/'+ file_name,'wb') # creates the file where the uploaded file should be stored
						fout.write(x.myfile.file.read()) # writes the uploaded file to the newly created file.
						fout.close() # closes the file, upload complete.
						file_upload_time = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime())
						file.upload(mission_id,file_name,file_url, user,file_upload_time,file_type)
						ajax_result = {"statusCode":"200", "message":"任务新添加成功", "callbackType":"closeCurrent"}
						return json.dumps(ajax_result)
				#如果任务不合法，把已填写的表单数据返回给new_mission页面
				"""
				else:
					return render_template(
						type=session.type, 
						template_name='new_mission.html', 
						user=session.user, 
						mission_name=mission_name, 
						mission_content=mission_content, 
						mission_starttime=mission_starttime,
						mission_plan_end_time=mission_plan_end_time, 
						error=result
						)
				"""
			else:
				return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
		else:
			return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})

class delete_mission(object):
	"""删除任务"""
	def POST(self):
		mission_id = web.input().mission_id
		#mission_status = web.input().mission_status
		print mission_id
		if session.login==1:
			if session.user:
				result = mission.mission_delete(mission_id)
				#mission_list = mission.mission_list(account_name=session.user, role='mission_publisher',mission_status=mission_status)
				return json.dumps({"statusCode":"200", "message":"删除成功！"})
			else:
				return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
		else:
			return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})

class modify_mission(object):
	"""修改任务 ,modify_mission.html跟new_mission.html相同, 
	区别是post提交到 apply_modify_mission, 而且post信息中需要添加mission_id"""
	
	def GET(self,arg):
		if session.login == 1:
			if session.user:
				arg = web.input()
				m = mission.mission_view(arg.mission_id)
				print "m = mission.mission_view(arg.mission_id)"
				return render_template(
					type=session.type,
					template_name='modify_mission.html',
					user=session.user,
					mission_view=m,
					error="")
			else:
				return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
		else:
			return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
		
	def POST(self):
		"""接收mission_id,"""
		if session.login == 1:
			if session.user:
				try:
					m = mission.mission_view(web.input().mission_id)
					return render_template(
					type=session.type,
					template_name='modify_mission.html',
					user=session.user,
					mission_view=m,
					error="修改任务")
				except Exception, e:
					print e
					return render_template(
					type=session.type,
					template_name='modify_mission.html',
					user=session.user,
					mission_view=m,
					error="出现未知错误，请重试"
					)
				
				#通过mission_id获取任务信息，作为表单的默认值返回给modify_mission.html
				#最后多了一个参数mission_id

			else:
				return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
		else:
			return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})


class apply_modify_mission(object):
	"""应用任务修改, 成功返回my_mission.html，失败返回modify_mission.html继续修改"""
	def POST(self):
		#需要接收mission_id
		if session.login == 1:
			if session.user:
				mission_id = web.input().mission_id
				#先添加任务，再把原来的任务删除
				#创建任务
				try:
					mission_duplicate = web.input().mission_duplicate
				except Exception, e:
					mission_duplicate = "off"
				#检查输入信息
				result = mission.mission_check(web.input().mission_name, \
					web.input().mission_content, web.input().mission_starttime, web.input().mission_plan_end_time)

				if result == "no error":
					#存储任务信息
					mission.mission_save(web.input().mission_name, session.user, \
						web.input().mission_content, web.input().mission_starttime, \
						web.input().mission_plan_end_time, mission_duplicate)
					mission_list = mission.mission_list(account_name=session.user, role='mission_publisher')
					#return render.my_mission(session.user, mission_list)
					ajax_result = {"statusCode":"200", "message":"任务修改成功", "callbackType":"closeCurrent"}

					try:
						result_del = mission.mission_delete(mission_id)
					except Exception, e:
						print e
					finally:
						mission_list = mission.mission_list(account_name=session.user, role='mission_publisher')
						return json.dumps(ajax_result)
				else:
					m = mission.mission_structure(mission_name=web.input().mission_name, \
						mission_content=web.input().mission_content, \
						mission_starttime=web.input().mission_starttime, \
						mission_plan_end_time=web.input().mission_plan_end_time, \
						mission_id=mission_id)
					
					return render_template(
					type=session.type,
					template_name='modify_mission.html',
					user=session.user,
					mission_view=m,
					error=result
					)
				#删除任务
				"""
				try:
					result_del = mission.mission_delete(mission_id)
				except Exception, e:
					print e
				finally:
					mission_list = mission.mission_list(account_name=session.user, role='mission_publisher')

					#render = creat_render(type=session.type)
					#return render.my_mission(session.user, mission_list)
					return render_template(type=session.type, template_name='my_mission.html', 
					user=session.user, mission_list=mission_list)
				"""
			else:
				return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
		else:
			return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})

class view_mission(object):
	"""任务详情
	链接放在my_mission对应的任务名中, mission_id直接跟在/view_mission
	/view_mission/(.*)
	"""
	def GET(self,arg):
		if session.login == 1:
			if session.user:
				mission_status = web.input().mission_status
				role = web.input().type
				mission_sta = web.input().mission_sta
				mission_id = web.input().mission_id
				if role == 'mission_doer':
					mission_doer = session.user
				elif role == 'mission_publisher':
					if mission_status == '已提交' or mission_status == '待接受' or mission_status == '未通过' or mission_status == '已完成':
						role = 'mission_doer'
					mission_doer = web.input().mission_doer
				else:
					print "not mission_doer and not mission_publisher"
				print "mission_doer,role,mission_id,mission_status"
				print mission_doer
				print role
				print mission_id
				print mission_status
				m = mission.mission_view_status(mission_doer,role,mission_id,mission_status)
				length = len(m)
				print "message_list = message.message_list(mission_id)iiiiiiiiiiiiiiiiiiiiiiiii"
				# message_list = message.message_list(mission_id, web.input().type, session.user, m[0]['mission_publisher'])
				message_list = message.message_list(mission_id)
				#当任务无留言记录时赋空值
				if not message_list :
					message_list = [{}]
				print ".....mmmmmmmmmmmmmmmmmmmmmmmm."
				return render_template(
					type=session.type,template_name='view_'+web.input().type+'_'+mission_sta+'.html',
					user=session.user,
					mission_view=m,
					length = length,
					mission_doer = mission_doer,
					message_list = message_list)

				#返回m，m[0]['mission_name'], m[0]['mission_content']等等
			else:
				return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
		else:
			return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})



class change_mission_sta(object):
	def GET(self, args):
		if session.login == 1:
			if session.user:
				args = web.input()
				#更改任务动态
				if str(args.type) == 'mission_doer':
					mission_doer = session.user
				elif str(args.type) == 'mission_publisher':
					mission_doer = args.mission_doer
				else:
					print "not mission_doer and not mission_publisher"
				mission.mission_sta_change(args.mission_id, unquote(args.mission_status),mission_doer)
				#ws_file
				if args.mission_status == ('已完成').decode('utf-8'):
					print "mission_doer...........................mission_doer"
					print mission_doer
					file.file_type_change(args.mission_id,mission_doer)
				#更改后跳转
				mission_list = mission.mission_list(account_name=session.user, role=web.input().type,mission_status='执行中')
				page_info = {'page':1}
				page_info['count'] = len(mission_list)
				mission_list = mission_list[0:30]
				return render_template(type=session.type, template_name='my_'+web.input().type+'.html', 
					user=session.user, mission_list=mission_list, page_info = page_info)
				#返回m，m[0]['mission_name'], m[0]['mission_content']等等
			else:
				return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
		else:
			return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})

class search(object):
	"""搜索
	"""
	def GET(self):
		if session.login == 1:
			if session.user:
				mission_list = mission.mission_search_list(session.user, 'all')
				return render_template(
					type=session.type,
					template_name='search.html',
					mission_list = mission_list[0:30],
					account_list = account.account_list(),
					count = len(mission_list),
					arg = [{'page':1}]
					)
			else:return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
		else:return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
	def POST(self):
		if session.login == 1:
			if session.user:
				arg = web.input()
				mission_list_all = mission.mission_search_list(session.user, arg)
				if arg.has_key('pageNum'):
					page = int(arg.pageNum) - 1
					mission_list_cut = mission_list_all[page*30:int(arg.pageNum)*30]
				else:
					arg['pageNum'] = 1
					mission_list_cut = mission_list_all[0:30]
				return render_template(
					type=session.type,
					template_name='search.html',
					mission_list = mission_list_cut,
					account_list = account.account_list(),
					count = len(mission_list_all),
					arg = arg
					)
			else:return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
		else:return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})


class search_view_mission(object):
	"""docstring for search_view_mission"""
	def GET(self, arg):
		if session.login == 1:
			arg = web.input()
			return render_template(
					type = session.type,
					template_name = 'search_view_mission.html',
					mission_view = mission.get_mission_content(arg.mission_id, arg.mission_doer, arg.mission_status)
				)
		else:return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})

class mission_audit(object):
	"""docstring for mission_audit"""
	def GET(self,arg):
		if session.login == 1:
			if session.user:
				arg = web.input()
				mission_id = arg.mission_id
				mission.mission_audit(mission_id)
				mission_list = mission.mission_list(account_name=session.user, role='mission_publisher')
				return render_template(type=session.type, template_name='my_mission_publisher.html', 
					user=session.user, mission_list=mission_list)
			else:return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
		else:return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})


class upload(object):
	def GET(self,arg):
		arg = web.input()
		m = arg.mission_id
		return render_template(type=session.type, template_name='upload.html', mission_id=m)
		
	def POST(self,arg):
		x = web.input(myfile={})
		mission_id = web.input().mission_id
		file_type = 1
		user = session.user
		filedir = 'uploads/'+user # change this to the directory you want to store the file in.
		file.create_dir(filedir) #create dir if the dir is not exist
		if 'myfile' in x:
			file_url=x.myfile.filename.replace('\\','/')
			file_name=file_url.split('/')[-1] # splits the and chooses the last part (the filename with extension)
			file_url = './uploads/'+user+'/'+file_name
			fout = open(filedir +'/'+ file_name,'wb') # creates the file where the uploaded file should be stored
			fout.write(x.myfile.file.read()) # writes the uploaded file to the newly created file.
			fout.close() # closes the file, upload complete.
			file_upload_time = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime())
			file.upload(mission_id,file_name,file_url, user,file_upload_time,file_type)
		return json.dumps({"statusCode":"200", "message":"文件上传成功"})

class upload_files(object):
	def GET(self,arg):
		arg = web.input()
		file_type = arg.type
		if session.login == 1:
			if session.user:
				# if file_type == '0' or file_type == '1':
				mission_id = arg.mission_id
				role = arg.role.rstrip(',')
				list = file.file_list(file_type, mission_id, role)
				return render_template(type=session.type, template_name='upload_files.html',file_list=list)
				# elif file_type == '2':
				# 	mission_name = arg.mission_name
					#这里需要从mission表中搜索与mission_name类似的mission_id
					#再带着mission_id搜索file表
					# return json.dumps({"statusCode":"200","message":"历史任务参考搜索算法没定"})
			else:
				return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
				#return render_template(type=0,template_name='login.html',error="请重新登录")
		else:
			return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
class download_file(object):
	#实现文件下载
	def GET(self,arg):
		if session.login == 1:
			if session.user:
				file_url = web.input().file_url
				file_name = web.input().file_name				
				try:
					file_obj = open(file_url,'rb')
					web.header('Content-Type','application/octet-stream')
					web.header('Content-disposition','attachment;filename="%s"'%file_name)
					f = file_obj.read()
					return f
				except:
					print 'error'
				finally:
					file_obj.close()
				#大文件下载使用下面方法
				# 	while True:
				# 		BUF_SIZE = 1024
				# 		c = file_obj.read(BUF_SIZE)
				# 		if c:
				# 			yield c
				# 		else:
				# 			break
				# except Exception, e:
				# 	print e
				# 	yield 'Error'
				# finally:
				# 	file_obj.close()


class download_list(object):
	"""docstring for file"""
	def GET(self):
		if session.login:
			file_list = file.get_download_list(type='all')
			return render_template(
									type = session.type,
									template_name='download_list.html',
									files = file_list[0:30],
									args = '',
									page_num = 1, count_num = len(file_list)
									)
		else:return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
	def POST(self):
		if session.login:
			args = web.input()
			file_list = file.get_download_list('search', args=args)
			if 'pageNum' not in args:
				page = 1
			else:
				page = int(args.pageNum)
			return render_template(
									type = session.type,
									template_name='download_list.html',
									files = file_list[(page-1)*30:page*30],
									args = args,
									page_num = page, count_num = len(file_list)
									)
		else:return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})

		
class calendar(object):
	"""docstring for calendar"""
	def GET(self, arg):
		if session.login == 1:
			arg = web.input()
			if data.permission_check(session.user, arg.account, 'calendar'):
				return render_template(
					type = session.type,
					template_name = 'calendar.html',
					account_username = arg.account
					)
			else:
				return json.dumps({"statusCode":"300", "message":"对不起，您没有查看权限"})
		else:return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})


class calendar_view(object):
	"""docstring for calendar_view"""
	def GET(self, arg):
		if session.login == 1:
			arg = web.input()
			if data.permission_check(session.user, arg.account, 'calendar'):
				return render_template(
					type = session.type,
					template_name = 'calendar_dialog.html',
					user = arg.account
					)
			else:
				return json.dumps({"statusCode":"300", "message":"对不起，您没有查看权限"})
		else:return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
		
		
class calendar_data(object):
	"""docstring for calendar_data"""
	def GET(self, arg):
		if session.login == 1:
			arg = web.input()
			if data.permission_check(session.user, arg.account, 'calendar'):
				calendar_data = data.get_calendar_data(arg)
				return render_template(type = session.type,
					template_name='calendar.json',\
					mission_list = calendar_data)
		

class mission_content(object):
	"""docstring for mission_content"""
	def GET(self, arg):
		if session.login == 1:
			arg = web.input()	
			mission_content = mission.get_mission_simple_content(arg.mission_id)
			return '任务名称：%s 任务内容：%s'%(mission_content[0]['mission_name'],mission_content[0]['mission_content'])
class leave_message(object):
	def POST(self):
		if session.login == 1:
			if session.user:
				message_content = web.input().msg
				mission_id = web.input().mission_id
				message_type = web.input().message_type
				# message_obj = web.input().message_obj
				# if privacy in web.input():
				# 	privacy = web.input().privacy
				# elif privacy = 0
				message_time = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime())
				if message_content.strip() == '':
					return json.dumps({"statusCode":"302", "message":"留言不能为空"})

				message.message_save(mission_id, message_content, message_time, session.user, message_type)
				return json.dumps({"statusCode":"200", "message": "留言成功"})
			else:return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
		else:return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})


class mission_reference(object):
	"""docstring for mission_reference"""
	def GET(self, args):
		if session.login == 1:
			args = web.input()
			mission_list = mission.get_mission_reference(args)
			return render_template(
					type = session.type,
					template_name = 'mission_reference.html',
					mission_list = mission_list
				)
		else:return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
	def POST(self, args):
		if session.login == 1:
			args = web.input()
			mission_list = mission.get_mission_reference(args)
			return render_template(
					type = session.type,
					template_name = 'mission_reference.html',
					mission_list = mission_list
				)
		else:return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})

######################## admin 账号 #####################################
class new_account(object):
	"""docstring for new_account"""
	def GET(self):
		if session.login == 1:
			return render_template(type = session.type,\
				template_name = 'new_account.html',\
				account_username = '')
	def POST(self):
		#添加新用户
		if session.login == 1:
			if session.user:
				account_name = web.input().account_name
				account_sex = web.input().account_sex
				account_username = web.input().account_username
				account_work = web.input().account_work
				account_position = web.input().account_position
				account_phone = web.input().account_phone
				account_address = web.input().account_address
				account_email = web.input().account_email
				account_department = web.input().account_department
				account_power1 = web.input().account_power1
				account_power2 = web.input().account_power2
				account_power3 = web.input().account_power3
				account_power4 = web.input().account_power4
				account_power = int(account_power1)*1000+int(account_power2)*100+int(account_power3)*10+int(account_power4)
				#检查账号信息是否合法
				result = account.account_check(account_name, account_sex, account_username, account_work, account_position, account_phone,account_address,account_email,account_department, account_power)
				ajax_result = {"statusCode":"300", "message":result}
				web.header('Content-Type', 'application/json')
				if result == "no error":
					#将用户信息存储到数据库中
					account.account_save(account_name, account_sex, account_username, account_work, account_position, account_phone,account_address,account_email,account_department, account_power)
					#这里account_list是干啥的？
					account_list = account.account_list(account_department = '*')
					ajax_result = {"statusCode":"200", "message":"账号添加成功", "callbackType":"closeCurrent"}
					return json.dumps(ajax_result)
			else:
				return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
		else:
			return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})

class account_list(object):
	"""docstring for account_list"""
	def GET(self,args):
		if session.login == 1:
			if session.user:
				args = web.input()
				a = account.account_list_view(args.type)
				return render_template(type = session.type,\
					template_name = 'account_list.html',\
					user=session.user,\
					account_list=a,
					length = len(a))
			else:
				return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
				#return render_template(type=0,template_name='login.html',error="请重新登录")
		else:
			return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
			#return render_template(type=0,template_name='login.html',error="请重新登录")
class view_account(object):
	"""账号详情
	链接放在account_list对应的任务中，account_id 直接跟在/view_account/iew_mission/(.*)
	"""
	def GET(self,args):
		if session.login == 1:
			if session.user:
				args = web.input()
				a = account.account_view(args.account_id)
				return render_template(
					type=session.type,
					template_name='view_account.html',
					user=session.user,
					account_view=a)
			else:
				return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
		else:
			return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
	def POST(self,args):
		if session.login == 1:
			if session.user:
				args = web.input()
				a = account.account_list_view(account_department = '*')
				return render_template(type = session.type,\
					template_name = 'account_list.html',\
					user=session.user,\
					account_list=a,
					length = len(a))
			else:
				return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
		else:
			return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})

class delete_account(object):
	"""删除帐号"""
	def POST(self, arg):
		args = web.input()
		print args
		if session.login == 1:
			if session.user:
				result = account.account_delete(args.account_id)
				print result
				return json.dumps({"statusCode":"200", "message":"账号删除成功"})
			else:
				return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
		else:
			return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
class modify_account(object):
	"""修改账号信息，modify_mission.html与new_account.html相同，
	区别是post提交到 apply_modify_account, 而且post信息中需要添加account_id"""
	def GET(self,args):
		if session.login == 1:
			if session.user:
				args = web.input()
				account_view = account.account_view(args.account_id)
				return render_template(
					type=session.type,
					template_name='modify_account.html',
					user=session.user,
					account_view=account_view,
					error="")
			else:
				return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
		else:
			return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
	def POST(self):
		"""接受account_id,"""
		if session.login == 1:
			if session.user:
				try:
					a = account.account_view(web.input().mission_id)
					return render_template(
					type=session.type,
					template_name='modify_account.html',
					user=session.user,
					account_view=a,
					error="修改任务")
				except Exception, e:
					print e
					return render_template(
					type=session.type,
					template_name='modify_account.html',
					user=session.user,
					account_view=a,
					error="出现未知错误，请重试"
					)
			else:
				return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
		else:
			return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
class apply_modify_account(object):
	"""账号信息修改，成功返回account_list.html,失败返回modify_account.html继续修改"""
	def POST(self):
		#需要接收account_id
		if session.login == 1:
			if session.user:
				account_id = web.input().account_id
				account_sex = web.input().account_sex
				account_name = web.input().account_name
				account_username = web.input().account_username
				account_work = web.input().account_work
				account_email = web.input().account_email
				account_phone = web.input().account_phone
				account_position = web.input().account_position
				account_address = web.input().account_address
				account_department = web.input().account_department
				account_power1 = web.input().account_power1
				account_power2 = web.input().account_power2
				account_power3 = web.input().account_power3
				account_power4 = web.input().account_power4
				account_power = int(account_power1)*1000+int(account_power2)*100+int(account_power3)*10+int(account_power4)
				#检查输入信息
				result = account.account_check(account_name, account_sex, account_username, account_work,account_position,account_phone, account_address, account_email, account_department, account_power)
				if result == "no error":
					#存储任务信息
					account.account_update(account_name, account_sex, account_username, account_work,account_position,account_phone, account_address, account_email, account_department, account_power,account_id)
					account_list = account.account_list('*')
					ajax_result = {"statusCode":"200", "message":"账号修改成功", "callbackType":"closeCurrent"}
					return json.dumps(ajax_result)
			else:
				return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
		else:
			return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})

class doer_info(object):
	"'点击姓名查看执行者信息'"
	def GET(self):
		if session.login == 1:
			if session.user:
				account_info = account.get_account_info(web.input().doer)
				print "account_info"
				print account_info
				return render_template(
					type=session.type,
					template_name='doer_info.html',
					account_view=account_info)
			else:
				return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
		else:
			return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})

if __name__ == "__main__":
	app.run()
