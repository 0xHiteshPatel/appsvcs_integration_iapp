#!/bin/sh

mkdir -p tmp
mkdir -p parts

BUILDOPT=""
BUNDLEDIR=""

if [ -n "$1" ]
then
 BUILDOPT="-a $1"
fi

if [ -n "$2" ]
then
 BUNDLEDIR="-b $2"
fi

echo BUILDOPT=$BUILDOPT
echo BUNDLEDIR=$BUNDLEDIR

echo "Generating APL..."
python util/build_apl.py $BUNDLEDIR src/presentation_layer.json > tmp/apl.build

echo "Generating docs..."
python util/build_doc.py src/presentation_layer.json > tmp/doc.build

echo "Assembling template..."
python util/build_tmpl.py $BUILDOPT $BUNDLEDIR "`pwd`"
python util/build_tmpl.py $BUILDOPT $BUNDLEDIR -o parts/iapp.tcl -r src/implementation_only.template "`pwd`"  > /dev/null
python util/build_tmpl.py $BUILDOPT $BUNDLEDIR -o parts/iapp.apl -r tmp/apl.build "`pwd`"  > /dev/null

cp tmp/doc.build ./OPTIONS.html
rm tmp/apl.build
rm tmp/doc.build
rm tmp/bundler.build
rmdir tmp
