# telescope-xc.nvim

![til](./examples/demo.gif)

[![xc compatible](https://xcfile.dev/badge.svg)](https://xcfile.dev)

This is an extension for the telescope neovim plugin. To run `xc` tasks using telescope.

What is `xc`? <https://xcfile.dev/>

What is telescope? <https://github.com/nvim-telescope/telescope.nvim>

## Installation

`xc` should be installed and available in your `PATH`. 

- <https://xcfile.dev/getting-started/#installation>

Use [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "joerdav/telescope-xc.nvim",
    },
    config = function()
        require("telescope").setup()
        require("telescope").load_extension("xc")
        vim.keymap.set('v', '<leader>xc', require("telescope").extensions["xc"].run_task)
    end
}
```

## Tasks

### generate-vhs

Records a VHS.

Needs <https://github.com/charmbracelet/vhs> to run.

```bash
vhs telescope-xc.tape
```

### tag

Deploys a new tag for the repo.

Specify major/minor/patch with VERSION

Inputs: VERSION

```sh
# https://github.com/unegma/bash-functions/blob/main/update.sh

CURRENT_VERSION=`git describe --abbrev=0 --tags 2>/dev/null`
CURRENT_VERSION_PARTS=(${CURRENT_VERSION//./ })
VNUM1=${CURRENT_VERSION_PARTS[0]}
VNUM2=${CURRENT_VERSION_PARTS[1]}
VNUM3=${CURRENT_VERSION_PARTS[2]}

if [[ $VERSION == 'major' ]]
then
  VNUM1=$((VNUM1+1))
  VNUM2=0
  VNUM3=0
elif [[ $VERSION == 'minor' ]]
then
  VNUM2=$((VNUM2+1))
  VNUM3=0
elif [[ $VERSION == 'patch' ]]
then
  VNUM3=$((VNUM3+1))
else
  echo "Invalid version"
  exit 1
fi

NEW_TAG="$VNUM1.$VNUM2.$VNUM3"

echo Adding git tag with version ${NEW_TAG}
git tag ${NEW_TAG}
git push origin ${NEW_TAG}
```

### example

Example task for testing.

```bash
declare -a arr=("world" "xc" "nvim")
for n in "${arr[@]}"
do
    echo "Hello, $n!"
    sleep 1
done
```
