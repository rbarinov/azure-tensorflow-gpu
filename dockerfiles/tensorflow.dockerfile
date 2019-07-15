FROM tensorflow/tensorflow:latest-gpu-py3-jupyter

RUN apt update \
        && apt install -yqq tmux git protobuf-compiler \
        && rm -rf /var/lib/apt/lists/* \
        && pip install keras opencv-python opencv-contrib-python seaborn scipy scikit-image
