FROM ubuntu:noble as base_development

ENV CMAKE_VERSION=3.22.1
ENV LLVM_VERSION=18
ARG BASE_DIR="/src"

WORKDIR ${BASE_DIR}

# DEBIAN_FRONTEND=noninteractive disables interaction with the install incase 
# for some reason it ignores the `-y`
ENV DEBIAN_FRONTEND=noninteractive

#The --allow-releaseinfo-change option tells apt that you explicitly permit the repository's Release 
#file to change its metadata (such as codename or version information).
RUN apt-get --allow-releaseinfo-change update;

RUN apt-get update; \ 
    apt-get upgrade -y;

RUN apt-get install -y \
    build-essential \
    lsb-release \
    wget \
    software-properties-common \ 
    gnupg \
    python3 \ 
    python3-pip \
    netbase \     
    git \
    neovim \
    doxygen \
    gdb \
    libssl-dev \
    openssh-client;

# Download, build, and install CMake
RUN wget https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}.tar.gz;
RUN tar -zxvf cmake-${CMAKE_VERSION}.tar.gz;
WORKDIR "${BASE_DIR}/cmake-${CMAKE_VERSION}"
RUN ./bootstrap;
RUN make -j$(nproc);
RUN make install;
WORKDIR ${BASE_DIR}
RUN rm -rf cmake-${CMAKE_VERSION} && rm cmake-${CMAKE_VERSION}.tar.gz;

## Use the llvm script provided by clang to install clang so that we are not arch dependant
RUN wget https://apt.llvm.org/llvm.sh \
    && chmod +x llvm.sh \
    && ./llvm.sh ${LLVM_VERSION} all \
    && rm llvm.sh \
    && update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-${LLVM_VERSION} 100 \
    && update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-${LLVM_VERSION} 100 \
    && update-alternatives --install /usr/bin/clang-tidy clang-tidy /usr/bin/clang-tidy-${LLVM_VERSION} 100;


CMD ["tail", "-f", "/dev/null"]

