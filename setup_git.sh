echo "Downloading Git - Source Control Manager"
curl -o git.dmg https://git-osx-installer.googlecode.com/files/git-1.8.3.2-intel-universal-snow-leopard.dmg
echo "Mounting Downloaded Installer"
hdiutil mount git.dmg
echo "Installing Git for Mac"
sudo installer -package "/Volumes/Git 1.8.3.2 Snow Leopard Intel Universal/git-1.8.3.2-intel-universal-snow-leopard.pkg" -target "/Volumes/Macintosh"
echo "Unmount Git Drive"
hdiutil unmount "/Volumes/Git 1.8.3.2 Snow Leopard Intel Universal"
echo "Adding git to path for current terminal"
sudo source /etc/profile
echo "Cleaning up downloaded files"
rm git.dmg
echo "Setting vim as default commit edit tool"
git config --global core.editor /usr/bin/vim
echo "Git Installation Complete!"
