#!/bin/bash

if [ "$SHELL" = "/bin/zsh" ]; then
	chsh -s /bin/bash
	echo "*************************************"
    echo "* Changed to bash, please reconnect *"
	echo "*************************************"
fi

if [ "$SHELL" = "/bin/bash" ]; then
	chsh -s /bin/zsh
	echo "*************************************"
    echo "* Changed to zsh, please reconnect  *"
	echo "*************************************"
fi
