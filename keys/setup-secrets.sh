#!/run/current-system/sw/bin/bash

set -e

if ! command -v ansible-vault &> /dev/null; then
  echo "Error: ansible-vault is required"
  echo "Install ansible vault either with the package manager or with 'pip install ansible-core'"
fi

echo "Setting up encrypted secrets..."

# SSH keys
if [ -f $HOME/.dotfiles/keys/ssh-keys.tar.gz.vault ]; then
  echo "Decrypting SSH keys..."
  ansible-vault decrypt $HOME/.dotfiles/keys/ssh-keys.tar.gz.vault --output /tmp/ssh-keys.tar.gz
  mkdir -p $HOME/.ssh/
  tar xzf /tmp/ssh-keys.tar.gz -C $HOME/.ssh/
  chmod 700 $HOME/.ssh
  chmod 600 $HOME/.ssh/id_*
  chmod 644 $HOME/.ssh/*.pub $HOME/.ssh/known_hosts $HOME/.ssh/config 2>/dev/null || true
  rm /tmp/ssh-keys.tar.gz

  echo "SSH keys installed"
fi

# GPG keys
if [ -f $HOME/.dotfiles/keys/gpg-keys.tar.gz.vault ]; then
  echo "Decrypting GPG keys..."
  ansible-vault decrypt $HOME/.dotfiles/keys/gpg-keys.tar.gz.vault --output /tmp/gpg-keys.tar.gz
  tar xzf /tmp/gpg-keys.tar.gz -C /tmp/
  gpg --import /tmp/gpg-private.asc
  gpg --import /tmp/gpg-public.asc
  rm /tmp/gpg-keys.tar.gz /tmp/gpg-*.asc
  echo "GPG keys imported (may need to set trust levels)"
fi

echo "Secret setup completed"
