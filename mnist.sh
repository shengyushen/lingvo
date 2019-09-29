mkdir -p /tmp/mnist
bazel run -c opt //lingvo/tools:keras2ckpt -- --dataset=mnist --out=/tmp/mnist/mnist

bazel build --config=cuda -c opt //lingvo:trainer

nvprof -f --quiet --profile-api-trace none --print-gpu-trace --print-nvlink-topology --csv --log-file mnist.csv -o mnist.nvvp \
bazel-bin/lingvo/trainer --run_locally=gpu --mode=sync --model=image.mnist.LeNet5 --logdir=/tmp/mnist/log --logtostderr  2> xx

