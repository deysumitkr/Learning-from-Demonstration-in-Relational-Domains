import math
import regions

class RelationalWorld:

	region_names = ['near', 'east', 'west', 'north', 'south']

	def __init__(self, state, names, regions):
		self.state = []
		self.possibleActions = []
		self.createState(state, names)
		self.genPossibleActions(state, regions)

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
					 self.state.append('near('+str(i)+', '+str(j)+')' if regions.near(state[i], state[j]) else 'not_near('+str(i)+', '+str(j)+')')
					 self.state.append('east('+str(i)+', '+str(j)+')' if regions.east(state[i], state[j]) else 'not_east('+str(i)+', '+str(j)+')')
					 self.state.append('west('+str(i)+', '+str(j)+')' if regions.west(state[i], state[j]) else 'not_west('+str(i)+', '+str(j)+')')
					 self.state.append('south('+str(i)+', '+str(j)+')' if regions.south(state[i], state[j]) else 'not_south('+str(i)+', '+str(j)+')')


	def genPossibleActions(self, state, regions):
		obj = state.keys()
		actions = ['action('+str(r)+', '+str(i)+', '+str(j)+')' for r in regions for i in obj for j in obj if i != j]
		self.possibleActions = actions+['done']

	def eucledian(self, x, y):
		return math.sqrt((x[0]-y[0])**2 + (x[1]-y[1])**2) 


