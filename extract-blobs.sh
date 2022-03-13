#!/bin/bash

[[ $# = 0 ]] && echo error && exit 1

# Setup
python -m pip install protobuf
python -m pip install Brotli
sudo apt install brotli -y
sudo apt install p7zip-full -y

# Prepare
rm -rf dump
mkdir -p dump
mkdir -p dump/vendor

# Begin 
unzip -o "$1" -d dump
cd dump
[[ ! -f update_metadata_pb2.py ]] && wget https://raw.githubusercontent.com/geek0609/android_tools/main/extract_build_prop/update_metadata_pb2.py
[[ ! -f payload_dumper.py ]] && wget https://raw.githubusercontent.com/geek0609/android_tools/main/extract_build_prop/payload_dumper.py
[[ ! -f sdat2img.py ]] && curl -sLo sdat2img.py https://raw.githubusercontent.com/xpirt/sdat2img/master/sdat2img.py
[[ -f payload.bin ]] && echo "payload found" && python payload_dumper.py payload.bin
[[ -f vendor.new.dat.br ]] && brotli --decompress vendor.new.dat.br && python3 sdat2img.py vendor.transfer.list vendor.new.dat vendor.img

7z x vendor.img -y -ovendor

exit 0