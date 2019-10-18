FROM continuumio/miniconda3 

RUN apt install -y git python3 python3-pip wget curl && \
git clone https://github.com/robertalanm/discord.git


WORKDIR discord

add .secrets /discord/config/.secrets

RUN [ "conda", "env", "create" ]

RUN [ "/bin/bash", "-c", "source activate sybil_discord" ]

RUN pip3 install -r requirements.txt

RUN chmod +x download_model.sh && \ 
./download_model.sh 774M

WORKDIR config

RUN python3 create_auth.py 

RUN cd ..

RUN python3 gpt-chatbot-client.py
