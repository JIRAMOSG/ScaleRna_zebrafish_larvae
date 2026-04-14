


nextflow run ScaleBio/ScaleRna \
    --runFolder /well/ludwig/users/lay823/larvae_nsc/data/bcl/260327_LH00452_0387_B23JH7HLT3 \
    --profile singularity \
    --samples /well/ludwig/users/lay823/larvae_nsc/data/samples.csv \
    --genome  /well/ludwig/users/lay823/larvae_nsc/reference/genome.json \
    --params-file /well/ludwig/users/lay823/larvae_nsc/ScaleRna/docs/examples/runParams.yml \
    --outDir results


