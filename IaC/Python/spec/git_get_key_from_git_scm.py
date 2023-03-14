#!/usr/bin/python

import argparse
import re

# parse args
parser = argparse.ArgumentParser(description="python argparse")
parser.add_argument("-i", "--myStr", type=str, required=True, help="myStr,required")
args = parser.parse_args()

# prepare args
myStr = args.myStr

def file_load_data(myStr):

    matches = re.split("/", myStr)[2]
    # remove ".git"
    repo_id = re.sub('.git', '', matches)
    # remove "-"
    remove_hyphen = re.sub('-', '', repo_id)
    # remove "_"
    final = re.sub('_', '', remove_hyphen)

    print(final)

file_load_data(myStr)

