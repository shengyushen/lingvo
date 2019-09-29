# bazel build --config=cuda -c opt //lingvo:trainer

nvprof -f --quiet --profile-api-trace none --print-gpu-trace --print-nvlink-topology --csv --log-file mnist.csv -o mnist.nvvp \
bazel-bin/lingvo/trainer --run_locally=gpu --mode=sync --model=image.mnist.LeNet5 --logdir=/tmp/mnist/log --logtostderr

