#!/bin/sh

mkdir -p tmp
mkdir -p parts

echo "Generating APL..."
python util/build_apl.py src/presentation_layer.json > tmp/apl.build

echo "Generating docs..."
python util/build_doc.py src/presentation_layer.json > tmp/doc.build

echo "Assembling template..."

BUILDOPT=""
if [ -n "$1" ]
then
 BUILDOPT="-a $1"
fi

echo BUILDOPT=$BUILDOPT

python util/build_tmpl.py $BUILDOPT "`pwd`"
python util/build_tmpl.py $BUILDOPT -o parts/iapp.tcl -r src/implementation_only.template "`pwd`"  > /dev/null
python util/build_tmpl.py $BUILDOPT -o parts/iapp.apl -r tmp/apl.build "`pwd`"  > /dev/null

cp tmp/doc.build ./OPTIONS.md
rm tmp/apl.build
rm tmp/doc.build
rm tmp/irules.build
rm tmp/asm.build
rmdir tmp
