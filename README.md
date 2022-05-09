# KorQuAD_lightning
Training KorQuAD1.0 by KoBERT from huggingface🤗 and torch-lightning

## Navigation
1. [Objective]
2. [Quick start](#how-to-use)
3. [Pretraining using torch-lightning]
4. [Evaluation result]
5. [Contributors]

# Objective
Training KorQuAD1.0 dataset by using KoBERT from huggingface🤗 and Pytorch-lightning

# Quick start
Please create a project first and create a file named 'output/'

```bash
mkdir output
```

And then run bash file train.sh for training KorQuAD1.0

```bash
bash train.sh
```

in bash file
```bash
DATE=$(date +"%Y-%m-%d")
CKPT_DIR="{your file directory}/${DATE}/"
mkdir ${CKP_DIR}

python Trainer.py --model_name_or_path monologg/kobert \
--max_seq_length 512 \
--output_dir outputs/ \
--data_dir data/ \
--train_batch_size 8 \
--train_batch_size 8 \
--experiment_name $(date +%D-%T) \
--max_epochs 10 \
--learning_rate 5e-4 \
--ngpu 4 \
--warmup_steps 100 \
--task_name 'kobert' \
--checkpoints_dir ${CKPT_DIR} \
```
make checkpoint file named date tha you run it

# Pretraining using torch-lightning
Torch-lightning models in 'models.py'
which is using KoBERT from huggingface "monologg/kobert"


KorQuAD 1.0 is preprocessed in 'dataloader.py'


I use 'tokenizaion_kobert' for tokenization and preprocessing by squad preprocessing from huggingface


I use 3 NVIDIA TITAN XP 12GB for training

# Evaluation result
```bash
bash test.sh
```
In bash file
```bash
#!/bin/bash
DATE=$(date +"%Y-%m-%d")
mkdir ${CKP_DIR}

python Tester.py --model_name_or_path monologg/kobert \
--output_dir outputs/ \
--data_dir data/ \
--data_file "data/KorQuAD_v1.0_dev.json" \
--prediction_file "outputs/predictions_.json" \
--ngpu 1 \
--checkpoints_dir_callback "{your checkfile dir}/2022-04-30/2022-04-30_10:34:54/epoch=09-val_loss=1.39.ckpt" \
```



### Hyperparameter setting
|                         | Hardware | Max len |   LR | Batch |  Warmup Step |
| :---------------------- | -------: | ------: | ---: | ----: |  ----------: |
| **KoBERT-Base** | NVIDIA TITAN XP 12GB |    512 | 5e-4 |    8 |         2M |         100 |

### Result
|                         | Exact Match | F1 score |   
| :---------------------- | -------: | ------: |
| **KoBERT-Base** | 52.667  |    77.49 |


## Contributors

[Jangwon Park](https://github.com/monologg), [Donggyu Kim](https://github.com/donggyukimc), and (https://github.com/monologg/KoBERT-KorQuAD)
