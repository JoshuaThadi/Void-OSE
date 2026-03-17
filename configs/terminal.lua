local terminal_setup = {
  name = "terminal-setup",
  type = "directory",
  children = {
    {
      name = "shells",
      type = "directory",
      children = {
        {
          name = "zsh",
          type = "directory",
          children = {
            { name = ".zshrc", type = "file" },
            { name = "themes", type = "directory", children = {} },
          },
        },
        {
          name = "fish",
          type = "directory",
          children = {
            { name = "config.fish", type = "file" },
          },
        },
        {
          name = "bash",
          type = "directory",
          children = {
            { name = ".bashrc", type = "file" },
          },
        },
      },
    },
    {
      name = "prompts",
      type = "directory",
      children = {
        {
          name = "oh-my-posh",
          type = "directory",
          children = {
            { name = "themes", type = "directory", children = {} },
          },
        },
        {
          name = "powerlevel10k",
          type = "directory",
          children = {
            { name = ".p10k.zsh", type = "file" },
          },
        },
        {
          name = "starship",
          type = "directory",
          children = {
            { name = "starship.toml", type = "file" },
          },
        },
      },
    },
    {
      name = "tools",
      type = "directory",
      children = {
        { name = "fzf", type = "directory", children = {} },
        { name = "bat", type = "directory", children = {} },
        { name = "exa", type = "directory", children = {} },
        { name = "tldr", type = "directory", children = {} },
      },
    },
    {
      name = "fonts",
      type = "directory",
      children = {
        { name = "nerd-fonts-install.md", type = "file" },
      },
    },
  },
}

├── shells/
│   ├── zsh/
│   │   ├── .zshrc
│   │   └── themes/
│   ├── fish/
│   │   └── config.fish
│   └── bash/
│       └── .bashrc
├── prompts/
│   ├── oh-my-posh/
│   │   └── themes/
│   ├── powerlevel10k/
│   │   └── .p10k.zsh
│   └── starship/
│       └── starship.toml
├── tools/
│   ├── fzf/
│   ├── bat/
│   ├── exa/
│   └── tldr/
└── fonts/
    └── nerd-fonts-install.md
