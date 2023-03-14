#!/usr/bin/python

import os
import argparse

#parse args
parser = argparse.ArgumentParser(description='python argparse')
parser.add_argument('-t', '--fileType', type=str, required=True, help='fileType,required')
parser.add_argument('-f', '--outFile', type=str, required=True, help='outFile,required')
parser.add_argument('-r', '--repoName', type=str, required=True, help='repoName,required')
args = parser.parse_args()

#prepare args
fileType = args.fileType
outFile = args.outFile
repoName = args.repoName
path = ("./" + repoName)

#for debug
print('fileType is', fileType)
print('outFile is', outFile)
print('repoName is', repoName)
print('path is', path)

def file_search(path, fileType,outFile,repoName):
 
    file = open(outFile, "w")
    if not file:
        print("cannot open the file %s for writing" % outFile)
    for root, subDirs, files in os.walk(path):
        for fileName in files:
            if fileName.endswith(fileType) and root != path:
                file.write(os.path.join(root,fileName) + "\n")
                break
    file.close()

file_search(path, fileType,outFile,repoName)
