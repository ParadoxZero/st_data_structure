#!/bin/bash
# setup-ssh.sh: load the SSH key 

set -ev
SSH_FILE=~/.ssh/travis_rsa.pub
# Decrypt the file containing the private key (put the real name of the variables)
openssl aes-256-cbc \
	-K $encrypted_98cebf81b822_key \
	-iv $encrypted_98cebf81b822_iv \
	-in "travis_rsa.pub.enc" \
	-out "$SSH_FILE" -d
# Enable SSH authentication
chmod 600 "$SSH_FILE" \
	&& printf "%s\n" \
	"Host github.com" \
	"  IdentityFile $SSH_FILE" \
	"  LogLevel ERROR" >> ~/.ssh/config