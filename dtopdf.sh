#!/bin/bash

if [ $# -lt 1 ]; then
        echo "Incorrect format."
        echo "Use: $0 filename.doc/x"
        exit 1
fi

for arg in "$@"
do
        soffice --convert-to pdf "$arg"
done
