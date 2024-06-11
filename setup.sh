#!/bin/bash

# Make sure the user has the required dependencies installed
requirements=("python3" "sed")
for cmd in "${requirements[@]}"; do
  if ! command -v $cmd &> /dev/null; then
    echo "$cmd is required but was not found in your PATH."
    exit 1
  fi
done

# Create a virtual env and install the dependencies
echo "Setting up the virtual environment..."
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
echo "Downloading the LatexOCR models..."
python3 -c "from pix2tex.cli import LatexOCR; LatexOCR()"
deactivate

# Copy the workflow to the services directory
echo "Setting up the workflow..."
cp -ir mathocr.workflow ~/Library/Services/

# Replace the placeholder with the local directory.
ESCAPED_WD=$(pwd | sed -e 's/[\/&]/\\&/g')
sed -i '' "s/MATH_OCR_DIR/$ESCAPED_WD/" "$HOME/Library/Services/mathocr.workflow/Contents/document.wflow"

echo "Setup complete. Go to System Preferences -> Keyboard -> Keyboard Shortcuts... -> Services -> General and assign a keyboard shortcut to mathocr."
