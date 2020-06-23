FROM crops/poky:ubuntu-20.04

ARG BITBAKE_DIR=/opt/bitbake/
COPY ./bitbake/ /opt/bitbake/

ENV PATH="${BITBAKE_DIR}/bin:$PATH"
ENV PYTHONPATH="${BITBAKE_DIR}/lib:$PYTHONPATH"

VOLUME /work/
CMD ["--workdir", "/work/"]

