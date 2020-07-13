FROM jupyter/scipy-notebook:5197709e9f23

USER root

# Install Dependencies
RUN apt-get update && apt-get upgrade -y && \
	apt-get install -y build-essential pkg-config cmake ssh git man git-annex pigz && \
	apt-get clean -y && apt-get autoclean -y && apt-get autoremove -y

# Install Python packages
RUN pip install --no-cache-dir awscli==1.18.97 datalad==0.13.0 nibabel==3.1.1 notebook==6.0.3 numpy pandas pybids==0.11.1

# Get dcm2niix from GitHub and compile
RUN cd /tmp && \
	git clone -b v1.0.20200331 https://github.com/rordenlab/dcm2niix.git && \
	cd dcm2niix && mkdir build && cd build && \
	cmake -DBATCH_VERSION=ON -DUSE_OPENJPEG=ON .. && \
	make && make install

ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}
