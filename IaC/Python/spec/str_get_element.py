#!/usr/bin/python

import argparse
import re

# parse args
parser = argparse.ArgumentParser(description="python argparse")
parser.add_argument("-i", "--myStr", type=str, required=True, help="myStr,required")
parser.add_argument('-n', '--probe', type=int, required=True, help='probe,required')
args = parser.parse_args()

# prepare args
myStr = args.myStr
probe = args.probe

def file_load_data(myStr,probe):

    element = re.split("-", myStr)[probe]

    print(element)

file_load_data(myStr,probe)

