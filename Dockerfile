#FROM nvcr.io/nvidia/pytorch:21.06-py3

# Para que reconheça a GPU dentro do container
FROM nvidia/cuda:11.1.1-base-ubuntu20.04

# Precisa passar um caminho para o miniconda
ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"

RUN apt update \
    && apt install -y htop python3-dev wget

# A seguir instalamos o miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \ 
    && mkdir root/.conda \
    && sh Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh

RUN conda create -y -n ml python=3.7
RUN pytorch-lightning

WORKDIR /app

COPY . /app
RUN /bin/bash -c "cd /app \
   && source activate ml \
   && pip install -r requirements.txt"


