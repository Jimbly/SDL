libGLOV fork of SDL
========================

Herein lies the version of SDL used by libGLOV for all of [Dashing Strike](http://www.dashingstrike.com)'s PC releases.

Binary releases available [here](https://jimbly.github.io/SDL/)

Primary changes from vanilla SDL (some waiting on SDL bugs to be merged/resolved):
* [Support more than 4 XInput devices by default](https://github.com/Jimbly/SDL/commit/34d34719487cadded2aa9bd3339d0dcc25702c0b) [[SDL Bugtracker](https://bugzilla.libsdl.org/show_bug.cgi?id=4477)]
  * Because we can, and should.  Uses RawInput correlated with XInput.
* [Expose IME candidate list on Windows](https://github.com/Jimbly/SDL/commit/39f1d306eb689842981d29246fcda5fa419b68b1)
  * Useful if you want nice, in-game IME
* [Map all Xbox-like DInput controllers to an appropriate GameController mapping](https://github.com/Jimbly/SDL/commit/dd1262bd8f5db94d8ca943743ec64d3ac08255a5)
  * When XINPUT is disabled (*highly* recommended if you wish to trivially support more than 4 devices without the major change above), this allows all Xbox-y controllers to get reasonable binds
* [Filter out IME-handled key messages when IME is active](https://github.com/Jimbly/SDL/commit/96b6bab636bf4b1499b9d99e2c1a7292b51ae7b0)
  * Otherwise you get double key events when the user is using IME
* [Safer Math defines](https://github.com/Jimbly/SDL/commit/2e42806dbca55a22b5b15a4a5becc779f2118735)
  * Avoid compiler errors if you include both SDL and math.h with _USE_MATH_DEFINES set
* [Allow setting wndproc even if SDL creates the window](https://github.com/Jimbly/SDL/commit/a28601f1075b1a3b79a757baef755bc17367a8ed)
  * Useful for tricky stuff and debuggery
* [Allow building static libs](https://github.com/Jimbly/SDL/commit/cd35fe34d8f3aba726de37b445f3c0a55a68e4a5)
  * This allows for much smaller binaries, with fewer dependencies

* [Fix polling left trigger reporting right trigger's values](https://github.com/Jimbly/SDL/commit/3079b68cf56fe275b6bd8f5fcc2d934d42cd46f1) - ~~[[SDL Bugtracker](https://bugzilla.libsdl.org/show_bug.cgi?id=4547)]~~
  * Makes the polling joystick API more consistent with the evented API
* [Fix unsupported format string in SetDIerror](https://github.com/Jimbly/SDL/commit/9e4c82f49c4410c9981999003ecebda81801c5b4) ~~[[SDL Bugtracker](https://bugzilla.libsdl.org/show_bug.cgi?id=4548)]~~
  * Don't silently discard DirectInput error codes
