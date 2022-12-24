## Name

Repl::Tools -- Some simple tools to accompany Raku's built-in repl statement.

## Description

These are some simple tools to improve the experience of using
the built-in `repl` to debug a raku program.

Currently, there are two tools:

*  `w` : show information about the current file and stack.
*  `qq` : quit the repl and also exit the current process

## Example

Write a program that calls `repl` at some point:

```
use Repl::Tools;

sub hello {
  world;
}

sub world {
  my $x = 10;
  say "x is $x";
  repl;
}

hello;
```

Then, run the program, and type `w` to see where you are.

```
$ raku eg/hello.raku
x is 10
Type 'exit' to leave
> w

--- current stack ---
  in sub world at eg/hello.raku line 12
  in sub hello at eg/hello.raku line 6


-- current file (eg/hello.raku) --
   3 | use Repl::Tools;
   4 |
   5 | sub hello {
   6 |   world;
   7 | }
   8 |
   9 | sub world {
  10 |   my $x = 10;
  11 |   say "x is $x";
  12 >   repl;
  13 | }
  14 |
  15 | hello;
  16 |
```

That's it!

## Author

Brian Duggan (bduggan at matatu.org)

