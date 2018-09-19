# Only need to change these two variables
PKG_NAME=grpc-cpp
USER=0x1997

OS=linux-64
mkdir ~/conda-bld
conda config --set anaconda_upload no
export CONDA_BLD_PATH=~/conda-bld
export VERSION=1.15.0
conda build .
anaconda -t $CONDA_UPLOAD_TOKEN upload -u $USER $CONDA_BLD_PATH/$OS/$PKG_NAME-$VERSION-*.tar.bz2 --force