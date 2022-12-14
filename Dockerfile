FROM nvcr.io/nvidia/pytorch:21.06-py3

RUN pip install --upgrade pip && pip install \
    pytorch-lightning \
    timm \
    pytorch-segmentation-models

WORKDIR /app

COPY . /app/

