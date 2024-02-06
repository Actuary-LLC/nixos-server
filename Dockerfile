FROM jupyter/datascience-notebook:x86_64-notebook-7.0.6
USER jovyan
RUN pip install --upgrade pip && \
    pip3 install --upgrade pip
RUN pip3 install dyalog-jupyter-kernel==2.0.2
RUN python -m 'dyalog_kernel' install