#!/bin/bash

INDIR=../lib/
INPREFIX=oms

OUTDIR=../dist/
OUTNAME=${INPREFIX}.min.js
OUTFILE=${OUTDIR}${OUTNAME}

coffee --output $OUTDIR --compile ${INDIR}${INPREFIX}.coffee

closure-compiler \
  --compilation_level ADVANCED_OPTIMIZATIONS \
  --js ${OUTDIR}${INPREFIX}.js \
  --externs google_maps_api_v3_7.js \
  --output_wrapper '(function(){%output%}).call(this);' \
> $OUTFILE

echo '/*' $(date) '*/' >> $OUTFILE

cp $OUTFILE ../../gh-pages/bin
cp ${OUTDIR}${INPREFIX}.js ../../gh-pages/bin