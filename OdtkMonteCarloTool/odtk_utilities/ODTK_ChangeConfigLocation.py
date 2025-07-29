import winreg

odtkConfig = "C:\\ODTK_MC\\ODTK\\Config"

key = winreg.OpenKey(
    winreg.HKEY_CURRENT_USER, "SOFTWARE\\AGI\\ODTK\\7.0", 0, winreg.KEY_ALL_ACCESS
)
winreg.SetValueEx(key, "ConfigDir", 0, winreg.REG_SZ, odtkConfig)
readConfig = (winreg.QueryValueEx(key, "ConfigDir"))[0]
winreg.CloseKey(key)

odtkLogPath = odtkConfig + "\\Logs"
key = winreg.OpenKey(
    winreg.HKEY_CURRENT_USER, "SOFTWARE\\AGI\\ODTK\\7.0", 0, winreg.KEY_ALL_ACCESS
)
winreg.SetValueEx(key, "LogPath", 0, winreg.REG_SZ, odtkLogPath)
readLogPath = (winreg.QueryValueEx(key, "LogPath"))[0]
winreg.CloseKey(key)

odtkSplit = odtkConfig.split("\\")
odtkSplit.pop()
odtkUserHome = "\\".join(odtkSplit)
key = winreg.OpenKey(
    winreg.HKEY_CURRENT_USER, "SOFTWARE\\AGI\\ODTK\\7.0", 0, winreg.KEY_ALL_ACCESS
)
winreg.SetValueEx(key, "UserHome", 0, winreg.REG_SZ, odtkUserHome)
readUserHome = (winreg.QueryValueEx(key, "UserHome"))[0]
winreg.CloseKey(key)

print("New Config: " + readConfig)
print("New Log Path: " + readLogPath)
print("New User Home: " + readUserHome)
