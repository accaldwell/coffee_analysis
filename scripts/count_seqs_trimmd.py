from Bio import SeqIO

fastq_path = "fastqs/"

for sample in ["ICf71","ICf72","ICf73","ICf74","ICf75","ICf76","ICf77","ICf78","ICf79","ICf80","ICf81","ICf82","ICf83","ICf84","ICf85","ICf86","ICf87","ICf88","ICf89","ICf90","ICn61","ICn62","ICn63","ICn64","ICn65","ICn66","ICn67","ICn68","ICn69","OCf41","OCf42","OCf43","OCf44","OCf45","OCf46","OCf47","OCf48","OCf49","OCf50","OCf51","OCf52","OCf53","OCf54","OCf55","OCf56","OCf57","OCf58","OCf59","OCf60","OCn32","OCn33","TCf11","TCf12","TCf13","TCf14","TCf15","TCf16","TCf17","TCf18","TCf19","TCf20","TCf21","TCf22","TCf23","TCf24","TCf25","TCf26","TCf27","TCf28","TCf29","TCf30","TCn01","TCn02","TCn03","TCn04","TCn05","TCn06","TCn07","TCn08","TCn09","TCn10"]:

    seqcount = 0

    with open(fastq_path+sample+".R1.rename.trimm.fastq", "r") as R1:
        for sequence in SeqIO.parse(R1,'fastq'):
            seqcount += 1
        print(sample, seqcount, sep="\t")
