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

ENV PATH /opt/conda/bin:$PATH

COPY environment.yml /environment.yml

RUN conda env create -f /environment.yml

WORKDIR /notebooks
RUN chmod -R a+w /notebooks

EXPOSE 8888

CMD ["bash", "-c", "source activate lurker && jupyter notebook --notebook-dir=/notebooks --ip 0.0.0.0 --no-browser --allow-root"]