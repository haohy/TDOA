test = '王松,王松松,傻逼,王雪松'
str = test.split(',')
reg = ''
for i in str:
	reg = reg +i+'{1}'
reg = reg+',{1}'
Reg = reg.strip()
print Reg