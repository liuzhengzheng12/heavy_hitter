cp heavy_hitter.conf $SDE_INSTALL/share/p4/targets/
cd $SDE/pkgsrc/p4-build-4.1.1.15
./configure --prefix=$SDE_INSTALL --with-tofino P4_NAME=heavy_hitter P4_PATH=~/heavy_hitter/heavy_hitter.p4 --enable-thrift
make -j4
make install