

#### 2022-08-10
 Epoch 96:  50%|██████████████████████████████████████▎                                      | 1283/2582 [07:25<07:30,  2.88it/s,Epoch 96:  50%|▍| 1284/2582 [07:25<07:30,  2.88it/s, loss=3.53, v_num=0, train_loss=3.Epoch 98:  77%|▊| 1987/2582 [11:33<03:27,  2.86it/s, loss=3.57, v_num=0, train_loss=3.Epoch 99: 100%|█| 2582/2582 [15:07<00:00,  2.85it/s, loss=3.6, v_num=0, train_loss=3.5LOCAL_RANK: 0 - CUDA_VISIBLE_DEVICES: [0,1,2]
Testing: 0it [00:00, ?it/s]Error executing job with overrides: ['wandb_settings.exp_dir=wikisection_tc32', 'data_params.name=wikisection', 'model_params.latent_dim=32']
Traceback (most recent call last):
  File "scripts/train_encoder.py", line 71, in run
    trainer.test(system)
  File "/misc/projdata17/infofil/wlzhao/miniconda3/envs/lm_via_sp_env/lib/python3.8/site-packages/pytorch_lightning/trainer/trainer.py", line 911, in test
    return self._call_and_handle_interrupt(self._test_impl, model, dataloaders, ckpt_path, verbose, datamodule)
  File "/misc/projdata17/infofil/wlzhao/miniconda3/envs/lm_via_sp_env/lib/python3.8/site-packages/pytorch_lightning/trainer/trainer.py", line 685, in _call_and_handle_interrupt
    return trainer_fn(*args, **kwargs)
  File "/misc/projdata17/infofil/wlzhao/miniconda3/envs/lm_via_sp_env/lib/python3.8/site-packages/pytorch_lightning/trainer/trainer.py", line 954, in _test_impl
    results = self._run(model, ckpt_path=self.tested_ckpt_path)
  File "/misc/projdata17/infofil/wlzhao/miniconda3/envs/lm_via_sp_env/lib/python3.8/site-packages/pytorch_lightning/trainer/trainer.py", line 1199, in _run
    self._dispatch()
  File "/misc/projdata17/infofil/wlzhao/miniconda3/envs/lm_via_sp_env/lib/python3.8/site-packages/pytorch_lightning/trainer/trainer.py", line 1275, in _dispatch
    self.training_type_plugin.start_evaluating(self)
  File "/misc/projdata17/infofil/wlzhao/miniconda3/envs/lm_via_sp_env/lib/python3.8/site-packages/pytorch_lightning/plugins/training_type/training_type_plugin.py", line 206, in start_evaluating
    self._results = trainer.run_stage()
  File "/misc/projdata17/infofil/wlzhao/miniconda3/envs/lm_via_sp_env/lib/python3.8/site-packages/pytorch_lightning/trainer/trainer.py", line 1286, in run_stage
    return self._run_evaluate()
  File "/misc/projdata17/infofil/wlzhao/miniconda3/envs/lm_via_sp_env/lib/python3.8/site-packages/pytorch_lightning/trainer/trainer.py", line 1334, in _run_evaluate
    eval_loop_results = self._evaluation_loop.run()
  File "/misc/projdata17/infofil/wlzhao/miniconda3/envs/lm_via_sp_env/lib/python3.8/site-packages/pytorch_lightning/loops/base.py", line 145, in run
    self.advance(*args, **kwargs)
  File "/misc/projdata17/infofil/wlzhao/miniconda3/envs/lm_via_sp_env/lib/python3.8/site-packages/pytorch_lightning/loops/dataloader/evaluation_loop.py", line 110, in advance
    dl_outputs = self.epoch_loop.run(dataloader, dataloader_idx, dl_max_batches, self.num_dataloaders)
  File "/misc/projdata17/infofil/wlzhao/miniconda3/envs/lm_via_sp_env/lib/python3.8/site-packages/pytorch_lightning/loops/base.py", line 145, in run
    self.advance(*args, **kwargs)
  File "/misc/projdata17/infofil/wlzhao/miniconda3/envs/lm_via_sp_env/lib/python3.8/site-packages/pytorch_lightning/loops/epoch/evaluation_epoch_loop.py", line 122, in advance
    output = self._evaluation_step(batch, batch_idx, dataloader_idx)
  File "/misc/projdata17/infofil/wlzhao/miniconda3/envs/lm_via_sp_env/lib/python3.8/site-packages/pytorch_lightning/loops/epoch/evaluation_epoch_loop.py", line 213, in _evaluation_step
    output = self.trainer.accelerator.test_step(step_kwargs)
  File "/misc/projdata17/infofil/wlzhao/miniconda3/envs/lm_via_sp_env/lib/python3.8/site-packages/pytorch_lightning/accelerators/accelerator.py", line 244, in test_step
    return self.training_type_plugin.test_step(*step_kwargs.values())
  File "/misc/projdata17/infofil/wlzhao/miniconda3/envs/lm_via_sp_env/lib/python3.8/site-packages/pytorch_lightning/plugins/training_type/training_type_plugin.py", line 222, in test_step
    return self.model.test_step(*args, **kwargs)
  File "/misc/projdata17/infofil/wlzhao/tc/language_modeling_via_stochastic_processes/language_modeling_via_stochastic_processes/src/systems/brownian_bridge_system.py", line 158, in test_step
    self.log('test_loss', loss.cpu().detach().numpy(), prog_bar=True, on_step=True)
  File "/misc/projdata17/infofil/wlzhao/miniconda3/envs/lm_via_sp_env/lib/python3.8/site-packages/pytorch_lightning/core/lightning.py", line 409, in log
    apply_to_collection(
  File "/misc/projdata17/infofil/wlzhao/miniconda3/envs/lm_via_sp_env/lib/python3.8/site-packages/pytorch_lightning/utilities/apply_func.py", line 95, in apply_to_collection
    return function(data, *args, **kwargs)
  File "/misc/projdata17/infofil/wlzhao/miniconda3/envs/lm_via_sp_env/lib/python3.8/site-packages/pytorch_lightning/core/lightning.py", line 575, in __check_allowed
    raise ValueError(f"`self.log({name}, {value})` was called, but `{type(v).__name__}` values cannot be logged")
ValueError: `self.log(test_loss, [3.5434551])` was called, but `ndarray` values cannot be logged

Set the environment variable HYDRA_FULL_ERROR=1 for a complete stack trace.

wandb: Waiting for W&B process to finish, PID 142889
wandb: Program failed with code 1.
wandb: Find user logs for this run at: /misc/projdata17/infofil/wlzhao/tc/language_modeling_via_stochastic_processes/language_modeling_via_stochastic_processes/outputs/2022-08-08/16-51-23/wandb/offline-run-20220808_165123-1k186au4/logs/debug.log
wandb: Find internal logs for this run at: /misc/projdata17/infofil/wlzhao/tc/language_modeling_via_stochastic_processes/language_modeling_via_stochastic_processes/outputs/2022-08-08/16-51-23/wandb/offline-run-20220808_165123-1k186au4/logs/debug-internal.logwandb: Run summary:
wandb:   train_loss 3.52896
wandb:        epoch 99
wandb:     _runtime 91098
wandb:   _timestamp 1660039782
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
wandb: wandb sync /misc/projdata17/infofil/wlzhao/tc/language_modeling_via_stochastic_processes/language_modeling_via_stochastic_processes/outputs/2022-08-08/16-51-23/wandb/offline-run-20220808_165123-1k186au4
