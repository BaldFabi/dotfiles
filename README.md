# dotfiles

> This playbook is tested on Ubuntu 22.04 (WSL) and Mac OS Ventura (Apple Silicon)

## Requirements

- Ansible (`python3 -m pip install -r requirements.txt`)

### Mac

You have to install [Homebrew](https://brew.sh). [Homebrew](https://brew.sh) is currently not included (Couldn't get it working).

## Execute

> Sudo permissions needed (`-K`)

```sh
ansible-playbook -K playbook.yml
```
