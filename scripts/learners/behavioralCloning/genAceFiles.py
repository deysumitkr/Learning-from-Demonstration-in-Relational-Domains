import pickle
from aceFiles2 import AceFiles		# For Behavioral Cloning
#from aceFilesIRL import AceFiles	# For CSI

def debug(states):
    for state in states:
        print list(set(state[1].values()))



if __name__=='__main__':
    db = pickle.load(open('./learners/behavioralCloning/relKB-BC.p','rb'))
    
    states = []
    objects = []
    regions = []
    for dem in db:
		states += dem[0]
		objects += dem[1].values()
		regions += dem[2]
    objects = list(set(objects))
    regions = list(set(regions))
  

## Save files for ACE	

    ace = AceFiles(states, objects, regions)

    f = open("./learners/ace/bc/table.kb","w+")
    f.write(ace.kb)
    f.close()

    f = open("./learners/ace/bc/table.bg","w+")
    f.write(ace.bg)
    f.close()

    f = open("./learners/ace/bc/table.s","w+")
    f.write(ace.s)
    f.close()
