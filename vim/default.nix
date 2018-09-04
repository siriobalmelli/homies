# Vim, with a set of extra packages (extraPackages) and a custom vimrc
# (./vimrc). The final vimrc file is generated by vimUtils.vimrcFile and
# bundles all the packages with the custom vimrc.
{ symlinkJoin, makeWrapper, vim_configurable, vimUtils, vimPlugins, haskellPackages }:
let
  extraPackages = with vimPlugins;
    [
      # TODO: setup ultisnips
      # ghcmod # NOTE: the haskell package for ghc-mod is broken
      ctrlp
      fugitive
      gitgutter
      nerdcommenter
      nerdtree
      surround
      syntastic
      tmux-navigator
      vim-airline
      vim-easymotion
      vim-indent-guides
      vim-markdown
      vim-multiple-cursors
      vim-nix
      vim-trailing-whitespace
      vimproc
      youcompleteme
    ];
  customRC = vimUtils.vimrcFile
    { customRC = builtins.readFile ./vimrc;
      packages.mvc.start = extraPackages;
    };
in
symlinkJoin {
  name = "vim";
  buildInputs = [makeWrapper];
  postBuild = ''
    wrapProgram "$out/bin/vim" \
    --add-flags "-u ${customRC}" \
      --prefix PATH : ${haskellPackages.hasktags}/bin
  '';
  paths = [ vim_configurable ];
}
