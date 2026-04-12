cd /well/ludwig/users/lay823/larvae_nsc

# Clone github
git clone https://github.com/ScaleBio/ScaleRna.git

# Install dependecies and create enviroment
module load Miniforge3
conda create -n scalplex 
conda activate scalplex
bash /PATH/TO/ScaleRNA/envs/download-scale-tools.sh
