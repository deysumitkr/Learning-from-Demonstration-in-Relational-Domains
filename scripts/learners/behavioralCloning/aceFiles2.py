class AceFiles:

## creates files required for ACE
## 
## Data Structures:
## states: list of state
## state: [[list of state features in prolog syntax], {dictionary of labelled actions}]
## objects: list of object names. Duplicates should be removed
## regions: list of regions. Duplicates should be removed

	def __init__(self, states, objects, regions):
		self.kb = self.genKB(states)
		self.bg = self.genBG(objects, regions)
		self.s = self.genSettings(objects, regions)


	def genKB(self, states):
		kb = ''
		count = 1
		for state in states:
			s = '.\n'.join(state[0])+'.\n'
			for act in state[1].keys():
				eg = s + act+'.\n' + state[1][act][0]+'.\n'
				for loop in range(state[1][act][1]):
					egf = 'begin(model(example'+str(count)+')).\n' + eg + 'end(model(example'+str(count)+')).\n\n'
					count+=1
					kb += egf
		return kb 


	def genBG(self, objects, regions):
		bg = ''
		for obj in objects:
			bg += 'object(X) :- '+obj+'(X).\n'
			bg += 'not_'+obj+'(X) :- object(x), not('+obj+'(X)).\n'

		for reg in regions:
			bg += 'not_'+reg+'(X,Y) :- object(X), object(Y), not('+reg+'(X,Y)).\n'

		bg += 'isValid(X,Y) :- object(X), object(Y), not(near(X,Y)).\n'
		return bg
			

	def genRmodeSettings(self, objects, regions):
		rmode = []

		for obj in objects:
			rmode.append(obj+'(+-X)')
			rmode.append('not_'+obj+'(+-X)')

		for reg in regions:
			rmode.append(reg+'(+-X, +-Y), not(X==Y)')
			rmode.append('not_'+reg+'(+-X, +-Y), not(X==Y)')

		for reg in regions:
			for obj in objects:
				rmode.append(obj+'(+-X), ' + reg+'(X, +-Y), not(X==Y)')
				rmode.append(obj+'(+-Y), ' + reg+'(+-X, Y), not(X==Y)')

				rmode.append('not_'+obj+'(+-X), ' + reg+'(X, +-Y), not(X==Y)')
				rmode.append('not_'+obj+'(+-Y), ' + reg+'(+-X, Y), not(X==Y)')

				rmode.append(obj+'(+-X), ' + 'not_'+reg+'(X, +-Y), not(X==Y)')
				rmode.append(obj+'(+-Y), ' + 'not_'+reg+'(+-X, Y), not(X==Y)')

				rmode.append('not_'+obj+'(+-X), ' + 'not_'+reg+'(X, +-Y), not(X==Y)')
				rmode.append('not_'+obj+'(+-Y), ' + 'not_'+reg+'(+-X, Y), not(X==Y)')

		for reg in regions:
			for obj1 in objects:
				for obj2 in objects:
					rmode.append(obj1+'(+-X), ' + obj2+'(+-Y), ' + reg+'(X, Y), not(X==Y)')
					rmode.append('not_'+obj1+'(+-X), ' + obj2+'(+-Y), ' + reg+'(X, Y), not(X==Y)')
					rmode.append(obj1+'(+-X), ' + 'not_'+obj2+'(+-Y), ' + reg+'(X, Y), not(X==Y)')
					rmode.append('not_'+obj1+'(+-X), ' + 'not_'+obj2+'(+-Y), ' + reg+'(X, Y), not(X==Y)')

					rmode.append(obj1+'(+-X), ' + obj2+'(+-Y), ' + 'not_'+reg+'(X, Y), not(X==Y)')
					rmode.append('not_'+obj1+'(+-X), ' + obj2+'(+-Y), ' + 'not_'+reg+'(X, Y), not(X==Y)')
					rmode.append(obj1+'(+-X), ' + 'not_'+obj2+'(+-Y), ' + 'not_'+reg+'(X, Y), not(X==Y)')
					rmode.append('not_'+obj1+'(+-X), ' + 'not_'+obj2+'(+-Y), ' + 'not_'+reg+'(X, Y), not(X==Y)')

		## with Action

		for ar in regions:
			rmode.append('action(#['+ar+'], +-X, +-Y), not(X==Y)')

		for ar in regions:
			for obj in objects:
				rmode.append(obj+'(+-X), ' + 'action(#['+ar+'], X, +-Y), X\==Y')
				rmode.append(obj+'(+-Y), ' + 'action(#['+ar+'], +-X, Y), X\==Y')
				rmode.append('not_'+obj+'(+-X), ' + 'action(#['+ar+'], X, +-Y), X\==Y')
				rmode.append('not_'+obj+'(+-Y), ' + 'action(#['+ar+'], +-X, Y), X\==Y')

		for ar in regions:
			for obj1 in objects:
				for obj2 in objects:
					rmode.append(obj1+'(+-X), ' + obj2+'(+-Y), ' + 'action(#['+ar+'], X, Y), X\==Y')
					rmode.append('not_'+obj1+'(+-X), ' + obj2+'(+-Y), ' + 'action(#['+ar+'], X, Y), X\==Y')
					rmode.append(obj1+'(+-X), ' + 'not_'+obj2+'(+-Y), ' + 'action(#['+ar+'], X, Y), X\==Y')
					rmode.append('not_'+obj1+'(+-X), ' + 'not_'+obj2+'(+-Y), ' + 'action(#['+ar+'], X, Y), X\==Y')

		for ar in regions:
			for obj in objects:
				for reg in regions:
					rmode.append(obj+'(+-X), ' + reg+'(X,+-Y), ' + 'action(#['+ar+'], X, Y), X\==Y')
					rmode.append(obj+'(+-Y), ' + reg+'(+-X,Y), ' + 'action(#['+ar+'], X, Y), X\==Y')
					rmode.append(obj+'(+-X), ' + reg+'(X,+-Y), ' + 'action(#['+ar+'], Y, X), X\==Y')
					rmode.append(obj+'(+-Y), ' + reg+'(+-X,Y), ' + 'action(#['+ar+'], Y, X), X\==Y')
				
					rmode.append('not_'+obj+'(+-X), ' + reg+'(X,+-Y), ' + 'action(#['+ar+'], X, Y), X\==Y')
					rmode.append('not_'+obj+'(+-Y), ' + reg+'(+-X,Y), ' + 'action(#['+ar+'], X, Y), X\==Y')
					rmode.append('not_'+obj+'(+-X), ' + reg+'(X,+-Y), ' + 'action(#['+ar+'], Y, X), X\==Y')
					rmode.append('not_'+obj+'(+-Y), ' + reg+'(+-X,Y), ' + 'action(#['+ar+'], Y, X), X\==Y')

					rmode.append(obj+'(+-X), ' + 'not_'+reg+'(X,+-Y), ' + 'action(#['+ar+'], X, Y), X\==Y')
					rmode.append(obj+'(+-Y), ' + 'not_'+reg+'(+-X,Y), ' + 'action(#['+ar+'], X, Y), X\==Y')
					rmode.append(obj+'(+-X), ' + 'not_'+reg+'(X,+-Y), ' + 'action(#['+ar+'], Y, X), X\==Y')
					rmode.append(obj+'(+-Y), ' + 'not_'+reg+'(+-X,Y), ' + 'action(#['+ar+'], Y, X), X\==Y')

					rmode.append('not_'+obj+'(+-X), ' + 'not_'+reg+'(X,+-Y), ' + 'action(#['+ar+'], X, Y), X\==Y')
					rmode.append('not_'+obj+'(+-Y), ' + 'not_'+reg+'(+-X,Y), ' + 'action(#['+ar+'], X, Y), X\==Y')
					rmode.append('not_'+obj+'(+-X), ' + 'not_'+reg+'(X,+-Y), ' + 'action(#['+ar+'], Y, X), X\==Y')
					rmode.append('not_'+obj+'(+-Y), ' + 'not_'+reg+'(+-X,Y), ' + 'action(#['+ar+'], Y, X), X\==Y')


		for ar in regions:
			for obj1 in objects:
				for obj2 in objects:
					for reg in regions:
						rmode.append(obj1+'(+-X), ' + obj2+'(+-Y), ' + reg+'(X,Y), ' + 'action(#['+ar+'], X, Y), X\==Y')
						rmode.append(obj1+'(+-X), ' + obj2+'(+-Y), ' + reg+'(X,Y), ' + 'action(#['+ar+'], Y, X), X\==Y')
						rmode.append('not_'+obj1+'(+-X), ' + obj2+'(+-Y), ' + reg+'(X,Y), ' + 'action(#['+ar+'], X, Y), X\==Y')
						rmode.append('not_'+obj1+'(+-X), ' + obj2+'(+-Y), ' + reg+'(X,Y), ' + 'action(#['+ar+'], Y, X), X\==Y')
						rmode.append(obj1+'(+-X), ' + 'not_'+obj2+'(+-Y), ' + reg+'(X,Y), ' + 'action(#['+ar+'], X, Y), X\==Y')
						rmode.append(obj1+'(+-X), ' + 'not_'+obj2+'(+-Y), ' + reg+'(X,Y), ' + 'action(#['+ar+'], Y, X), X\==Y')
						rmode.append('not_'+obj1+'(+-X), ' + 'not_'+obj2+'(+-Y), ' + reg+'(X,Y), ' + 'action(#['+ar+'], X, Y), X\==Y')
						rmode.append('not_'+obj1+'(+-X), ' + 'not_'+obj2+'(+-Y), ' + reg+'(X,Y), ' + 'action(#['+ar+'], Y, X), X\==Y')

						rmode.append(obj1+'(+-X), ' + obj2+'(+-Y), ' + 'not_'+reg+'(X,Y), ' + 'action(#['+ar+'], X, Y), X\==Y')
						rmode.append(obj1+'(+-X), ' + obj2+'(+-Y), ' + 'not_'+reg+'(X,Y), ' + 'action(#['+ar+'], Y, X), X\==Y')
						rmode.append('not_'+obj1+'(+-X), ' + obj2+'(+-Y), ' + 'not_'+reg+'(X,Y), ' + 'action(#['+ar+'], X, Y), X\==Y')
						rmode.append('not_'+obj1+'(+-X), ' + obj2+'(+-Y), ' + 'not_'+reg+'(X,Y), ' + 'action(#['+ar+'], Y, X), X\==Y')
						rmode.append(obj1+'(+-X), ' + 'not_'+obj2+'(+-Y), ' + 'not_'+reg+'(X,Y), ' + 'action(#['+ar+'], X, Y), X\==Y')
						rmode.append(obj1+'(+-X), ' + 'not_'+obj2+'(+-Y), ' + 'not_'+reg+'(X,Y), ' + 'action(#['+ar+'], Y, X), X\==Y')
						rmode.append('not_'+obj1+'(+-X), ' + 'not_'+obj2+'(+-Y), ' + 'not_'+reg+'(X,Y), ' + 'action(#['+ar+'], X, Y), X\==Y')
						rmode.append('not_'+obj1+'(+-X), ' + 'not_'+obj2+'(+-Y), ' + 'not_'+reg+'(X,Y), ' + 'action(#['+ar+'], Y, X), X\==Y')


		## Done list

		rmode.append('done')

		for ar in regions:
			for obj in objects:
				rmode.append(obj+'(+-X), ' + 'done')
				rmode.append('not_'+obj+'(+-X), ' + 'done')

		for ar in regions:
			for obj1 in objects:
				for obj2 in objects:
					rmode.append(obj1+'(+-X), ' + obj2+'(+-Y), ' + 'done, X\==Y')
					rmode.append('not_'+obj1+'(+-X), ' + obj2+'(+-Y), ' + 'done, X\==Y')
					rmode.append(obj1+'(+-X), ' + 'not_'+obj2+'(+-Y), ' + 'done, X\==Y')
					rmode.append('not_'+obj1+'(+-X), ' + 'not_'+obj2+'(+-Y), ' + 'done, X\==Y')

		for ar in regions:
			for obj in objects:
				for reg in regions:
					rmode.append(obj+'(+-X), ' + reg+'(X,+-Y), ' + 'done, X\==Y')
					rmode.append(obj+'(+-Y), ' + reg+'(+-X,Y), ' + 'done, X\==Y')
					rmode.append(obj+'(+-X), ' + reg+'(X,+-Y), ' + 'done, X\==Y')
					rmode.append(obj+'(+-Y), ' + reg+'(+-X,Y), ' + 'done, X\==Y')
				
					rmode.append('not_'+obj+'(+-X), ' + reg+'(X,+-Y), ' + 'done, X\==Y')
					rmode.append('not_'+obj+'(+-Y), ' + reg+'(+-X,Y), ' + 'done, X\==Y')
					rmode.append('not_'+obj+'(+-X), ' + reg+'(X,+-Y), ' + 'done, X\==Y')
					rmode.append('not_'+obj+'(+-Y), ' + reg+'(+-X,Y), ' + 'done, X\==Y')

					rmode.append(obj+'(+-X), ' + 'not_'+reg+'(X,+-Y), ' + 'done, X\==Y')
					rmode.append(obj+'(+-Y), ' + 'not_'+reg+'(+-X,Y), ' + 'done, X\==Y')
					rmode.append(obj+'(+-X), ' + 'not_'+reg+'(X,+-Y), ' + 'done, X\==Y')
					rmode.append(obj+'(+-Y), ' + 'not_'+reg+'(+-X,Y), ' + 'done, X\==Y')

					rmode.append('not_'+obj+'(+-X), ' + 'not_'+reg+'(X,+-Y), ' + 'done, X\==Y')
					rmode.append('not_'+obj+'(+-Y), ' + 'not_'+reg+'(+-X,Y), ' + 'done, X\==Y')
					rmode.append('not_'+obj+'(+-X), ' + 'not_'+reg+'(X,+-Y), ' + 'done, X\==Y')
					rmode.append('not_'+obj+'(+-Y), ' + 'not_'+reg+'(+-X,Y), ' + 'done, X\==Y')


		for ar in regions:
			for obj1 in objects:
				for obj2 in objects:
					for reg in regions:
						rmode.append(obj1+'(+-X), ' + obj2+'(+-Y), ' + reg+'(X,Y), ' + 'done, X\==Y')
						rmode.append(obj1+'(+-X), ' + obj2+'(+-Y), ' + reg+'(X,Y), ' + 'done, X\==Y')
						rmode.append('not_'+obj1+'(+-X), ' + obj2+'(+-Y), ' + reg+'(X,Y), ' + 'done, X\==Y')
						rmode.append('not_'+obj1+'(+-X), ' + obj2+'(+-Y), ' + reg+'(X,Y), ' + 'done, X\==Y')
						rmode.append(obj1+'(+-X), ' + 'not_'+obj2+'(+-Y), ' + reg+'(X,Y), ' + 'done, X\==Y')
						rmode.append(obj1+'(+-X), ' + 'not_'+obj2+'(+-Y), ' + reg+'(X,Y), ' + 'done, X\==Y')
						rmode.append('not_'+obj1+'(+-X), ' + 'not_'+obj2+'(+-Y), ' + reg+'(X,Y), ' + 'done, X\==Y')
						rmode.append('not_'+obj1+'(+-X), ' + 'not_'+obj2+'(+-Y), ' + reg+'(X,Y), ' + 'done, X\==Y')

						rmode.append(obj1+'(+-X), ' + obj2+'(+-Y), ' + 'not_'+reg+'(X,Y), ' + 'done, X\==Y')
						rmode.append(obj1+'(+-X), ' + obj2+'(+-Y), ' + 'not_'+reg+'(X,Y), ' + 'done, X\==Y')
						rmode.append('not_'+obj1+'(+-X), ' + obj2+'(+-Y), ' + 'not_'+reg+'(X,Y), ' + 'done, X\==Y')
						rmode.append('not_'+obj1+'(+-X), ' + obj2+'(+-Y), ' + 'not_'+reg+'(X,Y), ' + 'done, X\==Y')
						rmode.append(obj1+'(+-X), ' + 'not_'+obj2+'(+-Y), ' + 'not_'+reg+'(X,Y), ' + 'done, X\==Y')
						rmode.append(obj1+'(+-X), ' + 'not_'+obj2+'(+-Y), ' + 'not_'+reg+'(X,Y), ' + 'done, X\==Y')
						rmode.append('not_'+obj1+'(+-X), ' + 'not_'+obj2+'(+-Y), ' + 'not_'+reg+'(X,Y), ' + 'done, X\==Y')
						rmode.append('not_'+obj1+'(+-X), ' + 'not_'+obj2+'(+-Y), ' + 'not_'+reg+'(X,Y), ' + 'done, X\==Y')

		rmode = sorted(list(set(rmode)))
		rmodeSettings = ''
		for i in rmode:
			rmodeSettings += 'rmode(('+i+')).\n'
		return rmodeSettings

	def genTypedLang(self, objects, regions):
		typed = []
		for obj in objects:
			typed.append(obj+'(number)')
			typed.append('not_'+obj+'(number)')

		for reg in regions:
			typed.append(reg+'(number, number)')
			typed.append('not_'+reg+'(number, number)')

		t = 'typed_language(yes).\n'
		for i in typed:
			t += 'type('+i+').\n'

		t += 'type(action(string, number, number)).\n'
		t += 'type(object(number)).\ntype(isValid(number, number)).\ntype(action(string, number, number)).\n'
		t += 'type(number == number).\ntype(number \== number).\ntype(not(number == number)).\n'

		return t


	def genConstraints(self, regions):
		const = ''
		for reg in regions:
			const += 'constraint('+reg+'(X,Y), isValid(X,Y)).\n'
			const += 'constraint(action('+reg+', X, Y), isValid(X,Y)).\n'
		return const


	def genSettings(self, objects, regions):
		rmode = self.genRmodeSettings(objects, regions)
		typed = self.genTypedLang(objects, regions)
		constraints = self.genConstraints(regions)
		
		header = 'use_package(query).\nload(models).\n\ntalking(2).\ntilde_mode(classify).\nclasses([pos,neg]).\n\naccuracy(1).\nminimal_cases(1).\n\npruning(vsb).\nrandom_validation_set(0.15).\nrandom_test_set(0.15).\n'
		footer = 'max_lookahead(1).\noutput_options([c45e,prolog,roc01,elaborate]).\n'

		return '\n'.join([header, typed, rmode, constraints, footer])+'\n'


