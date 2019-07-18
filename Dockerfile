FROM centos:6.7
MAINTAINER Yongqiang Li "jasonleehust@gmail.com"
RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6
RUN yum -y  install mercurial bison flex gperf ksh pkgconfig \
    libpng12-devel libjpeg-devel libxml2-devel \
    libxslt-devel systemd-devel glib2-devel  gtk2-devel \
    libXtst-devel pango-devel freetype-devel wget unzip vim java-1.8.0-openjdk-devel java-1.8.0-openjdk java-1.8.0-openjdk-headless \
    libXxf86vm-devel mesa-libGL-devel perl-Time-HiRes tar perl-JSON \
    centos-release-scl scl-utils

RUN yum -y install devtoolset-6 python27 rh-ruby24 
RUN scl enable devtoolset-6 bash && scl enable python27 bash && scl enable rh-ruby24 bash

# download Gradle 4.8.0
RUN wget https://services.gradle.org/distributions/gradle-4.8-bin.zip
RUN unzip gradle-4.8-bin.zip
RUN rm -rf gradle-4.8-bin.zip

# download Ant 1.10.5
RUN wget http://mirror.cogentco.com/pub/apache//ant/binaries/apache-ant-1.10.5-bin.zip
RUN unzip apache-ant-1.10.5-bin.zip
RUN rm -rf apache-ant-1.10.5-bin.zip

# CMake 3.13.4
RUN wget https://github.com/Kitware/CMake/releases/download/v3.13.4/cmake-3.13.4.tar.gz
RUN tar xf cmake-3.13.4.tar.gz
RUN rm -rf cmake-3.13.4.tar.gz

# Put them into $PATH
RUN export PATH=/root/apache-ant-1.10.5/bin:/root/gradle-4.8/bin:/root/cmake-3.13.4-Linux-x86_64/bin:$PATH

# Sync OpenJFX 8 latest code.
RUN hg clone http://hg.openjdk.java.net/openjfx/8u-dev/rt




