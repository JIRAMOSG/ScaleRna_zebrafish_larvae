# To fix Working directory, TMUX session and ask an interactive job
cd /well/ludwig/users/lay823/larvae_nsc
tmux new -s larvae_nsc #create session
tmux attach -t larvae_nsc #log-in to the session

conda deactivate
# srun -p short --nodes=2 --ntasks-per-node=1 --cpus-per-task=8  --mem=150G --time=24:00:00 --pty /bin/bash -i
# srun -p short --nodes=2 --ntasks-per-node=1 --cpus-per-task=8  --mem=300G --time=24:00:00 --pty /bin/bash -i
# squeue -u lay823
# srun -p short --nodes=1 --ntasks-per-node=1 --cpus-per-task=12  --mem=100G --time=24:00:00 --pty /bin/bash -i 

srun -p short --nodes=1 --ntasks-per-node=1 --cpus-per-task=6  --mem=60G --time=24:00:00 --pty /bin/bash -i 

# Clone github
git clone https://github.com/ScaleBio/ScaleRna.git


# Downloading test run data
conda create -n s3env python=3.10
conda activate s3env
conda install -c conda-forge awscli -y
aws s3 sync s3://scale.pub/testData/rna/GRCh38_chr20_genome GRCh38_chr20_genome --no-sign-request 
aws s3 sync s3://scale.pub/testData/rna/202506_quantumV1/fastq fastq --no-sign-request
conda deactivate

#TEST
srun -p short --nodes=2 --ntasks-per-node=1 --cpus-per-task=8  --mem=150G --time=24:00:00 --pty /bin/bash -i
module load Nextflow/24.04.2
module load Java/11.0.20

nextflow run /well/ludwig/users/lay823/larvae_nsc/ScaleRna/ \
  -profile singularity -params-file /well/ludwig/users/lay823/larvae_nsc/ScaleRna/docs/examples/runParams.yml \
  --genome /well/ludwig/users/lay823/larvae_nsc/test_inst/GRCh38_chr20_genome/genome.json \
  --fastqDir /well/ludwig/users/lay823/larvae_nsc/test_inst/fastq \
  --outDir /well/ludwig/users/lay823/larvae_nsc/test_inst/output

#Pulling Singularity image docker://public.ecr.aws/o5l3p3e4/scalerna:2025-04-16-160428 [cache /gpfs3/well/ludwig/users/lay823/larvae_nsc/ScaleRna/work/singularity/public.ecr.aws-o5l3p3e4-scalerna-2025-04-16-160428.img]
#WARN: Singularity cache directory has not been defined -- Remote image will be stored in the path: /gpfs3/well/ludwig/users/lay823/larvae_nsc/ScaleRna/work/singularity -- Use the environment variable NXF_SINGULARITY_CACHEDIR to specify a different location




  
