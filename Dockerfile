FROM kmtsui/wcsimhybrid:latest

RUN echo "Hello from inside the container" && \
    echo "Install optical_fit"  && \
    mkdir optical_fit && \
    wget https://github.com/kmtsui/wcsim_hybrid_attenuation_fit/archive/refs/heads/experimental.tar.gz && tar xvf experimental.tar.gz --strip-components=1 -C optical_fit && \ 
    cd optical_fit && mkdir build && cd build && \
    source /opt/geant4/bin/geant4.sh && \
    export WCSIMDIR=/WCSim && export LD_LIBRARY_PATH=$WCSIMDIR/:$LD_LIBRARY_PATH && \
    cmake3 ../ -DUSE_WCSIM=1 && make install 

RUN echo "Analyzing sample diffuser MC" && \
    cd /data && \
    source /opt/geant4/bin/geant4.sh && \
    export WCSIMDIR=/WCSim && export LD_LIBRARY_PATH=$WCSIMDIR/:$LD_LIBRARY_PATH && \
    source /optical_fit/build/Linux/setup.sh && \
    WCSIM_TreeConvert -f wcsim_hybrid.root 

COPY ./optical_fit.entrypoint.sh /optical_fit/
RUN chmod +x /optical_fit/optical_fit.entrypoint.sh

ENTRYPOINT [ "/optical_fit/optical_fit.entrypoint.sh" ]
