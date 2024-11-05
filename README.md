# neorickkk

## installation

### first backup your old config
```bash
mv ~/.config/nvim ~/.config/nvim.backup
rm -rf $HOME/.local/share/nvim
rm -rf $HOME/.local/state/nvim
```

### install Packer as the package manger for this config
```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

then
```bash
git clone --depth 1 https://github.com/mohamidsaiid/neorickkk ~/.config/nvim
```
