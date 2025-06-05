# dotfiles

> Neill Robson's MacOS configuration files, managed with GNU Stow.

## Usage

1. Install GNU Stow: `brew install stow`

2. Clone this repository.

3. For each application whose dotfiles you want to copy over, run:

    ```
    stow -vRt ~ zsh
    ```

    Where `zsh` is the name of the application (a directory in this repository).

    > [!NOTE]
    > The Stow flags (in declaration order) add verbosity, purge old symlinks, and set the target directory to home.
