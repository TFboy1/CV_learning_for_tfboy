# 基础镜像
FROM nvidia/cuda:8.0-cudnn5-devel-ubuntu16.04

RUN apt-get update && \
    apt-get install -y python3.8 \
    python3-pip
            
RUN pip3 install --upgrade pip && \
    pip3 install jupyter
    
RUN useradd -ms /bin/bash jupyter
USER jupyter
WORKDIR home/jupyter 
EXPOSE 8888                                           
ENTRYPOINT ["jupyter", "notebook","--allow-root","--ip=0.0.0.0","--port=8888","--no-browser"]