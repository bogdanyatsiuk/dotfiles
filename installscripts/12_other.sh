# TMatrix
git clone https://github.com/M4444/TMatrix.git
cd TMatrix
mkdir -p build && cd build
cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr/local ../.
make -j8
sudo make install
cd ../..
rm -rf TMatrix
