#!/bin/bash

# Format all Haskell files with ormolu
echo "Formatting Haskell files with ormolu..."

for file in src/Problem*.hs test/*.hs; do
    if [ -f "$file" ]; then
        echo "Formatting $file"
        ormolu --mode inplace "$file"
    fi
done

echo "All files formatted!"