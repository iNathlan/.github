#!/bin/bash
for file in profile/windgets/*.svg; do
  # Replace main container backgrounds
  sed -i 's/fill="#0d1117"/fill="transparent"/g' "$file"
  # Replace card backgrounds
  sed -i 's/fill="#161b22"/fill="transparent"/g' "$file"
  # Remove border strokes if there are any random ones
  # We might just leave the strokes for circles/icons because they are UI elements
done
