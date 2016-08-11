import pickle
import os
import math

class RelationalWorld:

    def __init__(self, state, names, regions):
        self.state = []
        self.possibleActions = []
        self.createState(state, names)
        self.genPossibleActions(state, regions)

    def createState(self, state, names):
        for x in state.keys():
            self.state.append(names[x]+'('+str(x)+')')
        self.state += ['near('+str(i)+', '+str(j)+')' for i in state.keys() for j in state.keys() if i!=j and eucledian(state[i], state[j]) < 80] 

    def genPossibleActions(self, state, regions):
        obj = state.keys()
        actions = ['action('+str(r)+', '+str(i)+', '+str(j)+')' for r in regions for i in obj for j in obj if i != j]
        self.possibleActions = actions+['done']


def act2state(act):
    r = act.split('(')[1].split(', ')[0].strip()
    Om = str(act.split(', ')[1].strip())
    Or = str(act.split(', ')[2].split(')')[0].strip())
    return r+'('+Om+', '+Or+')'


## Magic function here

def balanceData(actList):
    pc = actList.values().count('pos')
    nc = actList.values().count('neg')
    if pc < nc:
        pc = int(nc/pc) if int(nc/pc) > 0 else pc
        nc = 1
    else:
        nc = int(pc/nc) if int(pc/nc) > 0 else nc
        pc = 1

    for a in actList:
        actList[a] = ['pos', pc] if actList[a] == 'pos' else ['neg', nc]

       

def actionLabelling(dem):
    kb = []
    for i in range(len(dem)-1):
        labels = {}
        for act in dem[i][1]:
            if dem[i][2] == None and act == 'done':
                labels[act] = 'pos'
            elif dem[i][2] != None and act == 'done':
                labels[act] = 'neg'
            else:
                Om = int(act.split(', ')[1].strip())
                labels[act] = 'pos' if (Om == int(dem[i][2])) and (act2state(act) in dem[i+1][0]) and (act2state(act) not in dem[i][0]) else 'neg'
        balanceData(labels)
        kb.append((dem[i][0], labels))

    labels = {}
    for act in dem[-1][1]:
        labels[act] = 'pos' if act == 'done' else 'neg'
    balanceData(labels)
    kb.append((dem[-1][0], labels))

    return kb



def eucledian(x, y):                                                                                                                     
    return math.sqrt((x[0]-y[0])**2 + (x[1]-y[1])**2)

def activeId(s0, s1):
    common = list(set(s0.keys()) & set(s1.keys()))
    if len(common)<2:
        return None
    dist = 0
    
    select = None
    for obj in common:
        delta = eucledian(s0[obj], s1[obj])
        if delta > dist:
            dist = delta
            select = obj

    return select

def getFiles(path):
    for file in os.listdir(path):
        if os.path.isfile(os.path.join(path, file)):
            yield file

def loadDB():
    db = []
    for file in getFiles("./db/"):
    	print "Loading...", file
        db.append(pickle.load(open("db/"+file, "rb")))
    return db


if __name__=='__main__':

    db = loadDB()
    regions = ['near']
    kb = []
    count = 0; MAX = 3;
    
    for session in db:
        print session[0]
        for dem in session[1]:
            count +=1
            if count > MAX:
                break
            middleware = []
            for i in range(len(dem)):
                R = RelationalWorld(dem[i], session[0], regions)
                id = None
                if i < len(dem)-1:
                    id = activeId(dem[i], dem[i+1])
                middleware.append([R.state, R.possibleActions, id])
            kb.append([actionLabelling(middleware), session[0], regions])

    pickle.dump(kb, open("./learners/behavioralCloning/relKB-CSI.p","w+"))



