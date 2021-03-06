import tilde
import subprocess
from progressBar import ProgressBar

class Reward:

    def __init__(self, state, actionList, regions, names):
        discountFactor = 0.9
        self.rsa = {}
        self.regions = regions
        self.names = names

        p = ProgressBar(len(actionList), 'Querying', 'Complete')
        p.show(0)
        for act in actionList:
            ns = self.nextStates(state, act)
            nextqsa = 0
            for s in ns:
                A = self.possibleActions(s, regions)
                a = self.argmax(s,A)
                nextqsa += float(a[1])
            qsa = self.getQsa(state, act)
            rw = qsa - discountFactor*(1./float(len(ns)))*nextqsa
            self.rsa[act] = rw
            p.show(actionList.index(act)+1)

    def argmax(self, s, A):
        qsa = [None, -1]
        for a in A:
            qsa = [a, self.getQsa(s,a)] if self.getQsa(s,a) > qsa[1] else qsa
        return qsa

    def getQsa(self, s, a):
        present = self.createMainPro('.\n'.join(s)+'.\n'+a+'.\n')
        f = open('./furnace/main.pro', 'w+')
        f.write(present)
        f.close()
        cmd = "echo 'halt.' | swipl -q -l furnace/main.pro 2> /dev/null"
        op = subprocess.check_output(cmd, shell=True).strip()
        return float(op)


    def act2state(self, act):
        if act == 'done':
            return []
        r = act.split('(')[1].split(', ')[0].strip()
        Om = str(act.split(', ')[1].strip())
        Or = str(act.split(', ')[2].split(')')[0].strip())
        return r+'('+Om+', '+Or+')'

    def nextStates(self, state, action):
        L = []
        if action == 'done':
            return [state]

        Om = str(action.split(', ')[1].strip())
        for s in state:
            if len(s.split(','))>1:
                if (Om == s.split('(')[1].split(', ')[0].strip()) or (Om == s.split(',')[1].split(')')[0].strip()):
                # If active obeject is in a relational fact, we preserve it in list L
                    L.append(s)

        NS = [[x for x in state if x not in L] + [self.act2state(action)]]
        for l in L:
            NS.append(NS[0] + [l])
        return NS

    def possibleActions(self, state, regions):
        obj = []
        for s in state:
            if len(s.split(','))==1:
                obj.append(int(s.split('(')[1].split(')')[0].strip()))

        obj = list(set(obj))
        actions = ['action('+str(r)+', '+str(i)+', '+str(j)+')' for r in regions for i in obj for j in obj if i != j] + ['done']
        return actions

    def createMainPro(self, state):
        dynamic = ['object/1', 'action/3', 'done/0']
        obj = tilde.trainedObjects('./learners/ace/CSI/table.bg')
        for n in self.names.values()+obj:
            dynamic.append(n+'/1')
            dynamic.append('not_'+n+'/1')
        
        for r in self.regions:
            dynamic.append(r+'/2')
            dynamic.append('not_'+r+'/2')

        dynamic = list(set(dynamic))
        dynamic.sort()

        code = tilde.extractCode("./learners/ace/CSI/tilde/table.out")
        with open('./learners/ace/CSI/table.bg','r') as f:
            bg = f.read() 

        return """
:- dynamic
        """+ ',\n\t'.join(dynamic)+'.' + """

:- initialization(main).
 
main:-
        class(X), 
        pops(X).
 
pops([]):- nl.  
pops([H|T]):-   
        write(H),
        pops(T). 

""" + state + code + bg + '\n'




if __name__=='__main__':
    state = ['plate(4)', 'fork(5)', 'cup(7)', 'near(4, 7)', 'near(7, 4)']
    actionList = ['action(near, 4, 5)', 'action(near, 4, 7)', 'action(near, 5, 4)', 'action(near, 5, 7)', 'action(near, 7, 4)', 'action(near, 7, 5)', 'done']
    names = {4: 'plate', 5: 'fork', 7: 'cup'}
    rw = Reward(state, actionList, ['near'], names)
    print rw.rsa
    print rw.rsa.values()
    print max(rw.rsa.values())
    print rw.rsa.keys()[rw.rsa.values().index(max(rw.rsa.values()))]

