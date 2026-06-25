# GoldenEye 007 - Native Steam Deck Build

A fully native Vulkan build of GoldenEye 007 (Xbox 360 XBLA) for Steam Deck.

**No Proton. No VKD3D. No emulation.** Runs directly on RADV VANGOGH at ~60 FPS.


## Screenshots / Video

*(Video coming soon)*

## What makes this different?

Other Linux approaches run the Windows binary through Proton, which crashes on AMD GPUs due to VKD3D rejecting a degenerate bloom texture descriptor. This build compiles natively for Linux and talks directly to Vulkan — bypassing the crash entirely.

Key fixes discovered during development:
- **Steam Deck controller fix**: Steam sets `SDL_GAMECONTROLLER_IGNORE_DEVICES` which blocks its own virtual gamepad. We hardcode `allow_steam_virtual_gamepad = true` in SDL3 so the controller is always detected.
- **RenderDoc overlay**: Disabled via `VK_LOADER_LAYERS_DISABLE=VK_LAYER_RENDERDOC_Capture`
- **Bundled glibc**: SteamOS ships an older glibc than required, so we bundle the Arch Linux runtime libs.

## Installation

1. Download the latest release tarball
2. Extract it: `tar xzf goldeneye-steamdeck-v1.0.tar.gz`
3. Extract your GoldenEye 007 XBLA assets and place them in an `assets/` folder next to the extracted files
4. In Steam Desktop Mode, add `goldeneye-launcher` as a Non-Steam Game
5. Set Start In to the folder containing the launcher
6. In Steam controller settings for the game, set template to **Gamepad**
7. Switch to Gaming Mode and launch!


## Getting the game assets

This repo contains no game files. You need the GoldenEye 007 Xbox 360 XBLA release.
Extract using [Extract-STFS](https://github.com/XboxChaos/extract-stfs) or similar tool.

## Building from source

See [BUILDING.md](BUILDING.md) for full build instructions.

## Credits

- [SunJaycy](https://github.com/SunJaycy/GoldenEye-Recomp) - GoldenEye Recomp source
- [ReXGlue SDK](https://github.com/SunJaycy/GoldenEye-Recomp-rexglue) - Xbox 360 recompilation framework
- SDL3 team - SDL3 library


## Support

After weeks of late-night sessions debugging SDL3, fighting glibc mismatches, and tracing Steam's virtual gamepad through layers of Vulkan code, GoldenEye 007 finally runs natively on Steam Deck. If you enjoyed playing it and want to fuel future projects, a coffee would be much appreciated!

[![Buy Me A Coffee](https://img.shields.io/badge/Buy%20Me%20A%20Coffee-support-yellow)](https://buymeacoffee.com/couchk1ng)
