#  https://github.com/tensorflow/lingvo/issues/48 tell us about the gpu setting

LOGDIR=/tmp/mnist/log
GPU_NUM=1

# must first delete the log dir
rm -rf ${LOGDIR}

#nvprof -f --quiet --profile-api-trace none --print-gpu-trace --print-nvlink-topology --csv --log-file lmgpipe.csv -o lmgpipe.nvvp \
#bazel-bin/lingvo/trainer --run_locally=gpu --mode=sync --model=lm.one_billion_wds.OneBWdsGPipeTransformerWPM --logdir=${LOGDIR} --logtostderr --controller_gpus=${GPU_NUM} --worker_gpus=${GPU_NUM} --worker_split_size=${GPU_NUM} > outxx${GPU_NUM} 2> errxx${GPU_NUM}
#bazel-bin/lingvo/trainer --run_locally=gpu --mode=sync --model=lm.one_billion_wds.OneBWdsGPipeTransformerWPM --logdir=${LOGDIR} --logtostderr --controller_gpus=${GPU_NUM} --worker_gpus=${GPU_NUM} --worker_split_size=${GPU_NUM} > outxx${GPU_NUM} 2> errxx${GPU_NUM}
 bazel-bin/lingvo/trainer --run_locally=gpu --mode=sync --model=lm.one_billion_wds.OneBWdsGPipeTransformerWPM --logdir=${LOGDIR} --logtostderr                              --worker_gpus=${GPU_NUM} --worker_split_size=${GPU_NUM} > outxx${GPU_NUM} 2> errxx${GPU_NUM}

