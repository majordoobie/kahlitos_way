# Set the system name and processor architecture
SET(CMAKE_SYSTEM_NAME Linux)
SET(CMAKE_SYSTEM_PROCESSOR arm)

# Specify the cross-compilation toolchain
SET(CMAKE_C_COMPILER /bin/arm-linux-gnueabihf-gcc)
SET(CMAKE_CXX_COMPILER /bin/arm-linux-gnueabihf-g++)

# Set the sysroot to point to the Raspberry Pi sysroot in the Docker container
SET(CMAKE_SYSROOT /opt/code/rpi3_sysroot)

# Additional flags to ensure the sysroot is used for includes and libraries
SET(CMAKE_C_FLAGS "--sysroot=/opt/code/rpi3-sysroot -march=armv7-a")
SET(CMAKE_CXX_FLAGS "--sysroot=/opt/code/rpi3-sysroot -march=armv7-a")

