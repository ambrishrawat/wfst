def one_a():
	
	with open('/home/wjb31/MLSALT/MLSALT8/practicals/practical-2/files/table1.txt','r') as l_file:
		l = l_file.readlines()
	l = [lele.split() for lele in l]
	r = ''
	for i in range(1,len(l)):
		r+='0 1 '+l[i][0] + ' ' + l[i][0] + '\n'
	r += '1\n'
	with open('one_a.txt','w') as out_file:
		out_file.write(r)
	 	
	pass


def one_b():
	
	with open('/home/wjb31/MLSALT/MLSALT8/practicals/practical-2/files/table1.txt','r') as l_file:
		l = l_file.readlines()
	l = [lele.split() for lele in l]
	r = ''
	for i in range(1,len(l)):
		if l[i][0]=='<space>':
			r+='0 1 '+l[i][0] + ' ' + l[i][0] + '\n'
	r += '1\n'
	with open('one_b.txt','w') as out_file:
		out_file.write(r)
	 	
	pass

def one_c():
	
	with open('/home/wjb31/MLSALT/MLSALT8/practicals/practical-2/files/table1.txt','r') as l_file:
		l = l_file.readlines()
	l = [lele.split() for lele in l]
	r = ''
	for i in range(1,len(l)):
		if l[i][0].isupper():
			r+='0 1 '+l[i][0] + ' ' + l[i][0] + '\n'
	for i in range(1,len(l)):
		if l[i][0].islower() and l[i][0] != '<space>':
			r+='1 1 '+l[i][0] + ' ' + l[i][0] + '\n'	
	r += '1\n'
	with open('one_c.txt','w') as out_file:
		out_file.write(r)
	 	
	pass



def one_d():
	
	with open('/home/wjb31/MLSALT/MLSALT8/practicals/practical-2/files/table1.txt','r') as l_file:
		l = l_file.readlines()
	l = [lele.split() for lele in l]
	r = ''

	for i in range(1,len(l)):
		if l[i][0] != '<space>' and l[i][0] != 'a':
			r+='0 0 '+l[i][0] + ' ' + l[i][0] + '\n'
	for i in range(1,len(l)):
		if l[i][0] != '<space>':
			r+='1 1 '+l[i][0] + ' ' + l[i][0] + '\n'
	r += '0 1 a a \n'
	r += '1\n'
	with open('one_d.txt','w') as out_file:
		out_file.write(r)
	 	
	pass


if __name__ == "__main__":
	one_a()
	one_b()
	one_c()
	one_d()

