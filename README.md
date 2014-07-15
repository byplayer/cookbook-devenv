# devenv Cookbook
This is cookbook for develop environment.

# Usage

Just include `devenv` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[devenv]"
  ]
}
```


# Requirements
This cookbook depends following cookbooks.

- tmux

# install tools
- `tmux` - virtual window for console.


# tmux
- `default['tmux']['install_method']`
    - `type` - string
    - `default` - source
    - The accept values are `source` or `package`. select install way.
      `source` - installing using source.
      `package` - installing using package.

- `default['tmux']['configure_options']` - The configure option for building tmux. Default value is
                                           %w(--prefix=/opt/tmux).

# Contributing
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

# License and Authors
Copyright (c) 2014 Yukio Goto
This software is released under the MIT License, see LICENSE.txt.
