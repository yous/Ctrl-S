# Ctrl-S

Save the game. Oh, you should.

## Usage

For the task list:

``` sh
rake -T
```

Task          | Description
--------------|--------------------------------------------
`wow:account` | Link the World of Warcraft account settings
`wow:addons`  | Link the World of Warcraft addons

## Custom settings

### World of Warcraft

Set your account info to `config.yml`:

``` yaml
wow_account: "12345678#9"
```

If you installed World of Warcraft to custom path, provide it to `config.yml`:

``` yaml
wow_custom_path:
  windows: "D:/World of Warcraft"
  # mac:
```
