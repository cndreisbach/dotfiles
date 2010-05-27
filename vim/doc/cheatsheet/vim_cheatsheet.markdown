# Vim Cheatsheet

## Basic movement
h, l, k, j
: character left, right; line up, down

b, w
: word/token left, right

ge, e
: end of word/token left, right

{, }
: beginning of previous, next paragraph

(, )
: beginning of previous, next sentence

0, ^, $
: beginning, first, last character of line

gg, G
: beginning, end of file

_n_ gg
: go to line _n_

## Insertion & replace
i, a
: insert before, after cursor

I, A
: insert at beginning, end of line

o, O
: open a new line below, above the current line

r _c_
: replace character under cursor with _c_

R
: replace characters starting at the cursor

c _m_
: change text of movement command _m_

cc, S
: change current line

## Deletion
x, X
: delete character under, before cursor

d _m_
: delete text of movement command _m_

dd, D
: delete current line, to end of line

J
: join current line with next

_n_ d
: delete _n_ lines

## Insert mode
^W
: delete word before cursor

^D, ^T
: indent current line left, right

## Lusty Explorer

C-w
: ascend one directory at prompt

C-u
: clear the prompt

C-n, C-p
: select the next, previous match

C-e
: create a new buffer with the given name and path

C-t
: open selected match in new tab

C-o
: open selected match in new horizontal split

C-v
: open selected match in new vertical split

## Rails
[f, :A
: open the alternate file

]f, :R
: open the related file
