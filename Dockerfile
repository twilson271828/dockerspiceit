FROM fedora:25
LABEL maintainter="Tyler Wilson<tjwilson@usgs.gov>"
WORKDIR /work/users/tjwilson/dockerspiceit/deploy

#RUN dnf -y install qt-devel
#RUN dnf install -y wget
RUN dnf install -y vim-minimal
RUN dnf install -y gcc-c++
RUN dnf install -y gcc-gfortran
RUN dnf install -y  blas-devel
#RUN dnf install -y  boost-devel
#RUN dnf install -y  xorg-x11-xauth xterm
RUN dnf install -y  libicu
#RUN dnf install -y  libjpeg
RUN dnf install -y  mesa-libGL
#RUN dnf install -y  mesa-libGLU-devel
#RUN dnf install -y  mesa-dri-drivers
#RUN dnf install -y  libXi
#RUN dnf install -y  libXcursor
#RUN dnf install -y  libXcomposite
#RUN dnf install -y  glibc-devel.x86_64
#RUN dnf install -y  libXtst
#RUN dnf install -y  libxslt
#RUN dnf install -y  alsa-lib.x86_64
#RUN dnf install -y  zlib-devel.x86_64
#RUN dnf install -y  libvpx-devel
#RUN dnf install -y  snappy-devel
#RUN dnf install -y  libsrtp-devel
RUN dnf install -y libpng
RUN dnf install -y tbb-devel
RUN dnf install -y  pcre-devel
RUN mkdir -p /usgs/pkgs/local/v007/lib
ADD dynlibs /usgs/pkgs/local/v007/lib
ADD staticlibs /usgs/pkgs/local/v007/lib
ADD etc etc
ADD logs logs
ADD spiceit spiceit
ADD inc inc
ADD spiceit.pro spiceit.pro
ADD isis.pri isis.pri

#ADD /work/users/tjwilson/dockerspiceit/deploy/staticlibs .
#ADD /work/users/tjwilson/dockerspiceit/deploy/src .
#ADD /work/users/tjwilson/dockerspiceit/deploy/etc .
#ADD /work/users/tjwilson/dockerspiceit/deploy/inc .
#ADD /work/users/tjwilson/dockerspiceit/deploy/logs .
#ADD /work/users/tjwilson/dockerspiceit/deploy/isis.pri .
#ADD /work/users/tjwilson/dockerspiceit/deploy/spiceit.pro .



EXPOSE 6666/tcp








ENTRYPOINT [ "/bin/bash"]
