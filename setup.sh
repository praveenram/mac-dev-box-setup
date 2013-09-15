echo "Checking for Sudo Permission"
if [ `id -u` -eq 0 ];
then
   echo "Running as sudo"
else
   echo "Please run the script again with sudo permissions"
   exit 1
fi

THE_USER=${SUDO_USER:-${USERNAME}}

echo "Installing XCode - CLI"
if [ -f ./.progress ];
then 
   status=$(cat ./.progress)
   echo $status
   if [ $status -le 1 ];
   then
      sh xcode_cli/xcode-cli-tools.sh
      echo "Xcode Installation Complete"
   else
      echo "Xcode Already Installed!"
   fi
else
   sh ./set_progress.sh 1
   sh xcode_cli/xcode-cli-tools.sh
   echo "Xcode Installation Complete"
fi

status=$(cat ./.progress)
echo $status

echo "Installing Homebrew - The MAC Package Manager"
if [ $status -le 2 ];
then
   sh ./set_progress.sh 2
   sudo -u ${THE_USER} ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
   echo "Homebrew Install Complete"
else
   echo "Homebrew already installed"
fi

echo "Checking brew integrity and Updating brew packages"
if [ $status -le 3 ];
then
   sh set_progress.sh 3
   sudo -u ${THE_USER} brew doctor
   sudo -u ${THE_USER} brew update
   echo "Done!"
else
   echo "Brew Already Up to date"
fi

echo "Installing latest version of git"
if [ $status -le 4 ];
then
   sh set_progress.sh 4
   sudo -u ${THE_USER} brew install git
   echo "Done!"
else
   echo "Git Already Up to date"
fi
