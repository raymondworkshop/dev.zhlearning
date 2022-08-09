
## A experiment on [Language modeling via stochastic processes](https://arxiv.org/pdf/2203.11370.pdf) 

### setup ENV

1. Create a new virtual environment  
    + anaconda installation    
        >  cd /misc/projdata17/infofil/wlzhao/anaconda3  
            - /Users/zhaowenlong/miniconda3/envs/lm_via_sp_env  
            - Only python3.8 works  

    + tcsh env on the school server      
        > conda activate lm_via_sp_env  
        > setenv HOME /misc/projdata17/infofil/wlzhao  

        > pip install -e .  
        > cd language_modeling_via_stochastic_processes/transformers  
        > pip install -e .  

2. Register a [wandb](https://wandb.ai/) account
    + wandb config issues  

3. Change the filepaths to correspond to your own in [language_modeling_via_stochastic_processes/src/constants.py](language_modeling_via_stochastic_processes/src/constants.py).



### Get Wikisection dataset from [this prior work](https://github.com/sebastianarnold/WikiSection) 

### Encoder  
```
python3 scripts/train_encoder.py --config-name=brownian_bridge wandb_settings.exp_dir=wikisection_tc32 data_params.name=wikisection model_params.latent_dim=32
```

### Decoder

For training the decoder, you'll need to be in directory `language_modeling_via_stochastic_processes/transformers/examples/pytorch/language-modeling/`.

The script for training the decoder can be found at [`language_modeling_via_stochastic_processes/transformers/examples/pytorch/language-modeling/final_experiments.sh`](https://github.com/rosewang2008/language_modeling_via_stochastic_processes/blob/main/language_modeling_via_stochastic_processes/transformers/examples/pytorch/language-modeling/final_experiments.sh)

An example command for training a decoder with the Brownian bridge encoder on Wikisection: 

```
python run_time_clm.py --model_name_or_path gpt2 --dataset_name wikisection --do_train --do_eval --per_device_eval_batch_size=1 --per_device_train_batch_size=1 --save_total_limit=1 --load_best_model_at_end=True --overwrite_output_dir --num_train_epochs=10 --seed=1 --encoder_filepath=${path2repo}/language_modeling_via_stochastic_processes/models/wikisection/tc32/epoch=99-step=21999.ckpt --latent_dim=32 --output_dir LM_wikisection_32 --evaluation_strategy=steps --eval_steps=1000 --use_contrastive_embeddings

```

### Generation

An example command for generating long Wikisection texts with the Brownian bridge encoder: 

```
python3 run_decoding_from_embeddings.py --model_type=gpt2 --model_name_or_path=${path2repo}/language_modeling_via_stochastic_processes/transformers/examples/pytorch/language-modeling/LM_wikisection_32/ --prompt="<|endoftext|>" --num_return_sequences=1 --num_intervals=1000 --method=sample --stop_token="<|endoftext|>" --dataset_name=wikisection --encoder_filepath=${path2repo}/language_modeling_via_stochastic_processes/models/wikisection/tc32/epoch=99-step=75299.ckpt --latent_dim=32 --project=LM_wikisection --no_eos --label=LM_wikisection_32 --seed=0
```

