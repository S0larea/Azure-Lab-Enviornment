#/bin/bash

# Allways be sure that apt is up to date
apt update -y

# Make the necessary upgrades to any packages installed
apt upgrade -y

# Get rid of old packages while installng the new ones
apt full-upgrade -y

# Get rid of unused packages as well as any associated config files
apt autoremove --purge -y

# If you wanted to condense all of these steps into a single line, do the folowing
apt update -y && apt upgrade -y && apt full-upgrade -y && apt-get autoremove --purge -y