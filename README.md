# steam-compat-love
Steam Compatibility Runtime - LÖVE (Balatro Native Linux)

Quick and dirty because polish isn't my thing. I also didn't know how to make custom Steam Compatibility Tools -OR- what Love2d was beyond a surface level, two hours ago. PRs welcome.

Due to how Steam launches executables, and how AppImageLauncher works, you CANNOT use love-11.5-x86_64.AppImage with Steam IF AppImageLauncher is installed.
If using AppImageLauncher, you must unpack the appimage, and edit launch.sh switching from the AppImage to the love/AppRun line for this to work.


YOU -MUST- EDIT launch.sh TO UNCOMMENT ONE OF THE TWO LAUNCHER LINES. IF YOU DON'T BALATRO WILL EITHER NOT LAUNCH, OR SHOW BLACK + PROGRESS BAR THEN CLOSE.


STEP ONE:
- Download AppImage from `https://github.com/love2d/love/releases/download/11.5/love-11.5-x86_64.AppImage`
-- Do not change filename
- Make executable, place in `/opt/Applications`

STEP TWO:
- Download this repo and copy `love-launcher/` to `~/.local/share/Steam/compatibilitytools.d/`

STEP THREE WITHOUT AppImageLauncher:
- Edit `launch.sh` to uncomment AppImage run line.


STEP THREE WITH AppImageLauncher:
- terminal:
```
mkdir /opt/love-11.5
cd /opt/love-11.5
/opt/Applications/love-11.5-x86_64.AppImage --appimage-extract
```
- Edit `launch.sh` to uncomment love/AppRun line

STEP FOUR:
Restart Steam, enable Compatibility for Balatro (or other love2d framework games) and select `love-launcher`


Paths may be changed. `launch.sh` is the only file to edit.
