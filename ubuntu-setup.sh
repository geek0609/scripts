curl -s https://raw.githubusercontent.com/akhilnarang/scripts/master/setup/android_build_env.sh | bash -s

###
### IMPORTANT !!! REPLACE WITH YOUR PERSONAL DETAILS IF NECESSARY
###
# Configure git
echo -e "\nSetting up Git..."

git config --global user.email "astroashwin@outlook.com"
git config --global user.name "Ashwin DS"

git config --global alias.cp 'cherry-pick'
git config --global alias.c 'commit'
git config --global alias.f 'fetch'
git config --global alias.rb 'rebase'
git config --global alias.rs 'reset'
git config --global alias.ck 'checkout'
git config --global credential.helper 'cache --timeout=99999999'
echo "Done."

if [[ $SHELL = *zsh* ]]; then
sh_rc=".zshrc"
else
sh_rc=".bashrc"
fi

# Unlimited history file
sed -i 's/HISTSIZE=.*/HISTSIZE=-1/g' $sh_rc
sed -i 's/HISTFILESIZE=.*/HISTFILESIZE=-1/g' $sh_rc

echo -e "Done."

# Increase tmux scrollback buffer size
echo "set-option -g history-limit 6000" >> .tmux.conf