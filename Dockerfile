FROM continuumio/miniconda3 

RUN apt install -y git python3 python3-pip

RUN git clone https://github.com/robertalanm/discord.git

WORKDIR discord

RUN [ "conda", "env", "create" ]

RUN [ "/bin/bash", "-c", "source activate sybil-discord" ]

RUN pip3 install -r requirements.txt

RUN sh download_models.sh 774M

 

