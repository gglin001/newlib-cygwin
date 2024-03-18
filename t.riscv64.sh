# https://github.com/gglin001/Dockerfiles/tree/master/qemu
# https://github.com/gglin001/Dockerfiles/tree/master/riscv-gnu-toolchain

# env `PATH` has `/opt/riscv`

# apt install texinfo
micromamba install texinfo
micromamba install abseil-cpp bear

./configure --help

# ----

rm -rf build

mkdir -p build && cd build

CFLAGS_FOR_TARGET="-mcmodel=medany" ../configure --target=riscv64-unknown-elf --prefix=$(pwd)/install

bear -- make -j8

make install