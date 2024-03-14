FROM ubuntu:latest
RUN apt update
RUN apt install -y build-essential gcc-10 g++-10 libgtest-dev cmake
RUN apt install -y doxygen indent python3 python3-pip
RUN apt install -y libboost-random-dev libboost-log-dev libboost-thread-dev libboost-filesystem-dev
RUN apt install -y flex bison
RUN pip install strictdoc
RUN cd /usr/src/googletest && cmake . && cmake --build . --target install
COPY entry.sh /entry.sh
# Used for pretty formatting
ENV LANG en_US.UTF-8
ENTRYPOINT ["bash","/entry.sh"]
