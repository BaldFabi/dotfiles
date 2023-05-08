# dotfiles

> This playbook is tested on Ubuntu 22.04 (WSL) and Mac OS Ventura (Apple Silicon)

## IMPORTANT

These "dotfiles" are not the typical dotfiles you might expect.
Don't get me wrong the dotfiles are also included but this playbook will install all the necessary tools I need for work on Linux and Mac OS.

## Requirements

- Ansible (`python3 -m pip install -r requirements.txt`)

### Mac

You have to install [Homebrew](https://brew.sh). [Homebrew](https://brew.sh) is currently not included (Couldn't get it working).

## Execute

> Sudo permissions needed (`-K`)

```sh
ansible-playbook -K playbook.yml
```
