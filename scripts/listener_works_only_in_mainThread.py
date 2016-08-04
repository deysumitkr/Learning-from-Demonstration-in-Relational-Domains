# listener works only in main thread
# So, the code below doesn't work

import threading
from pose_listener import TagPose

if __name__=='__main__':
    tag = TagPose()
    t = threading.Thread(target=tag.listener)
    t.daemon = True
    t.start()

    for i in range(5):
        print tag.data
