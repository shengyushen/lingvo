# lingvo need python2
apt install python2.7
ln -s /usr/bin/python2.7 /usr/bin/python2
# python2's pip
apt-get install python-pip

#pip2 install tensorflow
#dont use tensorflow, use tf-nightly, or else you will met with x_ops not defined problem
pip2 install tf-nightly-gpu
pip2 install sympy

