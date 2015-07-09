# -*- coding: utf-8 -*-
import web
from web.httpserver import StaticMiddleware
import json
import re
import os
import time
import data
import mission
import file
#from web.contrib.template import render_jinja
from jinja2 import Environment,FileSystemLoader
import sys
reload(sys)

sys.setdefaultencoding('utf8')
web.config.debug = False

#render = web.template.render('templates/')

urls= (
	#######登陆
	'/', 'login',
	'/index', 'index',
	'/login', 'login',
	'/login_dialog.html','login_dialog',
	'/logout', 'logout',
	#######一般用户
	'/search', 'search',
	'/new_mission', 'new_mission',
	'/my_mission', 'my_mission',
	'/view_mission/(.*)', 'view_mission',
	'/modify_mission/(.*)',  'modify_mission',
	'/apply_modify_mission', 'apply_modify_mission',
	'/delete_mission','delete_mission',
	'/mission_audit/(.*)','mission_audit',
	'/upload/(.*)','upload',
	'/upload_files/(.*)','upload_files',
	'/calendar/(.*)', 'calendar',							#日历
	'/calendar_json/(.*)', 'calendar_json',

	#######admin账号
	'/new_account', 'new_account',
	'/account_list', 'account_list',
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

#session config
session = web.session.Session(app, web.session.DiskStore('sessions'),\
    initializer={'login':'', 'user':'', 'type':''})

w = app.wsgifunc(StaticMiddleware)
#gunicorn


"""
def logged():
	if session.login == 1:
		return True
	else:
		return False

def creat_render(type):
	if session.login == 1 :
		if type == 1:
			render = render_jinja(
				'templates/user',
				encoding = 'utf-8',
				)
		elif type == 2:
			render = web.template.render(
				'template/admin',
				encoding = 'utf-8',
				)
		elif type == 3:
			render = web.template.render(
				'template/super_admin',
				encoding = 'utf-8',
				)
	else:
		render = web.template.render(
			'template/communs',
			encoding = 'utf-8',
			)
	return render
"""

render = web.template.render('templates/')

def render_template(type, template_name, **context):
	extensions = context.pop('extensions', [])
	globals = context.pop('globals', {})

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

	#jinja_env.update_template_context(context)
	return jinja_env.get_template(template_name).render(context)


class index(object):
	"""首页"""
	def GET(self):
		if session.login==1:
			if session.user:
				#render = creat_render(type=session.type)
				return render_template(type=session.type,template_name='index.html',user=session.user)
			else:
				#render = creat_render(type=0)
				#return render_template(type=0,template_name='login.html',error="请重新登录")
				return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
		else:
			#render = creat_render(type=0)
			#return render_template(type=0,template_name='login.html',error="请重新登录")
			return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})

class login(object):
	"""登陆"""
	def GET(self):
		if session.login==1:
			#render = creat_render(type=session.type)
			raise web.seeother('/index')
			#return render_template(type=session.type,template_name='index.html',user=session.user)
		else:
			#render = creat_render(type=0)
			return render_template(type=0,template_name='login.html',error="")
	def POST(self):
		user = web.input().user
		#md5加密存储密码
		passwd = data.md5(web.input().passwd)
		ident = data.checkin(user)

		try:
			if len(ident)==0 :
				session.login = 0
				#render = creat_render(type=0)
				return render_template(type=0,template_name='login.html',error="用户名不存在")
				#return render.login(error="用户名不存在")
			elif passwd == ident[0]['account_password']:
				session.login = 1
				session.user = user
				session.type = ident[0]['account_name']
				#render = creat_render(session.type)
				return render_template(type=session.type,template_name='index.html',user=session.user)
				#return render.index(session.user)
			else:
				session.login = 0
				#render = creat_render(type=0)
				#return render.login(error="密码错误")
				return render_template(type=0,template_name='login.html',error="密码错误")
		except Exception, e:
			print 'loging error', e
			session.login = 0
			#render = creat_render(type=0)
			#return render.login(error="系统错误")
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
		print 'passwd is ' + passwd + 'and' + ident[0]['account_password']
		try:
			if len(ident)==0 :
				session.login = 0
				return render_template(type=0,template_name='login.html',error="用户名不存在")
			elif passwd == ident[0]['account_password']:
				session.login = 1
				session.user = user
				session.type = ident[0]['account_name']
				#return render_template(type=session.type,template_name='index.html',user=session.user)
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


class my_mission(object):
	"""任务列表"""
	def GET(self):
		if session.login == 1:
			if session.user:
				#找到当前账户所有任务
				mission_list = mission.mission_list(account_name=session.user, role='mission_doer')
				#render = creat_render(type=session.type)
				#return render.my_mission(session.user, mission_list)
				return render_template(type=session.type, template_name='my_mission.html', 
					user=session.user, mission_list=mission_list)
			else:
				return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
				#return render_template(type=0,template_name='login.html',error="请重新登录")
		else:
			return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
			#return render_template(type=0,template_name='login.html',error="请重新登录")
		

class new_mission(object):
	"""创建任务"""
	def GET(self):
		if session.login==1:
			if session.user:
				#render = creat_render(type=session.type)
				#return render.new_mission(session.user,"","","","","")
				return render_template(type=session.type, template_name='new_mission.html', 
					user=session.user,mission_name="",mission_content="",mission_starttime="",
					mission_plan_end_time="",error="")
			else:
				return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
				#return render_template(type=0,template_name='login.html',error="请重新登录")
		else:
			return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
			#return render_template(type=0,template_name='login.html',error="请重新登录")

	def POST(self):
		#登陆控制
		if session.login == 1:
			if session.user:
				mission_name = web.input().mission_name
				mission_content = web.input().mission_content
				mission_starttime = web.input().mission_starttime
				mission_plan_end_time = web.input().mission_plan_end_time
				try:
					mission_duplicate = web.input().mission_duplicate
				except:
					mission_duplicate = "off"

				#检查任务信息是否合法
				result = mission.mission_check(mission_name, mission_content, mission_starttime, mission_plan_end_time)
				ajax_result = {"statusCode":"300", "message":result}
				web.header('Content-Type', 'application/json')


				#如果任务合法，将任务信息存储进MISSION表
				if result == "no error":
					mission.mission_save(mission_name, session.user, mission_content, mission_starttime, mission_plan_end_time, mission_duplicate)
					mission_list = mission.mission_list(account_name=session.user, role='mission_doer')

					ajax_result = {"statusCode":"200", "message":"任务新添加成功", "callbackType":"closeCurrent"}
					return json.dumps(ajax_result)
					#return render_template(type=session.type, template_name='my_mission.html', 
					#user=session.user, mission_list=mission_list)

				#如果任务不合法，把已填写的表单数据返回给new_mission页面
				"""
				else:
					return render_template(
						type=session.type, template_name='new_mission.html', 
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
				#return render_template(type=0,template_name='login.html',error="请重新登录")
		else:
			return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
			#return render_template(type=0,template_name='login.html',error="请重新登录")


class delete_mission(object):
	"""删除任务"""
	def POST(self):
		mission_id = web.input().mission_id
		if session.login==1:
			if session.user:
				result = mission.mission_delete(mission_id)
				mission_list = mission.mission_list(account_name=session.user, role='mission_publisher')
				return render_template(type=session.type, template_name='my_mission.html', 
					user=session.user, mission_list=mission_list)
			else:
				return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
				#return render_template(type=0,template_name='login.html',error="请重新登录")
		else:
			return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
			#return render_template(type=0,template_name='login.html',error="请重新登录")


class modify_mission(object):
	"""修改任务 ,modify_mission.html跟new_mission.html相同, 
	区别是post提交到 apply_modify_mission, 而且post信息中需要添加mission_id"""
	
	def GET(self,arg):
		if session.login == 1:
			if session.user:
				arg = web.input()
				m = mission.mission_view(arg.mission_id)

				#render = creat_render(type=session.type)
				#return render.modify_mission(session.user,m,"")
				return render_template(
					type=session.type,
					template_name='modify_mission.html',
					user=session.user,
					mission_view=m,
					error="")
				#返回m，m[0]['mission_name'], m[0]['mission_content']等等
			else:
				return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
				#return render_template(type=0,template_name='login.html',error="请重新登录")
		else:
			return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
			#return render_template(type=0,template_name='login.html',error="请重新登录")
		
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
					#render = creat_render(type=session.type)
					#return render.modify_mission(session.user,)
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
				#return render_template(type=0,template_name='login.html',error="请重新登录")
		else:
			return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
			#return render_template(type=0,template_name='login.html',error="请重新登录")


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
					ajax_result = {"statusCode":"200", "message":"任修改成功", "callbackType":"closeCurrent"}

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
					
					#render = creat_render(type=session.type)
					#return render.modify_mission(session.user, m, result)
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
				#return render_template(type=0,template_name='login.html',error="请重新登录")
		else:
			return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
			#return render_template(type=0,template_name='login.html',error="请重新登录")


class view_mission(object):
	"""任务详情
	链接放在my_mission对应的任务名中, mission_id直接跟在/view_mission
	/view_mission/(.*)
	"""
	def GET(self,arg):
		if session.login == 1:
			if session.user:
				arg = web.input()
				m = mission.mission_view(arg.mission_id)

				#render = creat_render(type=session.type)
				#return render.view_mission(session.user,m)
				return render_template(
					type=session.type,template_name='view_mission.html',
					user=session.user,
					mission_view=m)
				#返回m，m[0]['mission_name'], m[0]['mission_content']等等
			else:
				return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
				#return render_template(type=0,template_name='login.html',error="请重新登录")
		else:
			return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
			#return render_template(type=0,template_name='login.html',error="请重新登录")

class search(object):
	"""搜索
	"""
	def GET(self):
		if session.login == 1:
			if session.user:
				#return render.search()
				return render_template(type=session.type, template_name='search.html')
			else:return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
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
				#ajax_result = {"statusCode":"200", "message":"任务新添加成功", "callbackType":"closeCurrent"}
				#return json.dumps(ajax_result)
				return render_template(type=session.type, template_name='my_mission.html', 
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
		print x
		mission_id = web.input().mission_id
		file_type = web.input().file_type
		filedir = './uploads' # change this to the directory you want to store the file in.
		if 'myfile' in x:
			file_url=x.myfile.filename.replace('\\','/')
			file_name=file_url.split('/')[-1] # splits the and chooses the last part (the filename with extension)
			fout = open(filedir +'/'+ file_name,'w') # creates the file where the uploaded file should be stored
			fout.write(x.myfile.file.read()) # writes the uploaded file to the newly created file.
			fout.close() # closes the file, upload complete.
			file_upload_time = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime())
			mission_id = 1
			file.upload(mission_id,file_name,file_url,file_upload_time,file_type)
		return json.dumps({"statusCode":"200", "message":"文件上传成功"})
		

class upload_files(object):
	def GET(self,arg):
		arg = web.input()
		file_type = arg.type
		if session.login == 1:
			if session.user:
				list = file.file_list(type=file_type)
				#render = creat_render(type=session.type)
				return render_template(type=session.type, template_name='upload_files.html',file_list=list)

			else:
				return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
				#return render_template(type=0,template_name='login.html',error="请重新登录")
		else:
			return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
		

class calendar(object):
	"""docstring for calendar"""
	def GET(self, arg):
		if session.login == 1:
			arg = web.input()
			if arg.account == 'this':
				return render_template(type=session.type, \
					template_name='calendar.html', \
					account_username='this')
		else:return json.dumps({"statusCode":"301", "message":"会话超时，请重新登录"})
		
class calendar_json(object):
	"""docstring for calendar_json"""
	def GET(self, arg):
		if session.login == 1:
			arg = web.input()
			calendar_data = data.get_calendar_data(arg)
			return data
		

######################## admin 账号 #####################################
class new_account(object):
	"""docstring for new_account"""
	def GET(self):
		if session.login == 1:
			return render_template(type = session.type,\
				template_name = 'new_account.html',\
				account_username = '')

class account_list(object):
	"""docstring for account_list"""
	def GET(self):
		if session.login == 1:
			return render_template(type = session.type,\
				template_name = 'account_list.html',\
				)
		

if __name__ == "__main__":
	app.run()
