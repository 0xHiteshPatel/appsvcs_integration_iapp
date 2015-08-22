@echo off
PATH=%PATH%;c:\Python27;c:\Python26

mkdir tmp

echo Generating APL...
python util/build_apl.py src\presentation_layer.json > tmp\apl.build

echo Generating docs...
python util/build_doc.py src\presentation_layer.json > OPTIONS.md

echo Assembling template...
python util\build_tmpl.py "%cd%"

del tmp\apl.build
del tmp\asm.build
rmdir tmp

