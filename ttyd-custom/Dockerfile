FROM tsl0922/ttyd

ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=America/Santiago
ENV DEBIAN_FRONTEND=noninteractive

RUN ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update -y && \
apt-get install -y --no-install-recommends tzdata && \
apt-get install -y cloc && \
apt-get install python3-pip -y && \
apt-get install ruby-full -y && \
apt-get install git-all -y && \
apt-get install -q -y binutils openjdk-11-jdk-headless 

RUN pip3 install bandit
RUN gem install brakeman

RUN useradd -ms /bin/bash ttyd 
RUN usermod -aG sudo ttyd
RUN chown ttyd.ttyd /media


COPY ./bin /home/ttyd/bin
COPY ./work /home/ttyd/work
COPY ./exercise /home/ttyd/exercise 

RUN chown -R ttyd.ttyd /home/ttyd/exercise

USER ttyd
WORKDIR /home/ttyd


CMD ["ttyd", "-c", "USER:PASSWORD", "bash"]

