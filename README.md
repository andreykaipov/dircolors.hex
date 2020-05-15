## what is this?

It's a wrapper around the
[dircolors(1)](https://www.gnu.org/software/coreutils/manual/coreutils.html#dircolors-invocation)
GNU core utility, allowing users to set up their terminal for colored output
from `ls` or any other external program that uses the `LS_COLORS` environment
variable to color output.

Specification is the same as https://linux.die.net/man/5/dir_colors, but with
the ability to specify hex color codes for the foreground and backgrounds of
files. This is easier understood with an example. To highlight executables with
a vampirish black foreground and a lime green background, instead of writing:

```dircolors
EXEC 38;2;8;8;8;48;2;50;205;50
```

We can write:

```dircolors
EXEC #080808 #32CD32
```

And that's it. The wrapper just converts any 3 or 6 digit hex color code to the
corresponding ANSI escaped RGB color sequence to be used with terminals
supporting [24-bits of
color](https://en.wikipedia.org/wiki/ANSI_escape_code#24-bit).

## how do i use it

todo

## dependencies

- A POSIX-compliant shell

- GNU AWK or an AWK compiled with the `non-decimal-data` extension (e.g. like
  the AWK included with BusyBox)

## why?

Personally I think it's easier maintaining colors in hex, especially since so
many editors support previewing hex colors over ANSI escaped color sequences out
of the box.

## limitations

- You can't specify just a background, i.e. if you want to specify
  a background, you must specify a foreground too.
