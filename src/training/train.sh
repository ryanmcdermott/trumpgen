python /root/torch-rnn/scripts/preprocess.py \
--input_txt /opt/trumpgen/training/speeches.txt \
--output_h5 /opt/trumpgen/training/data/trump.h5 \
--output_json /opt/trumpgen/training/data/trump.json

th /root/torch-rnn/train.lua \
-input_h5 /opt/trumpgen/training/data/trump.h5 \
-input_json /opt/trumpgen/training/data/trump.json
