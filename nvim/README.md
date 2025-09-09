# neovim-config
install packer:
`
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
`
after clone run `:PackerSync`
install rust nightly
build blink.cmp:
`
cd ~/.local/share/nvim/site/pack/packer/start/blink.cmp
cargo build --release
`
install ripgrep for fuzzy finder
install unzip for (Mason dependency)

new stuff

Following
primeagen 0-100 config tutorial
https://www.youtube.com/watch?v=w7i4amO_zaE

TJ blink.cmp setup
https://www.youtube.com/watch?v=Q0cvzaPJJas
