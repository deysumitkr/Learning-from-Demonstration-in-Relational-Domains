import math
import regions


# [NOTE]
# To add new relations:
# 1) define relation in module regions
# 2) declare the name of relation in list region_names within class RelationalWorld (relational.py)
# 3) add relevant condition in function createState within class RelationalWorld (relational.py)

class RelationalWorld:

	region_names = ['near', 'east', 'west', 'north', 'south']

	def __init__(self, state, names, regions=[]):
		regions = self.region_names
		self.state = []
		self.possibleActions = []
		self.createState(state, names)
		self.genPossibleActions(state, regions)

	def convert2mm(self, state):
		return (state[0]*1000., state[1]*1000., state[2]*1000.)
			
	def createState(self, state, names):
		for x in state.keys():
			if x in names.keys():
				self.state.append(names[x]+'('+str(x)+')')
			else:
				print '[Warning]: Object type not specified.', 'Unknown object:', x
		#self.state += ['near('+str(i)+', '+str(j)+')' for i in state.keys() for j in state.keys() if i!=j and self.eucledian(state[i], state[j]) < 80] 
		for i in state.keys():
			 for j in state.keys():
				 if i!=j:
					 p1 = self.convert2mm(state[i])
					 p2 = self.convert2mm(state[j])
					 self.state.append('near('+str(i)+', '+str(j)+')' if regions.near(p1, p2) else 'not_near('+str(i)+', '+str(j)+')')
					 self.state.append('north('+str(i)+', '+str(j)+')' if regions.north(p1, p2) else 'not_north('+str(i)+', '+str(j)+')')
					 self.state.append('east('+str(i)+', '+str(j)+')' if regions.east(p1, p2) else 'not_east('+str(i)+', '+str(j)+')')
					 self.state.append('west('+str(i)+', '+str(j)+')' if regions.west(p1, p2) else 'not_west('+str(i)+', '+str(j)+')')
					 self.state.append('south('+str(i)+', '+str(j)+')' if regions.south(p1, p2) else 'not_south('+str(i)+', '+str(j)+')')


	def genPossibleActions(self, state, regions):
		obj = state.keys()
		actions = ['action('+str(r)+', '+str(i)+', '+str(j)+')' for r in regions for i in obj for j in obj if i != j]
		self.possibleActions = actions+['done']

	def eucledian(self, x, y):
		return math.sqrt((x[0]-y[0])**2 + (x[1]-y[1])**2) 


