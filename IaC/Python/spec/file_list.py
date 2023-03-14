#!/usr/bin/python

import os
import argparse

parser = argparse.ArgumentParser(description='python argparse')
parser.add_argument('-p', '--path', type=str, required=True, help='path,required')
args = parser.parse_args()

dir = args.path

print('dir is', dir)


def ListFilesToJson(dir, file, wildcard, recursion):
    exts = wildcard.split(" ")
    files = os.listdir(dir)
    for name in files:
        fullname = os.path.join(dir, name)
        if(os.path.isdir(fullname) & recursion):
            ListFilesToJson(fullname, file, wildcard, recursion)
        else:
            for ext in exts:
                if(name.endswith(ext)):
                    file.write(name + "\n")
                    break
 
def terragrunt():
    outfile = "terragrunt.txt"
    wildcard = "terragrunt.hcl"
 
    file = open(outfile, "w")
    if not file:
        print("cannot open the file %s for writing" % outfile)
 
    ListFilesToJson(dir, file, wildcard, 1)
 
    file.close()
 
terragrunt()