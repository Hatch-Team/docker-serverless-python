FROM lambci/lambda:build-nodejs8.10

ENV AWS_DEFAULT_REGION eu-west-1 \
    PYTHONPATH=/var/runtime \
    PKG_CONFIG_PATH=/var/lang/lib/pkgconfig:/usr/lib64/pkgconfig:/usr/share/pkgconfig

RUN curl https://lambci.s3.amazonaws.com/fs/python3.6.tgz | tar -xz -C / && \
    sed -i '/^prefix=/c\prefix=/var/lang' /var/lang/lib/pkgconfig/python-3.6.pc && \
    curl https://www.python.org/ftp/python/3.6.1/Python-3.6.1.tar.xz | tar -xJ && \
    cd Python-3.6.1 && \
    LIBS="$LIBS -lutil -lrt" ./configure --prefix=/var/lang && \
    make -j$(getconf _NPROCESSORS_ONLN) libinstall inclinstall && \
    cd .. && \
    rm -rf Python-3.6.1 && \
    pip3 install awscli virtualenv --no-cache-dir

RUN npm install -g yarn
