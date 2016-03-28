FROM andrewosh/binder-base

MAINTAINER Greg Caporaso <gregcaporaso@gmail.com>

USER root

# Start xserver for ete3
RUN apt-get update
RUN apt-get install -y xvfb
RUN export DISPLAY=:99.0
RUN sh -e /etc/init.d/xvfb start

USER main

# Install IAB
RUN conda install pip numpy scipy matplotlib nose scikit-bio jupyter seaborn pandas markdown2 networkx pyqt
RUN pip install https://github.com/gregcaporaso/An-Introduction-To-Applied-Bioinformatics/archive/master.zip
