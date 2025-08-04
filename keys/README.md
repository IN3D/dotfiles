# Keys

These are my SSH and GPG keys. They're stored in tarballs encrypted with
`ansible-vault`. When setting up a new system there's a `./setup-secrets.sh`
script to get both installed on a new system.

I haven't gotten around to scripting it the other way. This is more-or-less how
it looks.

### SSH

```sh
cd ~/.ssh
# there may not be a "config" file, need to check before running
tar czf ssh-keys.tar.gz id_* known_hosts config

# encrypt the tarball with ansible
ansible-vault encrypt ssh-keys.tar.gz --output ssh-keys.tar.gz.vault

# move it to the dotfiles directory
mv ssh-keys.tar.gz.vault $HOME/.dotfiles/keys/

# clean up the intermediate tarball
rm ssh-keys.tar.gz
```

### GPG

```sh
cd $HOME/.dotfiles/keys

# export keys
gpg --export-secret-keys --armor > gpg-private.asc
gpg --export --armor > gpg-public.asc

# make the tarball
tar czf gpg-keys.tar.gz gpg-*.asc

# encrypt
ansible-vault encrypt gpg-keys.tar.gz --output gpg-keys.tar.gz.vault

# cleanup
rm gpg-keys.tar.gz gpg-*.asc
```
