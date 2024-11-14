FROM ubuntu:noble

ENV CMAKE_VERSION=3.29.8
ENV LLVM_VERSION=18
ARG BASE_DIR="/opt/code"

WORKDIR ${BASE_DIR}

# DEBIAN_FRONTEND=noninteractive disables interaction with the install incase 
# for some reason it ignores the `-y`
ENV DEBIAN_FRONTEND=noninteractive

#The --allow-releaseinfo-change option tells apt that you explicitly permit the repository's Release 
#file to change its metadata (such as codename or version information).
RUN apt-get --allow-releaseinfo-change update;
 
RUN apt-get install -y unminimize;
RUN yes | unminimize;

RUN apt-get install -y \
    build-essential \
    lsb-release \
    wget \
    software-properties-common \
    gnupg \
    python3 \
    python3-pip \
    git \
    netbase \
    neovim \
    doxygen \
    libssl-dev \
    iputils-ping \
    zsh \
    man \
    curl \
    iproute2 \
    openssh-client;


# Download zsh and setup fzf
SHELL ["/bin/zsh", "-c"]
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended;
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf;
RUN ~/.fzf/install;

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
RUN wget https://apt.llvm.org/llvm.sh;
RUN chmod +x llvm.sh;
RUN ./llvm.sh ${LLVM_VERSION} all;
RUN rm llvm.sh;
RUN update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-${LLVM_VERSION} 100;
RUN update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-${LLVM_VERSION} 100;
RUN update-alternatives --install /usr/bin/clang-tidy clang-tidy /usr/bin/clang-tidy-${LLVM_VERSION} 100;
RUN update-alternatives --install /usr/bin/lldb-server lldb-server /usr/bin/lldb-server-${LLVM_VERSION} 100;

# Add the compilers needed to compile into raspberry pi
RUN apt install -y \
    gcc-arm-linux-gnueabihf \
    g++-arm-linux-gnueabihf;


CMD ["tail", "-f", "/dev/null"]
