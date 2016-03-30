FROM andrewosh/binder-base

MAINTAINER Greg Caporaso <gregcaporaso@gmail.com>

USER root

# Start xserver for ete3
RUN apt-get update
RUN apt-get install -y xvfb
ENV DISPLAY :99
ADD https://raw.githubusercontent.com/kfatehi/docker-chrome-xvfb/master/xvfb_init /etc/init.d/xvfb
RUN chmod a+x /etc/init.d/xvfb
RUN bash -e /etc/init.d/xvfb start
RUN sleep 5

USER main

# Install IAB
RUN /bin/bash -c "source activate python3 && conda install --yes -c biocore python=3.5 pip numpy scipy matplotlib nose scikit-bio jupyter seaborn pandas markdown2 networkx pyqt"
RUN /bin/bash -c "source activate python3 && pip install https://github.com/gregcaporaso/An-Introduction-To-Applied-Bioinformatics/archive/master.zip"
