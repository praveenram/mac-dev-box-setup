mac-dev-box-setup
=================

MAC OS X Dev Box Setup Script

This script is to automatically bootstrap a freshly installed MAC OS X Machine as a Developer Machine.

After a fresh Install of MAC OS X, run the following command to get git on the MAC if not already installed.

    curl https://gist.github.com/praveenram/6934418/raw/958162c99203bc15f6879437ecbc580584cedc4a/setup_git.sh | sh

After that, clone this repository.

    git clone --recursive https://github.com/praveenram/mac-dev-box-setup.git

Run

    sudo setup.sh

At this point in time, the script will install:

1. XCode - Command line tools.
2. Homebrew - Mac Package Manager.
3. Latest Version of Git
