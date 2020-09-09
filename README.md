## Dotfiles

My dotfiles are in here. I use `ansible` to configure the machine. The playbook
will take all the dotfiles (located in `files/`) and symlink them into the
home directory.

## Usage

(WIP: Create a script that automatically downloads ansible)
1. Download `ansible`
2. Clone the repo
3. `$ ansible-playbook link.yml`
