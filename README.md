## Enigma

A sample implementation of the [Enigma](http://tutorials.jumpstartlab.com/projects/enigma.html) encryption project at Turing.

This basic encryption engine uses a 2-part key (consisting of a date and
a random key-string) to apply ROT39 to a string. The 39-digit rotation
comes from the character set, which contains the lowercase alphabet,
numbers,space,period and comma.


### Components

##### Enigma

Top-level entry point.

`#encrypt(message,keystring,datestring)` -> encrypted string

`#decrypt(message,keystring,datestring)` -> decrypted string

`#crack(message,datestring)` -> decrypted string; note that message must
end with giveaway characters "..end.." or the decryption will hang when
it gets stuck

##### CharSet

Class for managing the character set. Can `initialize` with a
direction of `:forward` (default) or `:reverse`.

`#char_at(index)` -- gives character at the given position

`#position(char)` -- gives index of the char in the character set

`#length` -- length of the char set (39)

##### DateOffset

Converts date strings into 4-element arrays of numeric offsets.

`#offsets` -- gives numeric offsets for provided date string

##### KeyOffset

Similar to `DateOffset` but for key strings.

##### Key

Handles synthesizing date and key offsets. Given 2 4-element arrays of
offsets, will combine them to get final offset

`.for(keystring,datestring)` - convenience method to convert input
strings into a `Key` with the appropriate offsets

##### Rotator

Given an array of `chars`, array of `offsets`, and a `CharSet`, rotates
the provided characters in chunks of 4 according to the offsets

Rotates forward by default; to rotate backward, provide a reversed
`CharSet` ( `CharSet.new(:reverse)` )

`#rotated_chars` -- returns array of rotated characters

##### OffsetCracker

One of the more complicated classes here; per the assignment we assume
encrypted messages to end with the "giveaway" string "..end.." Using
this info plus a provided date, the `OffsetCracker` can produce a set of
offsets which represent the other side of the encryption (the key).

`#key` -- returns new `Key` object with the appropriate key and date
offsets applied
