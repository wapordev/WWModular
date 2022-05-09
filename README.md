# WWModular

A modular synth written in pico-8

## credits
- design, code: waporwave
- code, optimizations: pancelor

## todo / features

### MODULES
- [ ] adsr backwards
- [x] maths A B input * (-2 to 2) output + etc
- [x] glide module

### FEATURES
- [x] save/load patches
- [x] import custom samples
- [ ] panning
  - need better performance first, probably)
- [ ] save button on tracker
  - probably below the waporware panel, making it shorter
- [ ] clipboard copy paste page
- [x] pause menu option to minimize drawing functions (remove outlines, etc)
- [x] make left bar nicer (remove old controls)
- [x] keyboard on tracker send to track 1 for optional audio feedback (gate too if possible?)
- [x] new i/o system - write module outputs directly to where they're needed; a few TODOs left to do here:
  - [ ] temp_write_i etc
  - [ ] extra mixer elements
  - [ ] why didn't removing wire propagation get as much speedup as expected? probably b/c of tracker/leftbar still using expensive `temp_write_i`?
  - [ ] others?
- [ ] flash wire color when value changes

### BUGS
- [x] can drag wires when changing knobs (edited)

### TECH DEBT
- [ ] ? make output a custom draw module
- [ ] ? make leftbar step() = play()
