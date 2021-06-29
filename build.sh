gitbook install
book sm -i node_modules
gitbook build
cp -rf _book/* ../../b1gcat.github.io/
rm -rf _book/* 
