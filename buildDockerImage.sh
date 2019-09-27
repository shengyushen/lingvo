mkdir -p /tmp/lingvo/docker
cp ./docker/dev.dockerfile /tmp/lingvo/docker
LINGVO_DIR="/tmp/lingvo"  # (change to the cloned lingvo directory, e.g. "$HOME/lingvo")
LINGVO_DEVICE="gpu"  # (Leave empty to build and run CPU only docker)
docker build --tag tensorflow:lingvo $(test "$LINGVO_DEVICE" = "gpu" && echo "--build-arg base_image=nvidia/cuda:10.0-cudnn7-runtime-ubuntu16.04") - < ${LINGVO_DIR}/docker/dev.dockerfile
docker run --rm $(test "$LINGVO_DEVICE" = "gpu" && echo "--runtime=nvidia") -it -v ${LINGVO_DIR}:/tmp/lingvo -v ${HOME}/.gitconfig:/home/${USER}/.gitconfig:ro -p 6006:6006 -p 8888:8888 --name lingvo tensorflow:lingvo bash
bazel test -c opt --test_output=streamed //lingvo:trainer_test //lingvo:models_test

