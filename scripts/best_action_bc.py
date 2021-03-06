import tilde
import subprocess

class ActionCloning:

    def __init__(self, state, actionList, regions, names):
        self.state = state
        self.actionList = actionList
        self.regions = regions
        self.names = names
		
        self.goodActions = []
        for act in actionList: 
            label = self.getAction(state, act)
            #print act, label
            if label == 'pos':
                self.goodActions.append(act)
        
    def getAction(self, s, a):
        present = self.createMainPro('.\n'.join(s)+'.\n'+a+'.\n')
        f = open('./furnace/main.pro', 'w+')
        f.write(present)
        f.close()
        cmd = "echo 'halt.' | swipl -q -l furnace/main.pro 2> /dev/null"
        op = subprocess.check_output(cmd, shell=True).strip()
        return op


    def createMainPro(self, state):
        dynamic = ['object/1', 'action/3', 'done/0']
        obj = tilde.trainedObjects('./learners/ace/bc/table.bg')
        for n in self.names.values()+obj:
            dynamic.append(n+'/1')
            dynamic.append('not_'+n+'/1')
        
        for r in self.regions:
            dynamic.append(r+'/2')
            dynamic.append('not_'+r+'/2')

        dynamic = list(set(dynamic))
        dynamic.sort()

        code = tilde.extractCode("./learners/ace/bc/tilde/table.out")
        with open('./learners/ace/bc/table.bg','r') as f:
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
    ac = ActionCloning(state, actionList, ['near'], names)
    print ac
