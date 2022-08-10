
## Experiments on [Language modeling via stochastic processes](https://arxiv.org/pdf/2203.11370.pdf) 

### setup ENV

1. Create a new virtual environment  
    + anaconda issues      
        >  cd /misc/projdata17/infofil/wlzhao/anaconda3  
        - /Users/zhaowenlong/miniconda3/envs/lm_via_sp_env  
        - Only python3.8 works  

    + tcsh env issues on the school server      
        > tcsh  
        > conda activate lm_via_sp_env  
        > setenv HOME /misc/projdata17/infofil/wlzhao  

        > pip install -e .  
        > cd language_modeling_via_stochastic_processes/transformers  
        > pip install -e .  

2. Register a [wandb](https://wandb.ai/) account  
    + W&B is integrated in  ML Code  
    + wandb config issues  
        - update identity = "cuhk-tc" in [language_modeling_via_stochastic_processes/scripts/train_encoder.py](language_modeling_via_stochastic_processes/scripts/train_encoder.py)  
        
        - create project="language_modeling_via_stochastic_processes" on wandb website    
        
        - update exp_dir = "/misc/projdata17/infofil/wlzhao/tc/language_modeling_via_stochastic_processes/language_modeling_via_stochastic_processes/experiments/wikisection_tc32" in config files  
            + pytorch Lightning issues  
            + this will save models of each epoch in each dataset into this dir  

     
3. Change the filepaths in [language_modeling_via_stochastic_processes/src/constants.py](language_modeling_via_stochastic_processes/src/constants.py).



### Get Wikisection dataset from [this prior work](https://github.com/sebastianarnold/WikiSection) 

### Encoder  
* command  
    > cd ./tc/language_modeling_via_stochastic_processes  
    > <del>python3 scripts/train_encoder.py --config-name=brownian_bridge wandb_settings.exp_dir=wikisection_tc32 data_params.name=wikisection model_params.latent_dim=32</del>  
    > python3 scripts/train_encoder.py  



* log  
    > 
wandb: Waiting for W&B process to finish, PID 90517  
wandb: Program failed with code 1.  
wandb: Find user logs for this run at: /misc/projdata17/infofil/wlzhao/tc/language_modeling_via_stochastic_processes/language_modeling_via_stochastic_processes/outputs/2022-07-27/13-29-29/wandb/offline-run-20220727_132929-3vhvxmsi/logs/debug.log  
wandb: Find internal logs for this run at: /misc/projdata17/infofil/wlzhao/tc/language_modeling_via_stochastic_processes/language_modeling_via_stochastic_processes/outputs/2022-07-27/13-29-29/wandb/offline-run-20220727_132929-3vhvxmsi/logs/debug-internal.log  
wandb: Run summary:  
wandb:   train_loss 3.52896  
wandb:        epoch 99  
wandb:     _runtime 91589  
wandb:   _timestamp 1658991359  
wandb:        _step 258200  
wandb:    test_loss 3.54346  
wandb: Run history:  
wandb:   train_loss ▂▂▂▃▁▁▂▃▆▂▂▂▂▂▃▁▅▃▂▂▆▃▃▁▅█▁▃▁▂▂▃▆▃▆▁▇▄▃▂  
wandb:        epoch ▁▁▁▁▂▂▂▂▂▃▃▃▃▃▃▄▄▄▄▄▅▅▅▅▅▆▆▆▆▆▆▇▇▇▇▇████  
wandb:     _runtime ▁▁▁▂▂▂▂▂▂▃▃▃▃▃▃▄▄▄▄▄▅▅▅▅▅▅▆▆▆▆▆▇▇▇▇▇▇███  
wandb:   _timestamp ▁▁▁▂▂▂▂▂▂▃▃▃▃▃▃▄▄▄▄▄▅▅▅▅▅▅▆▆▆▆▆▇▇▇▇▇▇███  
wandb:        _step ▁▁▁▂▂▂▂▂▂▃▃▃▃▃▃▄▄▄▄▄▅▅▅▅▅▅▆▆▆▆▆▇▇▇▇▇▇███  
wandb:    test_loss ▁  
wandb:  
wandb: You can sync this run to the cloud by running:  
wandb: wandb sync /misc/projdata17/infofil/wlzhao/tc/language_modeling_via_stochastic_processes/language_modeling_via_stochastic_processes/outputs/2022-07-27/13-29-29/wandb/offline-run-20220727_132929-3vhvxmsi  


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

