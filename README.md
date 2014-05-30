devenv Cookbook
===============
This is cookbook for develop environment.

Requirements
------------
This cookbook depends following cookbooks.

- tmux

#### install environment
- `tmux` - virtual window for console.


Attributes
----------

| key                               | type   | description                                    | default|
|:----------------------------------|--------|------------------------------------------------|-------:|
| default['tmux']['install_method'] | string | source/package
                                               select install way.                            | source |
|                                   |        | install using source or install using package. |        |

- `default['tmux']['configure_options']` - The configure option for building tmux. Default value is
                                           %w(--prefix=/opt/tmux).


#### devenv::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['devenv']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### devenv::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `devenv` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[devenv]"
  ]
}
```

Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: TODO: List authors
