'''
#####digits  - dgt.fst
#####tens    - tens.fst
#####2-digits- dgt2.fst

#####100     - hun.fst
#####1000    - tho.fst
#####zero_eps- zeps.fst
#####zero    - zero.fst
'''


def tens():
	with open('/home/wjb31/MLSALT/MLSALT8/practicals/practical-2/files/table3.txt','r') as l_file:
		l = l_file.readlines()
	l = [lele.split() for lele in l]
	r = ''
	c = 2
	for i in range(31,39):
		r+='0 1 '+str(c) + ' ' + l[i][0] + '\n'
		c+=1
	r += '1\n'
	with open('tens.txt','w') as out_file:
		out_file.write(r)
	pass

def dgt_teen():
	with open('/home/wjb31/MLSALT/MLSALT8/practicals/practical-2/files/table3.txt','r') as l_file:
		l = l_file.readlines()
	l = [lele.split() for lele in l]
	r = '' + '0 1 1 <eps>\n'
	c = 0
	for i in range(21,31):
		r+='1 2 '+str(c) + ' ' + l[i][0] + '\n'
		c+=1
	r += '2\n'
	with open('dgt_teen.txt','w') as out_file:
		out_file.write(r)
	pass

def dgt():
	with open('/home/wjb31/MLSALT/MLSALT8/practicals/practical-2/files/table3.txt','r') as l_file:
		l = l_file.readlines()
	l = [lele.split() for lele in l]
	r = ''
	c = 1
	for i in range(12,21):
		r+='0 1 '+str(c) + ' ' + l[i][0] + '\n'
		c+=1
	r += '1\n'
	with open('dgt.txt','w') as out_file:
		out_file.write(r)
	pass


def hun():
	r = ''
	r+='0 1 <eps> hundred\n'
	r += '1\n'
	with open('hun.txt','w') as out_file:
		out_file.write(r)

def tho():
	r = ''
	r+='0 1 <eps> thousand\n'
	r += '1\n'
	with open('tho.txt','w') as out_file:
		out_file.write(r)


def zeps():
	r = ''
	r+='0 1 0 <eps>\n'
	r += '1\n'
	with open('zeps.txt','w') as out_file:
		out_file.write(r)

def zero():
	r = ''
	r+='0 1 0 zero\n'
	r += '1\n'
	with open('zero.txt','w') as out_file:
		out_file.write(r)






if __name__ == "__main__":
	zeps()
	zero()
	dgt()
	tens()
	dgt_teen()
	hun()
	tho()
	pass

