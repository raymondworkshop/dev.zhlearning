#!/bin/bash
#SBATCH --nodes=1
#SBATCH --gres=gpu:0
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=10000M
#SBATCH --partition=infofil01

#DIR=/misc/projdata11/info_fil/wlzhao/workspace
#echo -n "I'm on host: "
#hostname

CUDA_VISIBLE_DEVICES=0 /misc/projdata17/infofil/wlzhao/miniconda3/envs/lm_via_sp_env/bin/python3 \
/misc/projdata17/infofil/wlzhao/tc/language_modeling_via_stochastic_processes/language_modeling_via_stochastic_processes/scripts/train_encoder.py

echo "/misc/projdata17/infofil/wlzhao/miniconda3/envs/lm_via_sp_env/bin/python3 \
/misc/projdata17/infofil/wlzhao/tc/language_modeling_via_stochastic_processes/language_modeling_via_stochastic_processes/scripts/train_encoder.py" 

echo "Done"

