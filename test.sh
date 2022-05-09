#!/bin/bash
DATE=$(date +"%Y-%m-%d")
mkdir ${CKP_DIR}

python Tester.py --model_name_or_path monologg/kobert \
--output_dir outputs/ \
--data_dir data/ \
--data_file "data/KorQuAD_v1.0_dev.json" \
--prediction_file "outputs/predictions_.json" \
--ngpu 1 \
--checkpoints_dir_callback "/media/storage/checkpoints/korquad/2022-04-30/2022-04-30_10:34:54/epoch=09-val_loss=1.39.ckpt" \