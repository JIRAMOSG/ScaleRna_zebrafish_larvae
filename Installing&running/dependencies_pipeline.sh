# To fix Working directory, TMUX session and ask an interactive job  #https://scalebio.github.io/ScaleRna-docs/requirements/
cd /well/ludwig/users/lay823/larvae_nsc
tmux new -s larvae_nsc #create session
tmux attach -t larvae_nsc #log-in to the session

conda deactivate

# squeue -u lay823


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
module load Nextflow/24.04.2
module load Java/11.0.20

nextflow run /well/ludwig/users/lay823/larvae_nsc/ScaleRna/   \
-profile singularity \
-params-file /well/ludwig/users/lay823/larvae_nsc/ScaleRna/docs/examples/runParams.yml  \
--genome /well/ludwig/users/lay823/larvae_nsc/test_inst/GRCh38_chr20_genome/genome.json   \
--fastqDir /well/ludwig/users/lay823/larvae_nsc/test_inst/fastq/   \
--outDir /well/ludwig/users/lay823/larvae_nsc/test_inst/output 
#-resume





# Debug cache
mkdir -p /gpfs3/well/ludwig/users/lay823/.apptainer/cache
mkdir -p /gpfs3/well/ludwig/users/lay823/.apptainer/tmp
export NXF_SINGULARITY_CACHEDIR=/gpfs3/well/ludwig/users/lay823/.apptainer/cache
export APPTAINER_CACHEDIR=$NXF_SINGULARITY_CACHEDIR
export SINGULARITY_CACHEDIR=$NXF_SINGULARITY_CACHEDIR
export APPTAINER_TMPDIR=/gpfs3/well/ludwig/users/lay823/.apptainer/tmp
 - resume 
 echo $APPTAINER_CACHEDIR
# tes2 
 
