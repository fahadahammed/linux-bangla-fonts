# Bangla Fonts for your Linux Machine

Welcome to Bangla font installer for linux. This script is tested or maintained only for Debian based distributions like Ubuntu, Debian, Linux Mint, Deepin etc.

### Dependency

It depends on some tools which you have to allow it to install, it will ask.

- wget
- fontconfig

## Install:
### pypi version
Make sure you pip3 installed

```bash
$ pip3 install --upgrade lbfi
$ lbfi install
```
This will install a tool called lbfi in your system and you will be able to use this always update the fonts.

PyPi link: https://pypi.org/project/lbfi/

### New Version (lbfi Version 1)
```bash
wget --no-check-certificate https://raw.githubusercontent.com/fahadahammed/linux-bangla-fonts/master/dist/lbfi -O lbfi;chmod +x lbfi;./lbfi
```

### Old Version
```
wget --no-check-certificate https://raw.githubusercontent.com/fahadahammed/linux-bangla-fonts/master/font.sh -O font.sh;chmod +x font.sh;bash font.sh;rm font.sh
```

You can find an article in: https://fahadahammed.com/single-command-to-download-and-install-all-bangla-fonts-in-your-linux/
