# https://github.com/tensorflow/lingvo/issues/48

#nvprof -f --quiet --profile-api-trace none --print-gpu-trace --print-nvlink-topology --csv --log-file lmgpipe.csv -o lmgpipe.nvvp \
#bazel-bin/lingvo/trainer --run_locally=gpu --mode=sync --model=lm.one_billion_wds.OneBWdsGPipeTransformerWPM --logdir=/tmp/mnist/log --logtostderr --worker_split_size=4


#nvprof -f --quiet --profile-api-trace none --print-gpu-trace --print-nvlink-topology --csv --log-file lmgpipe.csv -o lmgpipe.nvvp \
#bazel-bin/lingvo/trainer --run_locally=gpu --mode=sync --model=lm.one_billion_wds.OneBWdsGPipeTransformerWPM --logdir=/tmp/mnist/log --logtostderr --controller_gpus=4 --worker_gpus=4 --worker_split_size=4 > outxx4 2> errxx4
# 1 gpu is ok
bazel-bin/lingvo/trainer --run_locally=gpu --mode=sync --model=lm.one_billion_wds.OneBWdsGPipeTransformerWPM --logdir=/tmp/mnist/log --logtostderr --controller_gpus=1 --worker_gpus=1 --worker_split_size=1 > outxx1 2> errxx1

