# Non-scripted stuff:
#
# - Create a droplet
#   - For goodness sake use ssh keys not emailed passwords
# - DNS records
#   - This will take the longest so do it first
# - Security
#   - [First 5 minutes on a server][fivemin]
#     - You may have to [upgrade the kernel][upgradekernel]
# - SSH config
#   - Add some ssh configs
# - Follow ubuntu-setup.sh
#
# [fivemin]: http://plusbryan.com/my-first-5-minutes-on-a-server-or-essential-security-for-linux-servers
# [upgradekernel]: https://www.digitalocean.com/community/tutorials/how-to-update-a-digitalocean-server-s-kernel-using-the-control-panel#SelectKernelinControlPanel

# install git
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install make git

# use zsh
chsh -s $(which zsh)

# install rcm (be sure to check if the version has updated)
wget https://thoughtbot.github.io/rcm/debs/rcm_1.2.3-1_all.deb
sudo dpkg -i rcm_1.2.3-1_all.deb
rm rcm_1.2.3-1_all.deb

# required for vim configuration
sudo apt-get install exuberant-ctags

# install dotfiles
git clone --recursive https://github.com/jez/dotfiles ~/.dotfiles
cd ~/.dotfiles
RCRC="./rcrc" rcup
cd -

# login from different session to test dotfiles!

# The minimal host-specific setup is to make a gitconfig and a util/host.sh
# file. See ghost for a good example.

sudo apt-get install tree ack-grep htop

# custom motd
sudo chmod -x /etc/update-motd.d/00-header
sudo chmod -x /etc/update-motd.d/10-help-text
# pick a motd and copy it to /etc/motd

