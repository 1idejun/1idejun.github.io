#!/usr/bin/python

import argparse
import json
# parse args
parser = argparse.ArgumentParser(description="python argparse")
parser.add_argument("-i", "--inFile", type=str, required=True, help="inFile,required")
parser.add_argument('-r', '--row', type=int, required=True, help='row,required')
args = parser.parse_args()

# prepare args
inFile = args.inFile
row = args.row

def loop_data(inFile,row):
   
    #file = open(outFile, "w")
    with open(inFile, "r") as f:

        last_line = f.readlines()[-1]
        print(last_line)

        for jsonstr in f.readlines():
            data = json.loads(jsonstr)
            print(data)
            
            if data == last_line :
                print("last_line is", data)
                res = []
                for sub in data:
                    print("sub is", sub)
                    res.append(sub.replace("\n", ""))
                    print("res is", res) 
                    print(res[row])

            else:
                print("data is", data)
                print(res[row])

loop_data(inFile,row)