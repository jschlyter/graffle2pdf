#!/bin/sh

for f in *.graffle; do
	osascript `dirname $0`/graffle2pdf.scpt `pwd`/$f
done
