import sys
import csv
from collections import defaultdict

otutax_dict = dict()

with open(sys.argv[1], 'r') as otutax_file:
    #skip header line
    line = otutax_file.readline()
    otutax_reader = csv.reader(otutax_file, delimiter='\t')
    for row in otutax_reader:
        if row[1] == "":
            otutax_dict[row[0]] = "unclassified"
        else:
            otutax_dict[row[0]] = row[1]

ORG_dict = defaultdict(int)
INT_dict = defaultdict(int)
TRN_dict = defaultdict(int)
NA_dict = defaultdict(int)

with open(sys.argv[2], 'r') as lefse_file:
    #skip header line
    line = lefse_file.readline()
    lefse_reader = csv.reader(lefse_file, delimiter='\t')
    for row in lefse_reader:
        phylum = otutax_dict[row[0]]
        if row[2] == "ORG":
            ORG_dict[phylum] += 1
        elif row[2] == "INT":
            INT_dict[phylum] += 1
        elif row[2] == "TRN":
            TRN_dict[phylum] += 1
        elif row[2] == "NA":
            NA_dict[phylum] += 1

for phylum, count in ORG_dict.items():
    print("ORG", phylum, count)

for phylum, count in INT_dict.items():
    print("INT", phylum, count)

for phylum, count in TRN_dict.items():
    print("TRN", phylum, count)

for phylum, count in NA_dict.items():
    print("NA", phylum, count)