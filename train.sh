#!/bin/bash
DATE=$(date +"%Y-%m-%d")
CKPT_DIR="/media/storage/checkpoints/korquad/${DATE}/"
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