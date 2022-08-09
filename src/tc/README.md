
## A experiment on Language modeling via stochastic processes
[[Paper]](https://arxiv.org/pdf/2203.11370.pdf) 

## setup ENV

1. Create a new virtual environment `conda create -n lm_via_sp python=3.8`
    + env:  /misc/projdata17/infofil/wlzhao/anaconda3  
            - /Users/zhaowenlong/miniconda3/envs/lm_via_sp_env

    + > tcsh  
            > conda activate lm_via_sp_env  
            > setenv HOME /misc/projdata17/infofil/wlzhao  

2. In this repository, run: 
```
pip install -e . # Installing the right libraries for the virtual environment
cd language_modeling_via_stochastic_processes/transformers
pip install -e . # Installing transformers locally; I modified their GPT2 module to take in our learned embeddings for decoding.
```
3. Make sure you have a [wandb](https://wandb.ai/) account!
4. Change the filepaths to correspond to your own in [language_modeling_via_stochastic_processes/src/constants.py](language_modeling_via_stochastic_processes/src/constants.py).



## Wikisection dataset 
It came from [this prior work](https://github.com/sebastianarnold/WikiSection) 

## Encoder  
```
python3 scripts/train_encoder.py --config-name=brownian_bridge wandb_settings.exp_dir=wikisection_tc32 data_params.name=wikisection model_params.latent_dim=32
```

## Decoder

For training the decoder, you'll need to be in directory `language_modeling_via_stochastic_processes/transformers/examples/pytorch/language-modeling/`.

The script for training the decoder can be found at [`language_modeling_via_stochastic_processes/transformers/examples/pytorch/language-modeling/final_experiments.sh`](https://github.com/rosewang2008/language_modeling_via_stochastic_processes/blob/main/language_modeling_via_stochastic_processes/transformers/examples/pytorch/language-modeling/final_experiments.sh)

An example command for training a decoder with the Brownian bridge encoder on Wikisection: 

```
python run_time_clm.py --model_name_or_path gpt2 --dataset_name wikisection --do_train --do_eval --per_device_eval_batch_size=1 --per_device_train_batch_size=1 --save_total_limit=1 --load_best_model_at_end=True --overwrite_output_dir --num_train_epochs=10 --seed=1 --encoder_filepath=${path2repo}/language_modeling_via_stochastic_processes/models/wikisection/tc32/epoch=99-step=21999.ckpt --latent_dim=32 --output_dir LM_wikisection_32 --evaluation_strategy=steps --eval_steps=1000 --use_contrastive_embeddings

```

## Generation

An example command for generating long Wikisection texts with the Brownian bridge encoder: 

```
python3 run_decoding_from_embeddings.py --model_type=gpt2 --model_name_or_path=${path2repo}/language_modeling_via_stochastic_processes/transformers/examples/pytorch/language-modeling/LM_wikisection_32/ --prompt="<|endoftext|>" --num_return_sequences=1 --num_intervals=1000 --method=sample --stop_token="<|endoftext|>" --dataset_name=wikisection --encoder_filepath=${path2repo}/language_modeling_via_stochastic_processes/models/wikisection/tc32/epoch=99-step=75299.ckpt --latent_dim=32 --project=LM_wikisection --no_eos --label=LM_wikisection_32 --seed=0
```

