# ssy 2019-9-28 this file should be run in a whole when in a normal machine such as aws
# but if you are behind a proxy, you can run the following 5 line on aws to create the tensorflow:lingvo
sudo mkdir -p /tmp/lingvo/docker
sudo cp ./docker/dev.dockerfile /tmp/lingvo/docker
LINGVO_DIR="/tmp/lingvo"  # (change to the cloned lingvo directory, e.g. "$HOME/lingvo")
LINGVO_DEVICE="gpu"  # (Leave empty to build and run CPU only docker)
# this is the old one that use 1604
#docker build --tag tensorflow:lingvo $(test "$LINGVO_DEVICE" = "gpu" && echo "--build-arg base_image=nvidia/cuda:10.0-cudnn7-runtime-ubuntu16.04") - < ${LINGVO_DIR}/docker/dev.dockerfile
docker build --tag tensorflow:lingvo $(test "$LINGVO_DEVICE" = "gpu" && echo "--build-arg base_image=nvidia/cuda:10.0-cudnn7-runtime-ubuntu18.04") - < ${LINGVO_DIR}/docker/dev.dockerfile


#and the run the following lines behind proxy
# this is the old one , dont use
#docker run --rm $(test "$LINGVO_DEVICE" = "gpu" && echo "--runtime=nvidia") -it -v ${LINGVO_DIR}:/tmp/lingvo -v ${HOME}/.gitconfig:/home/${USER}/.gitconfig:ro -p 6006:6006 -p 8888:8888 --name lingvo tensorflow:lingvo bash

# add my dir mapping from /home/ssy to /home/nfs1/ssy
# also dont rm the container
# this only need to run once, because it will generate lingvo name that can not be used again
#docker run  $(test "$LINGVO_DEVICE" = "gpu" && echo "--runtime=nvidia") -it -v ${LINGVO_DIR}:/tmp/lingvo -v /home/nfs1/ssy:/home/ssy -v ${HOME}/.gitconfig:/home/${USER}/.gitconfig:ro -p 6006:6006 -p 8888:8888 --name lingvo tensorflow:lingvo bash

# these are used very time to start lingvo
# also change to lingvo1
#nvidia-docker start lingvo1
#nvidia-docker exec -it lingvo1 /bin/bash



# this is run in docker 
#bazel test -c opt --test_output=streamed //lingvo:trainer_test //lingvo:models_test

