FROM lurker-game

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    wget && \
    rm -rf /var/lib/apt/lists/*

# See http://bugs.python.org/issue19846
ENV LANG C.UTF-8

RUN wget -O miniconda.sh https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash miniconda.sh -b -p /opt/conda
RUN rm miniconda.sh && \
    /opt/conda/bin/conda install conda-build

WORKDIR /notebooks
RUN chmod -R a+w /notebooks

COPY environment.yml /environment.yml

RUN /opt/conda/bin/conda env create -f /environment.yml

EXPOSE 8888

CMD [ "source activate sc2 && jupyter notebook --notebook-dir=/notebooks --ip 0.0.0.0 --no-browser --allow-root" ]