#!/bin/sh

#SBATCH --account=csmpistud
#SBATCH --cpus-per-task=32
#SBATCH --partition=csmpi_fpga_short
#SBATCH --time=00:05:00
#SBATCH --output=stencil_omp.out

# Compile on the machine, not the head node
make run_par

for P in 1 2 3 4 5 6; do
    OMP_NUM_THREADS="$P" run_par $1 $2 > results/stencil_run_"$P".txt
done
