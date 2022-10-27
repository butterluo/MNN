rm -rf build && mkdir build && pushd build
cmake -DMNN_BUILD_DEMO=ON \
      -DMNN_BUILD_QUANTOOLS=ON \
      -DMNN_BUILD_CONVERTER=ON \
      -DMNN_BUILD_TEST=ON \
      -DMNN_AVX512=ON \
      -DMNN_CUDA=OFF \
      -DMNN_DEBUG=ON \
      -DCMAKE_BUILD_TYPE=Debug ..
make -j8
popd