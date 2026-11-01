# Recover My Wi-Fi Password

**Forgot your Wi-Fi password?** Recover the passwords of the networks your own Windows PC has already saved, in one click. No installation, no Python, no dependencies: just one `.bat` file.

> This tool only shows passwords already stored on the computer you are using. It cannot reveal passwords of networks your PC has never connected to.

## Features

- Lists every saved Wi-Fi network with its password
- Optional export to a text file on your Desktop
- Works on Windows 7 / 8 / 10 / 11 (English and French)
- Uses only the built-in `netsh` command

## Usage

1. Download `Recover_My_WiFi_Password.bat` from the [latest release](../../releases/latest).
2. Right-click the file and choose **Run as administrator** (recommended).
3. Choose whether to save the results, then read your networks and passwords.

## Example output

```
MyHomeWiFi  :  12345678
Office-5G   :  s3cretPass
CoffeeShop  :  [none]
```

`[none]` means the network is open or no password is stored.

## Language support

English and French Windows are supported out of the box. For another language, add the labels printed by `netsh wlan show profiles` and `netsh wlan show profile name="X" key=clear` to the two `findstr` commands in the script.

## "Unknown publisher" warning

Windows shows a security warning for any downloaded `.bat` file. Click **Run**, or right-click the file, open **Properties** and tick **Unblock**. The script is plain text: open it in Notepad to read exactly what it does.

## Security notice

Use this tool on your own computer to recover your own passwords. Do not run it on devices you do not own or have permission to use. Delete any exported text file when you no longer need it, since it contains passwords in plain text.

## License

MIT, see [LICENSE](LICENSE).
