FROM ubuntu

RUN apt update && \
    apt install -y git python3 wget python3-virtualenv python3-pip curl && \
    git clone https://github.com/robertalanm/discord.git

RUN python3 -m virtualenv --python=/usr/bin/python3 /opt/venv

ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m virtualenv --python=/usr/bin/python3 $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"


WORKDIR discord

add .secrets /discord/config/.secrets

RUN pip install -r requirements.txt

RUN chmod +x download_model.sh && \ 
./download_model.sh 774M

WORKDIR config

RUN python create_auth.py 

WORKDIR /discord/

CMD ["python", "gpt-chatbot-client.py"]
