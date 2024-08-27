#!/bin/zsh
## define custom functions below.

# colmap: prints a reference for 256-bit terminal color codes.
colmap() {for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done}

replem() {
	$HOME/builds/lem-repl/lem "$@" --eval "(lem-lisp-mode:start-lisp-repl t)"
}

lem-tui() {
	$HOME/builds/lem-repl/lem "$@"
}

fierce() {
	python $HOME/builds/fierce/fierce/fierce.py "$@"
}

villain() {
	python $HOME/builds/Villain/Villain.py "$@"
}
