cd /well/ludwig/users/lay823/larvae_nsc
module load Nextflow/24.04.2
module load Java/11.0.20

nextflow run /well/ludwig/users/lay823/larvae_nsc/ScaleRna/ \
    --runFolder /well/ludwig/users/lay823/larvae_nsc/data/bcl/260327_LH00452_0387_B23JH7HLT3/ \
    --profile singularity \
    --samples /well/ludwig/users/lay823/larvae_nsc/data/samples.csv \
    --genome  /well/ludwig/users/lay823/larvae_nsc/reference/genome.json \
    --params-file /well/ludwig/users/lay823/larvae_nsc/data/runParams.yml \
    --outDir results_scaleplex
# sbatch scaleplex.sh
# https://scalebio.github.io/ScaleRna-docs/scaleplex-outputs/
