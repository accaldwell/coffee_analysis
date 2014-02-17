import sys
import csv

OTUs = dict()

with open(sys.argv[1], 'r') as lefse_file:
    #skip header line
    line = lefse_file.readline()
    lefse_reader = csv.reader(lefse_file, delimiter='\t')
    for row in lefse_reader:
        if row[2] != "-":
            OTUs[row[0]] = row[2]

with open(sys.argv[2], 'r') as fulltax_file:
    fulltax_reader = csv.reader(fulltax_file, delimiter='\t')
    for row in fulltax_reader:
        if row[0] in OTUs:
            print(row[0], OTUs[row[0]], row[1], row[2], row[3], row[4], row[5], row[6], row[7], sep="\t")