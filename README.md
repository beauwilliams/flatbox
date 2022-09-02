# WIP.

Biting the bullet and building my own theme. This is a fork of gruvbox baby.

It is not ready by any means and is just something fun on the side I plan to work on.

My goal is to simplify the design system and link-up the base highlights to plugins.

The hope is that a more predictable, easy to redesign system can emerge, that could be applied to make many themes with ease.


## ⚙️ Installation

```lua
use({'beauwilliams/flatbox'})
...
colorscheme flatbox
```

```vim
Plug 'beauwilliams/flatbox', {'branch': 'main'}
...
colorscheme flatbox
```

![flatbox](https://i.ibb.co/HqbXpZK/Screen-Shot-2022-08-09-at-11-51-21-am.png)

## Statusline

If you want to get the same statusline, try my [statusline plugin](https://github.com/beauwilliams/statusline.lua)

## Legibility Enhancements

```lua
--THICC colomuns between splits
vim.opt.fillchars = {
    horiz = "━",
    horizup = "┻",
    horizdown = "┳",
    vert = "┃",
    vertleft = "┫",
    vertright = "┣",
    verthoriz = "╋"
}
```

## Acknowledgments

- https://github.com/luisiacc/gruvbox-baby

## TODO

Fix illegible escape \ chars when used in json strings
Treesitter
* **@string** -> **jsonTSString** -> **TSString**
* **@string.escape** -> **jsonTSStringEscape** -> **TSStringEscape**
