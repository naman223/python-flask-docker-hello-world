FROM odo-docker-signed-local.artifactory-builds.oci.oraclecorp.com/language-detection-service-api-linux_arm64_v8:1.1-task-armplatform.24
RUN yum -y install python3 \
                   python3-libs \
                   python3-pip \
                   python3-setuptools && \
    rm -rf /var/cache/yum/*
ENV PATH="/usr/.venv/bin:$PATH"
RUN echo $PATH
MAINTAINER Naman Mehta "naman.mehta@gmail.com"
COPY . /app
WORKDIR /app
RUN pip3 install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["app.py"]
