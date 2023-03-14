#!/usr/bin/python

import argparse
import os


# parse args
parser = argparse.ArgumentParser(description="python argparse")
parser.add_argument("-i", "--inFile", type=str, required=True, help="inFile,required")
args = parser.parse_args()

# prepare args
inFile = args.inFile

def file_count_lines(inFile):

    with open(inFile, 'r') as f:
        x = len(f.readlines())
        print(x) 

file_count_lines(inFile)
