#!/usr/bin/env python
import sys
import os
import argparse
import shutil
import time

if __name__ == '__main__':
	#The rubbish directory
	rubbish_dir = '~/Rubbish/'
	rubbish_dir = os.path.expanduser(rubbish_dir)

	#Get a format time to create a folder to save into
	current_time = time.localtime()
	format_time = "%X.%X.%X" % (current_time.tm_year, current_time.tm_mon, current_time.tm_mday)
	format_time = format_time + ("-%d.%d" % (current_time.tm_hour, current_time.tm_min))

	#Append that format time to the rubbish directory
	rubbish_dir = rubbish_dir + format_time + '/'

	#Create the argument parser and parse the command line arguments
	parser = argparse.ArgumentParser(description='Move files to the rubbish...')
	parser.add_argument('File', nargs='*', help='The file/s to move')
	parser.add_argument('-verbose', '-v', action='count', help='explain everything that is being done')
	args = parser.parse_args()
	arg_dict = vars(args)

	#Check the verbosity flag
	verbose = False
	if arg_dict['verbose'] != None:
			verbose = True

	#Create a time stamp directory if none already exists
	if not os.path.exists(rubbish_dir):
		if verbose:
			print('Creating time stamp directory \'%s\'' % rubbish_dir)
		os.mkdir(rubbish_dir)

	if verbose:
		print('Moving file/s to rubbish...')
	#Move each of the files and directories stated
	for item in vars(args)['File']:
		if verbose:
			print('\tMoving \'%s\' to \'%s%s\'' % (item, rubbish_dir, item))
		if os.path.exists(rubbish_dir + item):
			print('\tCannot move file \'%s\', already exists in Rubbish' % (item))
		else:
			shutil.move(item, rubbish_dir)
	
	if verbose:
		print('Fin!')

	sys.exit()
