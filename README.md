mac-dev-box-setup
=================

MAC OS X Dev Box Setup Script

This script is to automatically bootstrap a freshly installed MAC OS X Machine as a Developer Machine.

After a fresh Install of MAC OS X, run the following command to get git on the MAC if not already installed.

    curl https://raw.github.com/praveenram/mac-dev-box-setup/master/setup_git.sh | sh

After that, clone this repository.

git clone --recursive https://github.com/praveenram/mac-dev-box-setup.git

Run setup.sh as root.

At this point in time, the script will install:

1. XCode - Command line tools.
2. Homebrew - Mac Package Manager.
3. Latest Version of Git
