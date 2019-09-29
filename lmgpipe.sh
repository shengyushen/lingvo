# https://github.com/tensorflow/lingvo/issues/48

nvprof -f --quiet --profile-api-trace none --print-gpu-trace --print-nvlink-topology --csv --log-file lmgpipe.csv -o lmgpipe.nvvp \
bazel-bin/lingvo/trainer --run_locally=gpu --mode=sync --model=lm.one_billion_wds.OneBWdsGPipeTransformer --logdir=/tmp/mnist/log --logtostderr --worker_split_size=4
