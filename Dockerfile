FROM jupyter/datascience-notebook:hub-4.0.2

ARG JUPYTERHUB_VERSION=4.0.2
RUN pip3 install --no-cache-dir --upgrade \
    jupyterhub==$JUPYTERHUB_VERSION \
    #Jupyter packages
    gh-scoped-creds \
    jupyterlab \ 
    jupyterlab-git \
    retrolab
# System packages and git-lfs
USER root
RUN apt-get update && \
    apt-get install -y git curl gnupg sudo && \
    curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo -E bash && \
    apt-get install -y git-lfs && \
    git lfs install && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
USER jovyan
