# -*- coding: utf-8 -*-

import sys

class ProgressBar:

	def __init__(self, total, prefix='', suffix='', decimals=2, barLength=100):
		self.total=total
		self.prefix=prefix
		self.suffix=suffix
		self.decimals=decimals
		self.barLength=barLength

	def show (self, iteration, total=None, prefix=None, suffix=None, decimals=None, barLength=None):
		self.total = self.total if total==None else total
		self.prefix = self.prefix if prefix==None else prefix
		self.suffix = self.suffix if suffix==None else suffix
		self.decimals = self.decimals if decimals==None else decimals
		self.barLength = self.barLength if barLength==None else barLength
		self.showFinal(iteration, self.total, self.prefix, self.suffix, self.decimals, self.barLength)

	# Print iterations progress
	def showFinal (self, iteration, total, prefix, suffix, decimals, barLength):
		"""
		Call in a loop to create terminal progress bar
		@params:
		iteration   - Required  : current iteration (Int)
		total       - Required  : total iterations (Int)
		prefix      - Optional  : prefix string (Str)
		suffix      - Optional  : suffix string (Str)
		decimals    - Optional  : number of decimals in percent complete (Int)
		barLength   - Optional  : character length of bar (Int)
		"""

		filledLength    = int(round(barLength * iteration / float(total)))
		percents        = round(100.00 * (iteration / float(total)), decimals)
		bar             = '█' * filledLength + '-' * (barLength - filledLength)
		sys.stdout.write('\r%s |%s| %s%s %s' % (prefix, bar, percents, '%', suffix)),
		sys.stdout.flush()
		if iteration == total:
			sys.stdout.write('\n')
		sys.stdout.flush()
	

