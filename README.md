# Civ5 Pitboss WebHook
Adds webhooks to Sid Meier's Civilization 5 games. Install this on your pitboss server to be notified anytime a player starts/ends their turn or connects/disconnects.

## How to use
1. Edit `steamapps/common/Sid Meier's Civilization V/Assets/DLC/Expansion2/UI/InGame/TopPanel.lua` and append the content of `GameStateHook.lua`. This injects the game hook logic, which logs the game state to the game console. Other files can be used, (i.e. if you do not have BNW), but this file works. If you choose to inject into another file, make sure that it is being loaded when hosting a game.

2. Edit `Documents/My Games/Sid Meier's Civilization 5/config.ini` and enable logging. 
```
;Update these two properties
MessageLog = 1
LoggingEnabled = 1
```

3. Copy `WatchLog.ps1` to `Documents/My Games/Sid Meier's Civilization 5/Logs`. Change `https://my-endpoint.com` to be whatever endpoint you want.

4. Make sure that powershell scripts are enabled on your system. (https:/go.microsoft.com/fwlink/?LinkID=135170)[https:/go.microsoft.com/fwlink/?LinkID=135170]

5. Start the game.

6. Run the `Watchlog.ps1` script. Note that you may need to manually open a powershell console, `cd` to the logs directory, and then run the script. Windows does not seem able to automatically open a powershell console in a folder which contains an apostrophe `'`, which is the case with the default game directory.

## Troubleshooting

### The powershell script shows red text and immediately stops!
- Make sure that the game is running before running the script. Make sure that powershell scripts are enabled. (Step 4.)
