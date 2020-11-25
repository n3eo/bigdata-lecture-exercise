FROM python:3.7.7

RUN useradd jupyter
RUN mkdir /home/jupyter
RUN chown jupyter:jupyter /home/jupyter

RUN apt update -y
RUN apt install -y wget gnupg software-properties-common
RUN wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add -
RUN add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
RUN apt update -y
RUN apt install adoptopenjdk-8-hotspot -y

ENV JAVA_HOME=/usr/lib/jvm/adoptopenjdk-8-hotspot-amd64

RUN pip3 install pyspark==2.4.5 jupyter

USER jupyter

RUN mkdir /home/jupyter/work
WORKDIR /home/jupyter

CMD ["jupyter", "notebook", "--ip", "0.0.0.0", "--no-browser"]
EXPOSE 8888