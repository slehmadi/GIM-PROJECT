extends Node2D

var time : int = 0
var firstTime : bool = true
var best = 0

func bestTime(currTime):
	if firstTime:
		firstTime = false
		return currTime
	else:
		if best > currTime:
			return currTime
	return best
