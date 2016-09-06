import math

_NEAR_THRESHOLD = 80.0
_EAST_WEST_BUFFER_DIST = _NEAR_THRESHOLD/2.0
_NORTH_SOUTH_BUFFER_DIST = _NEAR_THRESHOLD/2.0

def near(p1, p2):
	# returns True if points p1 & p2 are near, otherwise False
	return True if (math.sqrt((p1[0]-p2[0])**2 + (p1[1]-p2[1])**2) < _NEAR_THRESHOLD) else False

def east(p1, p2):
	return True if ((p1[0] - p2[0]) > _EAST_WEST_BUFFER_DIST) else False

def west(p1, p2):
	return True if ((p2[0] - p1[0]) > _EAST_WEST_BUFFER_DIST) else False

def north(p1, p2):
	return True if ((p1[1] - p2[1]) > _NORTH_SOUTH_BUFFER_DIST) else False

def south(p1, p2):
	return True if ((p2[1] - p1[1]) > _NORTH_SOUTH_BUFFER_DIST) else False
