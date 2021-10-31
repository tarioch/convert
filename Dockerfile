FROM ubuntu:latest

RUN apt update && \
    apt upgrade -y && \
    apt install -y \
      autoconf \
      build-essential \
      ffmpeg \
      git \
      libargtable2-dev \
      libavcodec-dev  \
      libavformat-dev \
      libavutil-dev \
      libsdl1.2-dev \
      libtool-bin \
      python3 \
      python3-pip \
      vim && \
#
# Clone comskip
    cd /opt && \
    git clone git://github.com/erikkaashoek/Comskip comskip && \
    cd comskip && \
    ./autogen.sh && \
    ./configure && \
    make && \
#
# Clone comchap/comcut
    cd /opt && \
    git clone https://github.com/mgafner/comchap.git && \
#
# Install pytranscoder-ffmpeg
    python3 -m pip install pytranscoder-ffmpeg
