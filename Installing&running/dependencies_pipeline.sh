# To fix Working directory, TMUX session and ask an interactive job  #https://scalebio.github.io/ScaleRna-docs/requirements/
cd /well/ludwig/users/lay823/larvae_nsc
tmux new -s larvae_nsc #create session
tmux attach -t larvae_nsc #log-in to the session

conda deactivate
# srun -p short --nodes=2 --ntasks-per-node=1 --cpus-per-task=8  --mem=150G --time=24:00:00 --pty /bin/bash -i
# srun -p short --nodes=2 --ntasks-per-node=1 --cpus-per-task=8  --mem=300G --time=24:00:00 --pty /bin/bash -i
# squeue -u lay823
# srun -p short --nodes=1 --ntasks-per-node=1 --cpus-per-task=12  --mem=100G --time=24:00:00 --pty /bin/bash -i 
# the pipeline ask for 16 cpus 

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
srun -p short --nodes=1 --ntasks-per-node=1 --cpus-per-task=16  --mem=150G --time=24:00:00 --pty /bin/bash -i
module load Nextflow/24.04.2
module load Java/11.0.20

nextflow run /well/ludwig/users/lay823/larvae_nsc/ScaleRna/ \
  -profile singularity -params-file /well/ludwig/users/lay823/larvae_nsc/ScaleRna/docs/examples/runParams.yml \
  --genome /well/ludwig/users/lay823/larvae_nsc/test_inst/GRCh38_chr20_genome/genome.json \
  --fastqDir /well/ludwig/users/lay823/larvae_nsc/test_inst/fastq \
  --outDir /well/ludwig/users/lay823/larvae_nsc/test_inst/output




# Debug cache
mkdir -p /gpfs3/well/ludwig/users/lay823/larvae_nsc/ScaleRna/work/singularity-cache
export NXF_SINGULARITY_CACHEDIR=/gpfs3/well/ludwig/users/lay823/larvae_nsc/ScaleRna/work/singularity-cache
export APPTAINER_CACHEDIR=$NXF_SINGULARITY_CACHEDIR
export SINGULARITY_CACHEDIR=$NXF_SINGULARITY_CACHEDIR

# alternative 
mkdir -p /gpfs3/well/ludwig/users/lay823/.apptainer/cache
mkdir -p /gpfs3/well/ludwig/users/lay823/.apptainer/tmp
export NXF_SINGULARITY_CACHEDIR=/gpfs3/well/ludwig/users/lay823/.apptainer/cache
export APPTAINER_CACHEDIR=$NXF_SINGULARITY_CACHEDIR
export SINGULARITY_CACHEDIR=$NXF_SINGULARITY_CACHEDIR
export APPTAINER_TMPDIR=/gpfs3/well/ludwig/users/lay823/.apptainer/tmp
 - resume 
 echo $APPTAINER_CACHEDIR
# tes2 
 nextflow run /well/ludwig/users/lay823/larvae_nsc/ScaleRna/   -profile singularity -params-file /well/ludwig/users/lay823/larvae_nsc/ScaleRna/docs/examples/runParams.yml   --genome /well/ludwig/users/lay823/larvae_nsc/test_inst/GRCh38_chr20_genome/genome.json   --fastqDir /well/ludwig/users/lay823/larvae_nsc/test_inst/fastq/   --outDir /well/ludwig/users/lay823/larvae_nsc/test_inst/output -resume
