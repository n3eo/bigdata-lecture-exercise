FROM bitnami/python:3.6

RUN useradd jupyter
RUN mkdir /home/jupyter
RUN chown jupyter:jupyter /home/jupyter

RUN apt update -y
RUN apt install -y wget gnupg software-properties-common openjdk-11-jdk

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

RUN pip3 install pyspark==3.1.2 jupyter sparkmonitor pandas numpy plotly

USER jupyter

RUN mkdir /home/jupyter/work
WORKDIR /home/jupyter

RUN jupyter nbextension install sparkmonitor --py --user --symlink 
RUN jupyter nbextension enable sparkmonitor --py --user            
RUN jupyter serverextension enable --py --user sparkmonitor
RUN ipython profile create && echo "c.InteractiveShellApp.extensions.append('sparkmonitor.kernelextension')" >>  $(ipython profile locate default)/ipython_kernel_config.py


CMD ["jupyter", "notebook", "--ip", "0.0.0.0", "--no-browser", "--NotebookApp.token=''"]#
EXPOSE 8888