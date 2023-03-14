#!/usr/bin/python

import argparse
import json
import os


# parse args
parser = argparse.ArgumentParser(description="python argparse")
parser.add_argument("-i", "--inFile", type=str, required=True, help="inFile,required")
parser.add_argument("-o", "--outFile", type=str, required=True, help="outFile,required")
args = parser.parse_args()

# prepare args
inFile = args.inFile
outFile = args.outFile

# for debug
print("inFile is", inFile)
print("outFile is", outFile)


def file_load_data(inFile, outFile):

    with open(inFile, "r") as f:
        for jsonstr in f.readlines():
            data = json.loads(jsonstr)

            account = data[2]
            print("account is", account)  
            env = data[4]
            print("env is", env)  
            zone = data[5]
            print("zone is", zone)
            tier = data[6]
            print("tier is", tier)
            component = data[7]
            print("component is", component)

file_load_data(inFile, outFile)
