srun -p short --nodes=2 --ntasks-per-node=1 --cpus-per-task=4  --mem=150G --time=24:00:00 --pty /bin/bash -i
cd /well/ludwig/users/lay823/larvae_nsc/reference
module load STAR/2.7.11b-GCC-12.3.0

STAR --runMode genomeGenerate \
  --runThreadN 16 \
  --genomeDir star.ref \
  --genomeFastaFiles Danio_rerio.GRCz11.dna.primary_assembly.fa \
  --sjdbGTFfile Danio_rerio.GRCz11.115.gtf
