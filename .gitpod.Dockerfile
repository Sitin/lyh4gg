FROM gitpod/workspace-full-vnc

# Install Haskell stack
RUN brew install haskell-stack
RUN stack setup

# Install IDE requirements
RUN stack install brittany hlint
RUN git clone https://github.com/haskell/haskell-ide-engine --branch 1.4 --single-branch --recurse-submodules \
    && cd haskell-ide-engine  \
    && stack install haskell-ide-engine \
    && cd .. \
    && rm -rf haskell-ide-engine
ENV PATH=/home/gitpod/.local/bin:$PATH

# Install Jupyter kernel Haskell
#RUN brew install zeromq libmagic cairo pkg-config pango
#RUN cd /workspace && git clone https://github.com/gibiansky/IHaskell
#RUN cd /workspace/IHaskell && pip3 install -r requirements.txt && stack install --fast && ihaskell install --stack
#RUN jupyter labextension install jupyterlab-ihaskell
