<<<<<<< HEAD
南邮通达OA系统
基于Python框架web.py，开发语言为Python，数据库:MySQL
模板说明：
	my_mission_doer.html: 我的任务模板；
						  传入数据：mission_list(二维元组), totalCount(mission_list 的长度)；
	my_mission_publisher.html: 已建任务模板；
						  传入数据：mission_list(二维元组), totalCount(mission_list 的长度)；
	mission_state.htm: 任务动态和已建任务动态的模板；
					   传入数据： mission_list(已发布);sission_list(已提交); wission_llist(未通过); yission_list（已完成）; role(即执行者还是发布者)
	view_mission_doer_j.html: 任务动态中已发布、未通过的任务详情模板，'j'即接受，模板中有接受按钮；
	view_mission_doer_t.html: 我的任务中执行中的任务详情模板，'t'即提交，模板中有提交按钮；
	view_mission_doer_m.html: 任务动态中已提交、已完成、已建任务动态中已完成 的任务详情模板，'m'即没有，模板中没有按钮；
		
	view_mission_publisher_j.html: 已建任务动态中已发布、未通过的任务的任务详情模板，模板中有修改任务，删除按钮；
	view_mission_publisher_t.html: 已建任务中执行中的任务详情模板， 模板中有修改任务，删除按钮；
	view_mission_publisher_m.html: 已建任务动态中已提交的任务详情模板， 模板中有修改任务、删除、审核通过、审核不通过按钮；

	这里的任务详情模板很多很混乱，各个模板之间的不同主要是按钮，及功能造成的，其实可以只用一个模板，用js控制显示的元素。 但是有一个问题是，被隐藏的元素从开发者工具中是可以发现的并修改，这样是不是不太安全。
=======
南邮通达OA系统
基于Python框架web.py，开发语言为Python，数据库:MySQL
模板说明：
	my_mission_doer.html: 我的任务模板；
						  传入数据：mission_list(二维元组), totalCount(mission_list 的长度)；
	my_mission_publisher.html: 已建任务模板；
						  传入数据：mission_list(二维元组), totalCount(mission_list 的长度)；
	mission_state.htm: 任务动态和已建任务动态的模板；
					   传入数据： mission_list(已发布);sission_list(已提交); wission_llist(未通过); yission_list（已完成）; role(即执行者还是发布者)
	view_mission_doer_j.html: 任务动态中已发布、未通过的任务详情模板，'j'即接受，模板中有接受按钮；
	view_mission_doer_t.html: 我的任务中执行中的任务详情模板，'t'即提交，模板中有提交按钮；
	view_mission_doer_m.html: 任务动态中已提交、已完成、已建任务动态中已完成 的任务详情模板，'m'即没有，模板中没有按钮；
		
	view_mission_publisher_j.html: 已建任务动态中已发布、未通过的任务的任务详情模板，模板中有修改任务，删除按钮；
	view_mission_publisher_t.html: 已建任务中执行中的任务详情模板， 模板中有修改任务，删除按钮；
	view_mission_publisher_m.html: 已建任务动态中已提交的任务详情模板， 模板中有修改任务、删除、审核通过、审核不通过按钮；

	这里的任务详情模板很多很混乱，各个模板之间的不同主要是按钮，及功能造成的，其实可以只用一个模板，用js控制显示的元素。 但是有一个问题是，被隐藏的元素从开发者工具中是可以发现的并修改，这样是不是不太安全。
>>>>>>> f41086b3477dec126aff19d257158dc3d3221e97
