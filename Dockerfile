FROM jupyter/scipy-notebook:5197709e9f23

USER root

RUN apt-get update && \
    apt-get install -y ssh git man git-annex

RUN pip install --no-cache-dir notebook==6.0.3

RUN pip install --no-cache-dir -r requirements.txt

ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}
