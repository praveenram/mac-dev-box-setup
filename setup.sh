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

echo "Installing autoconf"
if [ $status -le 5 ];
then
   sh set_progress.sh 5
   sudo -u ${THE_USER} brew install autoconf
   echo "Done!"
else
   echo "autoconf already installed"
fi

echo "Installing automake"
if [ $status -le 6 ];
then
   sh set_progress.sh 6
   sudo -u ${THE_USER} brew install automake
   echo "Done!"
else
   echo "automake already installed"
fi

echo "Installing cmake"
if [ $status -le 7 ];
then
   sh set_progress.sh 7
   sudo -u ${THE_USER} brew install cmake
   echo "Done!"
else
   echo "cmake already installed"
fi

echo "Installing wget"
if [ $status -le 8 ];
then
   sh set_progress.sh 8
   sudo -u ${THE_USER} brew install wget
   echo "Done!"
else
   echo "wget already installed"
fi

echo "Installing ctags"
if [ $status -le 9 ];
then
   sh set_progress.sh 9
   sudo -u ${THE_USER} brew install ctags
   echo "Done!"
else
   echo "Ctags already installed"
fi

echo "Installing ack"
if [ $status -le 10 ];
then
   sh set_progress.sh 10
   sudo -u ${THE_USER} brew install ack
   echo "Done!"
else
   echo "ack already installed"
fi

echo "Installing openssl"
if [ $status -le 11 ];
then
   sh set_progress.sh 11
   sudo -u ${THE_USER} brew install openssl
   echo "Done!"
else
   echo "openssl already installed"
fi

echo "Installing libyaml"
if [ $status -le 12 ];
then
   sh set_progress.sh 12
   sudo -u ${THE_USER} brew install libyaml
   echo "Done!"
else
   echo "libyaml already installed"
fi

echo "Install RVM - Ruby Version Manager"
if [ $status -le 13 ];
then
   sh set_progress.sh 13
   sudo -u ${THE_USER} curl -L https://get.rvm.io | bash -s stable
   echo "Done!"
else
   echo "rvm already installed"
fi

echo "Setting homebrew cellar path before os path for commands available in both"
if [ $status -le 14 ];
then
   sh set_progress.sh 14
   sudo -u ${THE_USER} echo "export PATH=/usr/local/bin:/usr/local/sbin/:$PATH" >> $HOME/.bashrc
   echo "Done!"
else
   echo "path already set!"
fi