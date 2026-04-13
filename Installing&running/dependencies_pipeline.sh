# To fix Working directory, TMUX session and ask an interactive job
cd /well/ludwig/users/lay823/larvae_nsc
tmux new -s larvae_nsc #create session
tmux attach -t larvae_nsc #log-in to the session

conda deactivate
# srun -p short --nodes=2 --ntasks-per-node=1 --cpus-per-task=8  --mem=150G --time=24:00:00 --pty /bin/bash -i
# srun -p short --nodes=2 --ntasks-per-node=1 --cpus-per-task=8  --mem=300G --time=24:00:00 --pty /bin/bash -i
# squeue -u lay823
# srun -p short --nodes=1 --ntasks-per-node=1 --cpus-per-task=12  --mem=100G --time=24:00:00 --pty /bin/bash -i 

# Clone github
git clone https://github.com/ScaleBio/ScaleRna.git

# Install dependecies and create enviroment
module load Miniforge3
conda create -n scalplex 
conda activate scalplex
bash /PATH/TO/ScaleRNA/envs/download-scale-tools.sh


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

conda env create --prefix /gpfs3/well/ludwig/users/lay823/larvae_nsc/work/conda/scaleRna-2f8afb7e6816aca4f419a1295c4a6ccc --file /well/ludwig/users/lay823/larvae_nsc/ScaleRna/envs/scalerna.conda.yml
conda activate /gpfs3/well/ludwig/users/lay823/larvae_nsc/work/conda/scaleRna-2f8afb7e6816aca4f419a1295c4a6ccc 

nextflow run /well/ludwig/users/lay823/larvae_nsc/ScaleRna/ \
  -profile conda -params-file /well/ludwig/users/lay823/larvae_nsc/ScaleRna/docs/examples/runParams.yml \
  --genome /well/ludwig/users/lay823/larvae_nsc/test_inst/GRCh38_chr20_genome/genome.json \
  --fastqDir /well/ludwig/users/lay823/larvae_nsc/test_inst/fastq \
  --outDir /well/ludwig/users/lay823/larvae_nsc/test_inst/output






  
