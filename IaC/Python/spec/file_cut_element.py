#!/usr/bin/python

import argparse
import json
import os

# parse args
parser = argparse.ArgumentParser(description="python argparse")
parser.add_argument("-i", "--inFile", type=str, required=True, help="inFile,required")
parser.add_argument('-o', '--outFile', type=str, required=True, help='outFile,required')
parser.add_argument('-n', '--probe', type=int, required=True, help='probe,required')
args = parser.parse_args()

# prepare args
inFile = args.inFile
outFile = args.outFile
probe = args.probe

#for debug
print('inFile is', inFile)
print('outFile is', outFile)
print('probe is', probe)

def file_dict(inFile,outFile):

    file = open(outFile, "w")
    res = []
    with open(inFile, "r") as f:
        for jsonstr in f.readlines():
            data = json.loads(jsonstr)

            account = data[probe]
            print(account)  
            if account not in res:
                res.append(account)
                print(res)  
                file.write(json.dumps(account) + "\n")
        file.close()

file_dict(inFile,outFile)