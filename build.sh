#!/bin/sh

mkdir -p tmp

echo "Generating APL..."
python util/build_apl.py src/presentation_layer.json > tmp/apl.build

echo "Generating docs..."
python util/build_doc.py src/presentation_layer.json > tmp/doc.build

echo "Assembling template..."
python util/build_tmpl.py "`pwd`" $1

cp tmp/doc.build ./OPTIONS.md
rm tmp/apl.build
rm tmp/doc.build
rm tmp/irules.build
rm tmp/asm.build
rmdir tmp
