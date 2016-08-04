def extractCode(path):
	# path to .out file
	with open(path,'r') as f:
		data = f.read() 
	data = data.split("Equivalent prolog program:")[1]
	return data

def trainedObjects(path):
	# path to .bg file
	with open(path,'r') as f:
		bg = f.read()
	obj = [x.split('(X).')[0] for x in bg.split('object(X) :- ') if x.split('(X).')[0]]
	return obj


if __name__=='__main__':
	trainedObjects('./include/table.bg')
	
