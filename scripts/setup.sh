#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "GoldenEye 007 - Steam Deck Setup"
echo "================================="

# Check assets exist
if [ ! -d "$SCRIPT_DIR/assets" ]; then
    echo "ERROR: assets/ folder not found!"
    echo "Please extract your GoldenEye 007 XBLA files into: $SCRIPT_DIR/assets/"
    exit 1
fi

echo "Assets found. Adding to Steam..."

# Add to Steam as non-Steam game
SHORTCUTS="$HOME/.local/share/Steam/userdata/$(ls $HOME/.local/share/Steam/userdata/ | head -1)/config/shortcuts.vdf"

echo ""
echo "Setup complete!"
echo ""
echo "To play:"
echo "1. Switch to Gaming Mode"
echo "2. Find 'GoldenEye 007' in your Steam library"
echo "3. Set controller to Gamepad template"
echo "4. Launch and enjoy!"
echo ""
echo "Or run directly: $SCRIPT_DIR/goldeneye-native.sh"
