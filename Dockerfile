FROM andrewosh/binder-base

MAINTAINER Greg Caporaso <gregcaporaso@gmail.com>

USER main

# Start xserver for ete3
RUN export DISPLAY=:99.0
RUN sh -e /etc/init.d/xvfb start

# Install IAB
RUN conda install pip numpy scipy matplotlib nose scikit-bio jupyter seaborn pandas markdown2 networkx pyqt
RUN pip install https://github.com/gregcaporaso/An-Introduction-To-Applied-Bioinformatics/archive/master.zip
