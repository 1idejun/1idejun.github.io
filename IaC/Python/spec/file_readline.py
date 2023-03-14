#!/usr/bin/python

import argparse
import json
import os

#parse args
parser = argparse.ArgumentParser(description='python argparse')
parser.add_argument('-i', '--inFile', type=str, required=True, help='inFile,required')
parser.add_argument('-o', '--outFile', type=str, required=True, help='outFile,required')
args = parser.parse_args()

#prepare args
inFile = args.inFile
outFile = args.outFile

#for debug
print('inFile is', inFile)
print('outFile is', outFile)

def file_readline(inFile,outFile):
    
    file = open(outFile, "w")
    for line in open(inFile):
        print(line)
        file.write(json.dumps(line.split(os.sep)) + "\n")

    file.close()

file_readline(inFile,outFile)
    


