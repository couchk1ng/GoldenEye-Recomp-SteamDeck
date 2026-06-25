#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BUNDLE_DIR="$SCRIPT_DIR/goldeneye-bundle"
ASSETS_DIR="$SCRIPT_DIR/assets"

if [ ! -d "$ASSETS_DIR" ]; then
    echo "ERROR: assets folder not found at $ASSETS_DIR"
    echo "Please place your GoldenEye 007 assets folder next to this script."
    exit 1
fi

unset SDL_GAMECONTROLLER_IGNORE_DEVICES
export SDL_GAMECONTROLLER_ALLOW_STEAM_VIRTUAL_GAMEPAD=1
export SDL_JOYSTICK_HIDAPI=0
export SDL_JOYSTICK_HIDAPI_STEAMDECK=0
export XDG_RUNTIME_DIR=/run/user/1000
export VK_LOADER_LAYERS_DISABLE=VK_LAYER_RENDERDOC_Capture
export LD_LIBRARY_PATH="$BUNDLE_DIR"
exec "$BUNDLE_DIR/ld-linux-x86-64.so.2" \
    --library-path "$BUNDLE_DIR" \
    "$BUNDLE_DIR/ge" \
    --game_data_root "$ASSETS_DIR"
