# Mac | OSx tricks

## sudo on OSx: `operation not permitted`

* you need to reboot your mac and press cmd+r when booting up. Then go into utilities > terminal and type the following commands:

```sh
$ csrutil disable
$ reboot 
```

## Mac keyboard tricks

* Home key: `Cmd + ↑`
* End key: `Cmd + ↓`
* PageUp key: `Fn + ↑`
* PageDown key: `Fn + ↓`

## rebinding <CAPSLOCK>

* on OSx you can rebind capslock to a powerful combo: `<crtl>` AND `<esc>`
* `<capslock>` will behave like `<ctrl>` while pressed and will send `<esc>` once released.
* more info [here](http://www.economyofeffort.com/2014/08/11/beyond-ctrl-remap-make-that-caps-lock-key-useful)
* warning: a fast chord press like `<esc>+<cr>` will not work.

## turbocharge keyrepeat

* go to system preferences -> keyboard
* put `key repeat` on fastest
* put `delay until repeat` on shortest
* ???
* profit!
