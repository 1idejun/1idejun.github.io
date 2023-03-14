#!/usr/bin/python

import argparse
import json
import re
# parse args
parser = argparse.ArgumentParser(description="python argparse")
parser.add_argument("-i", "--inFile", type=str, required=True, help="inFile,required")
parser.add_argument("-o", "--outFile", type=str, required=True, help="outFile,required")
parser.add_argument("-n", "--chunk_size", type=int, required=True, help="chunk_size,required")
args = parser.parse_args()

# prepare args
inFile = args.inFile
outFile = args.outFile
chunk_size = args.chunk_size

# for debug
print("inFile is", inFile)
print("outFile is", outFile)
print("chunk_size is", chunk_size)

def chunk_str(inFile,outFile,chunk_size):

  #wrap the output
  file = open(outFile, "w")
  with open(inFile, "r") as f:

    chunks = f.read().split(' ') 
      
    applist = [chunks[i:i+chunk_size] for i in range(0, len(chunks), chunk_size)]

    for line in applist:
      print(line)
      
      file.write(json.dumps(line) + "\n")
          
  file.close()

chunk_str(inFile,outFile,chunk_size)