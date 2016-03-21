def rot13():
	
	with open('/home/wjb31/MLSALT/MLSALT8/practicals/practical-2/files/table4.txt','r') as l_file:
		l = l_file.readlines()
	l = [lele.split() for lele in l]
	l = l[1:27]
	r = ''
	for i in range(len(l)):
		if l[i][0].islower():
			r+='0 0 '+l[i][0] + ' ' + l[(i+13)%len(l)][0] + '\n'
	r += '0 0 , ,\n'
	r += '0 0 . .\n'
	r += '0 0 <space> <space>\n'
	r += '0\n'
	with open('rot13.txt','w') as out_file:
		out_file.write(r)
	 	
	pass


def rot16():
	
	with open('/home/wjb31/MLSALT/MLSALT8/practicals/practical-2/files/table4.txt','r') as l_file:
		l = l_file.readlines()
	l = [lele.split() for lele in l]
	l = l[1:27]
	r = ''
	for i in range(len(l)):
		if l[i][0].islower():
			r+='0 0 '+l[i][0] + ' ' + l[(i+16)%len(l)][0] + '\n'
	r += '0 0 , ,\n'
	r += '0 0 . .\n'
	r += '0 0 <space> <space>\n'
	r += '0\n'
	with open('rot16.txt','w') as out_file:
		out_file.write(r)

def swap():
	
	with open('/home/wjb31/MLSALT/MLSALT8/practicals/practical-2/files/table4.txt','r') as l_file:
		l = l_file.readlines()
	l = [lele.split() for lele in l]
	l = l[1:27]
	c = 1
	r = ''
	for i in range(len(l)):
		if l[i][0].islower():
			r+='0 0 '+l[i][0] + ' ' + l[i][0] + '\n'
	for i in range(len(l)):
		for j in range(len(l)):
			if l[i][0]!=l[j][0]:
				r+= '0 '+str(c) + ' ' +l[i][0] + ' ' + l[j][0] + '\n'
				r+= str(c)+' '+ '0' + ' ' +l[j][0] + ' ' + l[i][0] + '\n'
				c+=1				
	
	r += '0 0 <space> <space>\n'
	r += '0 0 , ,\n'
	r += '0 0 . .\n'
	r += '0\n'
	with open('swap.txt','w') as out_file:
		out_file.write(r)

if __name__ == "__main__":
	rot13()
	rot16()
	swap()
