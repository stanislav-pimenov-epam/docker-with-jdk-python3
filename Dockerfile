FROM openjdk:8-jre-alpine

# Install python
RUN apk update
RUN apk add --no-cache python3 && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi

# Install pythin lybraries
RUN pip install pyyaml

ADD test.py logging.yaml /

RUN which python && python --version
RUN which java && java -version

CMD ["python", "test.py"]