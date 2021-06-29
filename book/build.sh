gitbook install
book sm -i node_modules build.sh
gitbook build
cp -rf _book/* ../../b1gcat.github.io/
rm -rf _book/* 
