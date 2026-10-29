# High Card Balatro Mod

[简体中文](Readme.zh_CN.md) | English

**High Card** is a mod for *Balatro*, inspired by the homonymous Japanese multimedia franchise *High Card*. It introduces 52 unique Jokers based on the series.

## Features

- **New Jokers** - Adds 52 custom Jokers modeled after the X-Playing Cards from *High Card*.
- **New Challenges** - Adds 10 new challenges centered around the Jokers introduced above.
- **Stone Card Logic** - Reveals the normally hidden base value of Stone Cards in a side tooltip.
- **Vanilla Game Fix** - The included `lovely.toml` file fixes a vanilla game bug that prevents Mr. Bones from working when a Game Over is caused by running out of cards in your deck.
- **Multilingual Support** - Includes English, Simplified Chinese, and Traditional Chinese translations.

## Compatibility

The following versions have been tested with this mod:

- **Balatro:** `v1.0.1o-full`
- **Steamodded (SMODS):** `v26.1002.0`
- **Lovely Injector:** `v0.10.0`
- **Operating System:** Windows 11

Other versions may work, but have not necessarily been tested.

## Requirements

- [Balatro](https://store.steampowered.com/app/2379780/Balatro/) `v1.0.1o-full`
- [Steamodded (SMODS)](https://github.com/Steamodded/smods) `v26.1002.0`
- [Lovely Injector](https://github.com/ethangreen-dev/lovely-injector) `v0.10.0`

Install Steamodded and Lovely separately before installing this mod.

## Installation

1. Install Balatro, Steamodded, and Lovely.
2. Download the released ZIP file and extract it.
3. Locate the mod folder containing `HighCard.lua`, `main.json`, and `lovely.toml`.
4. Place that folder directly inside your Balatro `Mods` directory.
   Rename the folder to `HighCard` if necessary, and make sure the mod files are not nested inside an extra directory level.

   - **Windows:** `%AppData%/Balatro/Mods/`
   - **macOS:** `~/Library/Application Support/Balatro/Mods/`
   - **Linux / Steam Deck:** The Mods directory depends on your installation method. For Proton installations, follow the [Steamodded Linux installation guide](https://github.com/Steamodded/smods/wiki/Installing-Steamodded-linux).

5. Launch Balatro and verify that **HIGH CARD** appears in the Mods menu.

If the `Mods` directory does not exist, create it at the appropriate location.

## Directory Structure

```text
HighCard/
├── assets/
│   ├── 1x/
│   └── 2x/
├── localization/
│   ├── en-us.lua
│   ├── zh_CN.lua
│   └── zh_TW.lua
├── HighCard.lua
├── lovely.toml
└── main.json
```

## Localization

Available languages:

- English (`en-us`)
- Simplified Chinese (`zh_CN`)
- Traditional Chinese (`zh_TW`)

## Bug Reports and Feedback

If you encounter a bug or compatibility issue, please [open an Issue](../../issues).

When reporting a problem, include:

- Balatro version
- Steamodded version
- Lovely version
- Steps to reproduce the issue
- Relevant error logs, if available

Suggestions for Joker balancing and additional translations are also welcome.

## Contributing

Bug reports, balancing suggestions, and additional language translations are welcome.

You may submit a [Pull Request](../../pulls) to propose changes for review.
Please note that submitting a Pull Request does not grant permission to redistribute modified versions of this mod.


## License

This project is distributed under a custom non-commercial license.
You may download, use, and redistribute the original, unmodified mod and related assets free of charge for personal, non-commercial purposes.

Redistribution of modified versions and commercial use require prior written permission from the copyright holder.

See [LICENSE](LICENSE) for the full terms.

This is an unofficial fan-made project. It is not affiliated with, endorsed by, or sponsored by the creators or rights holders of *High Card*.
