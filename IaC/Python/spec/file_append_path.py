#!/usr/bin/python

import argparse
import json
import os


# parse args
parser = argparse.ArgumentParser(description="python argparse")
parser.add_argument("-i", "--inFile", type=str, required=True, help="inFile,required")
parser.add_argument("-r", "--row", type=int, required=True, help="row,required")
args = parser.parse_args()

# prepare args
inFile = args.inFile
row = args.row

def file_load_data(inFile, row):

    with open(inFile, "r") as f:
        data = json.loads(f.readlines()[row])

        account = data[2]
        region = data[3]
        env = data[4]
        zone = data[5]

        zone_path = account + "." + region + "." + env + "." + zone
        print(zone_path)

file_load_data(inFile, row)
