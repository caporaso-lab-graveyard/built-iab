FROM andrewosh/binder-base

MAINTAINER Greg Caporaso <gregcaporaso@gmail.com>

USER root

# Start xserver for ete3
RUN apt-get update
RUN apt-get install -y xvfb
# RUN Xvfb :99 &
# ENV DISPLAY :99.0

USER main

# Install IAB
RUN /bin/bash -c "source activate python3 && conda install --yes -c biocore python=3.5 pip numpy scipy matplotlib nose scikit-bio jupyter seaborn pandas markdown2 networkx pyqt"
RUN /bin/bash -c "source activate python3 && pip install xvfbwrapper https://github.com/gregcaporaso/An-Introduction-To-Applied-Bioinformatics/archive/master.zip"
ADD https://raw.githubusercontent.com/arokem/xvfbmagic/master/xvfbmagic.py /home/main/notebooks/
