#!/bin/bash
#SBATCH -J montecarloTemplate
#SBATCH -A cs475-575
#SBATCH -p class
#SBATCH --gres=gpu:1
#SBATCH -o montecarloTemplate.out
#SBATCH -e montecarloTemplate.err
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=grimshaa@oregonstate.edu
for BLOCKSIZE in 16, 32, 64 128
do
/usr/local/apps/cuda/cuda-10.1/bin/nvcc -DBLOCKSIZE=$BLOCKSIZE -o montecarloTemplate montecarloTemplate.cu
./montecarloTemplate
done