#!/usr/bin/python

import argparse
import json

# parse args
parser = argparse.ArgumentParser(description="python argparse")
parser.add_argument("-i", "--inFile", type=str, required=True, help="inFile,required")
parser.add_argument("-r", "--row", type=int, required=True, help="row,required")
args = parser.parse_args()

# prepare args
inFile = args.inFile
row = args.row

def print_element(inFile,row):

    with open(inFile, "r") as f:
        data = json.loads(f.readlines()[row])

        print(data)

print_element(inFile,row)
